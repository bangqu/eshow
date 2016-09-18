package cn.org.eshow.exception;

/**
 * Http exception - occures during http requests.
 */
public class HttpException extends AppException {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public HttpException() {
        super();
    }

    public HttpException(String message) {
        super(message);
    }

    public HttpException(Throwable cause) {
        super(cause);
    }

    public HttpException(String message, Throwable cause) {
        super(message, cause);
    }

}
