package cn.org.eshow.exception;

/**
 * The class <code>AppException</code> and its subclasses are a form of
 * application exception that indicates conditions that current system
 * might want to catch and is able to recover from this situation.
 * <p/>
 * <p/>
 * When we process exception, we can call below methods:
 * <pre>
 * <code>getMessage()</code> for exception ID
 * <code>getErrorLevel()</code> for exception severity level
 * <code>getCause()</code> for root cause
 * </pre>
 *
 * @author legend
 */
public class AppException extends Exception {

    private static final long serialVersionUID = -2299978645662041500L;
    private ErrorLevel errorLevel;
    private Object[] arguments;

    public AppException() {
        super();
    }

    public AppException(String message) {
        super(message);
    }

    public AppException(Throwable cause) {
        super(cause);
    }

    public AppException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * Constructs an AppException with exception ID and error level
     *
     * @param message    The exception ID, then retrieve detailed error message based on it
     * @param errorLevel The error level used for monitoring
     */
    public AppException(String message, ErrorLevel errorLevel) {
        super(message);
        this.errorLevel = errorLevel;
    }

    /**
     * Constructs an AppException with exception ID, root cause and error leve
     *
     * @param message    The exception ID, which is used to get detailed error message
     * @param cause      The root cause (stack trace)
     * @param errorLevel The error level used for monitoring
     */
    public AppException(String message, Throwable cause, ErrorLevel errorLevel) {
        super(message, cause);
        this.errorLevel = errorLevel;
    }

    /**
     * Returns <code>ErrorLevel</code> of this exception
     *
     * @return The error level
     */
    public ErrorLevel getErrorLevel() {
        return errorLevel;
    }

    /**
     * Set error level
     *
     * @param errorLevel The errorLevel to set for this AppException
     */
    public void setErrorLevel(ErrorLevel errorLevel) {
        this.errorLevel = errorLevel;
    }

    /**
     * @return Returns the arguments.
     */
    public Object[] getArguments() {
        return arguments;
    }

    /**
     * @param arguments The arguments to set.
     */
    public void setArguments(Object[] arguments) {
        this.arguments = arguments;
    }

}
