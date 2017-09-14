package cn.org.eshow.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.activation.DataHandler;
import javax.mail.MessagingException;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * Class for sending e-mail messages based on Velocity templates or with attachments.
 *
 * @author Matt Raible
 */
public class MailEngine {
    private final Log log = LogFactory.getLog(MailEngine.class);
    private MailSender mailSender;
    private String defaultFrom;

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void setFrom(String from) {
        this.defaultFrom = from;
    }

    /**
     * Send a simple message with pre-populated values.
     *
     * @param msg the message to send
     * @throws org.springframework.mail.MailException when SMTP server is down
     */
    public void send(SimpleMailMessage msg) throws MailException {
        try {
            mailSender.send(msg);
        } catch (MailException ex) {
            log.error(ex.getMessage());
            throw ex;
        }
    }

    /**
     * Convenience method for sending messages with attachments.
     *
     * @param recipients     array of e-mail addresses
     * @param sender         e-mail address of sender
     * @param resource       attachment from classpath
     * @param bodyText       text in e-mail
     * @param subject        subject of e-mail
     * @param attachmentName name for attachment
     * @throws MessagingException thrown when can't communicate with SMTP server
     */
    public void sendMessage(String[] recipients, String sender, ClassPathResource resource, String bodyText, String subject, String attachmentName) throws MessagingException {
        MimeMessage message = ((JavaMailSenderImpl) mailSender).createMimeMessage();

        // use the true flag to indicate you need a multipart message
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(recipients);

        // use the default sending if no sender specified
        if (sender == null) {
            helper.setFrom(defaultFrom);
        } else {
            helper.setFrom(sender);
        }

        helper.setText(bodyText);
        helper.setSubject(subject);

        helper.addAttachment(attachmentName, resource);

        ((JavaMailSenderImpl) mailSender).send(message);
    }

    /**
     * Convenience method for sending messages with attachments.
     *
     * @param msg SimpleMailMessage
     * @throws MessagingException thrown when can't communicate with SMTP server
     */
    public void sendHTML(SimpleMailMessage msg) throws MessagingException {
        MimeMessage message = ((JavaMailSenderImpl) mailSender)
                .createMimeMessage();
        message.setHeader("Content-Transfer-Encoding", "utf-8");
        // use the true flag to indicate you need a multipart message
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(msg.getTo());

        // use the default sending if no sender specified
        if (msg.getFrom() == null) {
            helper.setFrom(defaultFrom);
        } else {
            helper.setFrom(msg.getFrom());
        }

        MimeMultipart mm = new MimeMultipart();
        MimeBodyPart mbp = new MimeBodyPart();
        DataHandler dh = new DataHandler(msg.getText(), "text/html; charset=utf-8");
        mbp.setDataHandler(dh);
        mm.addBodyPart(mbp);
        message.setContent(mm);

        helper.setText(msg.getText());
        helper.setSubject(msg.getSubject());

        ((JavaMailSenderImpl) mailSender).send(message);
    }

}
