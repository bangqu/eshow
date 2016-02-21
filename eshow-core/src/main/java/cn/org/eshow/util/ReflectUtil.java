package cn.org.eshow.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 */
public class ReflectUtil {
	
	private static final Log logger = LogFactory.getLog(ReflectUtil.class);

    /**
     *
     * @param target
     * @param fname
     * @param ftype
     * @param fvalue
     */
	public static void setFieldValue(Object target, String fname, Class<?> ftype, Object fvalue) {
		if (target == null || StringUtils.isBlank(fname) || (fvalue != null && !ftype.isAssignableFrom(fvalue.getClass()))) {
			return;
		}
		Class<?> clazz = target.getClass();
		try {
			Method method = clazz.getDeclaredMethod("set" + Character.toUpperCase(fname.charAt(0)) + fname.substring(1), ftype);
			if (!Modifier.isPublic(method.getModifiers())) {
				method.setAccessible(true);
			}
			method.invoke(target, fvalue);
		} catch (Exception me) {
			if (logger.isDebugEnabled()) {
				logger.debug(me);
			}
			try {
				Field field = clazz.getDeclaredField(fname);
				if (!Modifier.isPublic(field.getModifiers())) {
                    field.setAccessible(true);
				}
				field.set(target, fvalue);
			} catch (Exception fe) {
				if (logger.isDebugEnabled()) {
					logger.debug(fe);
				}
			}
		}
	}

    /**
     *
     * @param target
     * @param fieldName
     * @return
     */
	public static Object getFieldValue(Object target, String fieldName) {
		try {
			Field field = null;
			Class clazz = target.getClass();
			try {
				field = clazz.getField(fieldName);
			} catch (Exception e) {
				field = clazz.getDeclaredField(fieldName);
				field.setAccessible(true);
			}
			return field.get(target);
		} catch (Exception e) {
			return null;
		}
	}
}
