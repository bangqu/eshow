package cn.org.eshow.exception;

public class ParseException extends AppException {

	private static final long serialVersionUID = 2282710611790195063L;
	
	public ParseException(String message) {
		super(message);
	}
	
	public ParseException(String text,String message) {
		fillInStackTrace();
		message = "信息: "+text+"  ***** "+message;
	}
}
