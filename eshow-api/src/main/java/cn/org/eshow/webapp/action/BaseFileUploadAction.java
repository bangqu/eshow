package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import org.apache.struts2.ServletActionContext;

import java.io.*;

/**
 * Sample action that shows how to do file upload with Struts 2.
 */
public class BaseFileUploadAction<T> extends ApiBaseAction<T> {
    private static final long serialVersionUID = -9208910183310010569L;
    protected File file;
    protected String fileContentType;
    protected String fileFileName;
    protected String name;

    /**
     * Upload the file
     * @return String with result (cancel, input or sucess)
     * @throws Exception if something goes wrong
     */
    public String upload() throws Exception {

        // the directory to upload to
        String uploadDir = ServletActionContext.getServletContext().getRealPath("/resources")
                + "/" + getRequest().getRemoteUser() + "/";

        // write the file to the file specified
        File dirPath = new File(uploadDir);

        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }

        //retrieve the file data
        InputStream stream = new FileInputStream(file);

        //write the file to the file specified
        OutputStream bos = new FileOutputStream(uploadDir + fileFileName);
        int bytesRead;
        byte[] buffer = new byte[8192];

        while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
            bos.write(buffer, 0, bytesRead);
        }

        bos.close();
        stream.close();

        // place the data into the request for retrieval on next page
        getRequest().setAttribute("location", dirPath.getAbsolutePath()
                + Constants.FILE_SEP + fileFileName);

        String link = getRequest().getContextPath() + "/resources" + "/"
                + getRequest().getRemoteUser() + "/";

        getRequest().setAttribute("link", link + fileFileName);

        return SUCCESS;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public File getFile() {
        return file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    @Override
    public void validate() {
//        if (getRequest().getMethod().equalsIgnoreCase("post")) {
//            getFieldErrors().clear();
//            if ("".equals(fileFileName) || file == null) {
//                super.addFieldError("file", getText("errors.requiredField", new String[] {getText("uploadForm.file")}));
//            } else if (file.length() > 2097152) {
//                addActionError(getText("maxLengthExceeded"));
//            }
//        }
    }
}
