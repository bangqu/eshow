package cn.org.eshow.webapp.listener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.mail.SimpleMailMessage;

import cn.org.eshow.common.CommonVar;
import cn.org.eshow.service.MailEngine;

/**
 * 
 * 发送邮件线程
 * 
 * @author leida
 */
public class SendEmailListener extends Thread {

	private static final Log log = LogFactory.getLog(SendEmailListener.class);

	private MailEngine mailEngine;

	public SendEmailListener() {
		start();
	}

	public synchronized void run() {
		try {
			Thread.sleep(1000 * 60);
			log.debug("Send Email listener Start successful!");
			while (true) {
				if (!CommonVar.MAIL_SEND_LIST.isEmpty()) {
					for (int i = 0; i < CommonVar.MAIL_SEND_LIST.size();) {
						SimpleMailMessage mailMessage = CommonVar.MAIL_SEND_LIST.get(i);
						mailEngine.sendHTML(mailMessage);
						log.debug("Send successful:" + mailMessage.getSubject());
						CommonVar.MAIL_SEND_LIST.remove(i);
						Thread.sleep(1000 * 1);
					}
				}
				Thread.sleep(1000 * 3);
			}

		} catch (Exception e) {
			System.out.println("SendEmailListener.run() exception");
		}
	}

	public MailEngine getMailEngine() {
		return mailEngine;
	}

	public void setMailEngine(MailEngine mailEngine) {
		this.mailEngine = mailEngine;
	}

}
