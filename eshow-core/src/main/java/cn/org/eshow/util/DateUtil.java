package cn.org.eshow.util;

import cn.org.eshow.Constants;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.i18n.LocaleContextHolder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Date Utility Class used to convert Strings to Dates and Timestamps
 * 
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a> Modified by <a href="mailto:dan@getrolling.com">Dan Kibler </a> to correct time pattern. Minutes should be mm not MM (MM is month).
 */
public class DateUtil {
	private static Log log = LogFactory.getLog(DateUtil.class);
	private static final String TIME_PATTERN = "HH:mm";

	/**
	 * Checkstyle rule: utility classes should not have public constructor
	 */
	public DateUtil() {}

	/**
	 * Return default datePattern (MM/dd/yyyy)
	 * 
	 * @return a string representing the date pattern on the UI
	 */
	public static String getDatePattern() {
		Locale locale = LocaleContextHolder.getLocale();
		String defaultDatePattern;
		try {
			defaultDatePattern = ResourceBundle.getBundle(Constants.BUNDLE_KEY, locale).getString(
					"date.format");
		}
		catch (MissingResourceException mse) {
			defaultDatePattern = "yyyy-MM-dd";
		}
		return defaultDatePattern;
	}

	public static String getDateTimePattern() {
		return DateUtil.getDatePattern() + " HH:mm:ss.S";
	}

	public static String getDateTimePatternNormal() {
		return DateUtil.getDatePattern() + " HH:mm:ss";
	}
	/**
	 * convert date to yyyy-MM-dd HH:mm:ss
	 * @param aDate
	 * @return
	 */
	public static String getDateNormal(Date aDate) {
		SimpleDateFormat df;
		String returnValue = "";

		if (aDate != null) {
			df = new SimpleDateFormat(getDateTimePatternNormal());
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}
	/**
	 * This method attempts to convert an Oracle-formatted date in the form dd-MMM-yyyy to mm/dd/yyyy.
	 * 
	 * @param aDate date from database as a string
	 * @return formatted string for the ui
	 */
	public static String getDate(Date aDate) {
		SimpleDateFormat df;
		String returnValue = "";

		if (aDate != null) {
			df = new SimpleDateFormat(getDatePattern());
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}

	/**
	 * This method generates a string representation of a date/time in the format you specify on input
	 * 
	 * @param aMask the date pattern the string is in
	 * @param strDate a string representation of a date
	 * @return a converted Date object
	 * @see java.text.SimpleDateFormat
	 * @throws ParseException when String doesn't match the expected format
	 */
	public static Date convertStringToDate(String aMask, String strDate) throws ParseException {
		SimpleDateFormat df;
		Date date;
		if(strDate.length()>10)
		{
			aMask +=" HH:mm:ss";
		}
		df = new SimpleDateFormat(aMask);

		if (log.isDebugEnabled()) {
			log.debug("converting '" + strDate + "' to date with mask '" + aMask + "'");
		}
		

		try {
			date = df.parse(strDate);
		}
		catch (ParseException pe) {
			// log.error("ParseException: " + pe);
			throw new ParseException(pe.getMessage(), pe.getErrorOffset());
		}

		return (date);
	}

	/**
	 * This method returns the current date time in the format: MM/dd/yyyy HH:MM a
	 * 
	 * @param theTime the current time
	 * @return the current date/time
	 */
	public static String getTimeNow(Date theTime) {
		return getDateTime(TIME_PATTERN, theTime);
	}

	/**
	 * This method returns the current date in the format: MM/dd/yyyy
	 * 
	 * @return the current date
	 * @throws ParseException when String doesn't match the expected format
	 */
	public static Calendar getToday() throws ParseException {
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat(getDatePattern());

		// This seems like quite a hack (date -> string -> date), but it works ;-)
		String todayAsString = df.format(today);
		Calendar cal = new GregorianCalendar();
		cal.setTime(convertStringToDate(todayAsString));

		return cal;
	}

	/**
	 * This method generates a string representation of a date's date/time in the format you specify on input
	 * 
	 * @param aMask the date pattern the string is in
	 * @param aDate a date object
	 * @return a formatted string representation of the date
	 * @see java.text.SimpleDateFormat
	 */
	public static String getDateTime(String aMask, Date aDate) {
		SimpleDateFormat df = null;
		String returnValue = "";

		if (aDate == null) {
			log.error("aDate is null!");
		}
		else {
			df = new SimpleDateFormat(aMask);
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}

	/**
	 * This method generates a string representation of a date based on the System Property 'dateFormat' in the format
	 * you specify on input
	 * 
	 * @param aDate A date to convert
	 * @return a string representation of the date
	 */
	public static String convertDateToString(Date aDate) {
		return getDateTime(getDatePattern(), aDate);
	}

	/**
	 * This method converts a String to a date using the datePattern
	 * 
	 * @param strDate the date to convert (in format MM/dd/yyyy)
	 * @return a date object
	 * @throws ParseException when String doesn't match the expected format
	 */
	public static Date convertStringToDate(String strDate) throws ParseException {
		Date aDate = null;
		try {
			if (log.isDebugEnabled()) {
				log.debug("converting date with pattern: " + getDatePattern());
			}

			aDate = convertStringToDate(getDatePattern(), strDate);
		}
		catch (ParseException pe) {
			log.error("Could not convert '" + strDate + "' to a date, throwing exception");
			pe.printStackTrace();
			throw new ParseException(pe.getMessage(), pe.getErrorOffset());
		}

		return aDate;
	}

    /**
     * 判断是否在今天之前
     * @param date
     * @return Boolean
     */
	public static Boolean isBeforeToday(Date date) {
		Long dateTime = date.getTime();
		Long startTodayTime = getStartOfToday().getTime();
		if(dateTime<startTodayTime){
			return true;
		}
		else{
			return false;
		}
	}

    /**
     * 今天的开始时间
     * @return 时间
     */
    public static Date getStartOfToday() {
        Calendar today = Calendar.getInstance();
        int year = today.get(Calendar.YEAR);
        int month = today.get(Calendar.MONTH);
        int day = today.get(Calendar.DAY_OF_MONTH);
        return new GregorianCalendar(year, month, day, 0, 0, 0).getTime();
    }

    /**
     * 今天的结束时间
     * @return 时间
     */
	public static Date getEndOfToday() {
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH);
		int day = today.get(Calendar.DAY_OF_MONTH);
		return new GregorianCalendar(year, month, day, 23, 59, 59).getTime();
	}
	
	/**
	 * 时间加减运算<br>
	 * java中对日期的加减操作<br>
	 * gc.add(1,-1)表示年份减一.<br>
	 * gc.add(2,-1)表示月份减一.<br>
	 * gc.add(3.-1)表示周减一.<br>
	 * gc.add(5,-1)表示天减一.<br>
	 * 以此类推应该可以精确的毫秒吧.没有再试.大家可以试试.<br>
	 * GregorianCalendar类的add(int field,int amount)方法表示年月日加减.<br>
	 * field参数表示年,月.日等.<br>
	 * amount参数表示要加减的数量.<br>
	 * 
	 * @param date
	 * @param pattern
	 * @param category 运算种类，例如：天之间运算，月之间运算
	 * @param number 正数代表加、负数代表减
	 * @return String
	 */
	public final static String calcDate(Date date, String pattern, int category, int number) {
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(date);
		gc.add(category, number);
		gc.set(gc.get(Calendar.YEAR), gc.get(Calendar.MONTH), gc.get(Calendar.DATE));
		return convertDateToString(gc.getTime());
	}

	/**
	 * 时间计算
	 */
	public final static Date calcDate(Date date, int year, int month, 
			int day, int hour, int minute, int sec){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.YEAR, year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DAY_OF_MONTH, day);
		cal.add(Calendar.HOUR_OF_DAY, hour);
		cal.add(Calendar.MINUTE, minute);
		cal.add(Calendar.SECOND, sec);
		return cal.getTime();
	}

    /**
     * 测试主方法
     * @param args
     */
	public static void main(String[] args) {
		Date date = calcDate(new Date(),1,2,15,20,30,54);
		System.out.println(date);
		String date2 = calcDate(new Date(),"yyyy-MM-dd HH:mm:ss",5,3);
		try {
			Date d = convertStringToDate(date2);
			System.out.println(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
