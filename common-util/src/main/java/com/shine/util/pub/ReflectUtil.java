package com.shine.util.pub;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang.StringUtils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 反射工具类
 * @author:Fisher
 * @email:zhuangcaijin@126.com
 * @version Revision 2.0.0
 */
public class ReflectUtil {
	/**
	 * 给属性设值
	 * @param target 目标对象
	 * @param fname 目标方法名
	 * @param ftype 参数类型
	 * @param fvalue 参数值
	 * @author:Fisher
     * @email:zhuangcaijin@126.com
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void setFieldValue(Object target, String fname, Class ftype, Object fvalue) {
		if (target == null || fname == null || fname.trim().length() == 0 || (fvalue != null && !ftype.isAssignableFrom(fvalue.getClass()))) {
			return;
		}
		Class clazz = target.getClass();
		try {
			Method method = clazz.getMethod("set" + Character.toUpperCase(fname.charAt(0)) + fname.substring(1), new Class[] { ftype });
			if (!Modifier.isPublic(method.getModifiers())) {
				method.setAccessible(true);
			}
			method.invoke(target, new Object[] { fvalue });

		} catch (Exception me) {

			try {
				Field field = clazz.getDeclaredField(fname);
				if (!Modifier.isPublic(field.getModifiers())) {
					field.setAccessible(true);
				}
				field.set(target, fvalue);
			} catch (Exception fe) {

				throw new RuntimeException(fe.getMessage(), fe);
			}
		}
	}

	/**
	 * 调用方法
	 * @param target 目标对象
	 * @param methodName 方法名
	 * @param params 参数
	 * @return 方法返回值
	 * @author:Fisher
	 * @email:zhuangcaijin@126.com
	 */
	public static Object invokeMethod(Object target, String methodName, Object... params) {
		Method method;
		try {
			method = target.getClass().getMethod(methodName);
			return method.invoke(target, params);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 获取字段值
	 * @param target 目标对象
	 * @param field 字段名
	 * @return 字段值
	 * @author:Fisher
	 * @email:zhuangcaijin@126.com
	 */
	public static Object getFieldValue(Object target, String field) {
		String fieldName = "get" + Character.toUpperCase(field.charAt(0)) + field.substring(1);
		if (target != null) {
			return invokeMethod(target, fieldName, new Object[0]);
		}
		return null;
	}

	/**
	 * 根据map设置对象，并返回对象,T为要设置的对象或者对象的Class
	 * @param param 参数集合
	 * @param target 需要填充的实体
	 * @return 实体
	 * @throws Exception
	 * @author:Fisher
	 * @email:zhuangcaijin@126.com
	 */
	public static <T> Object getBean(Map<String, ?> param, T target) throws Exception {
		Object result = null;
		Class superClass = null;
		Field[] field = null;
		List<Field> fields = new ArrayList<Field>();
		if (param != null && !param.isEmpty() && target != null) {
			if (target instanceof Class) {
				field = ((Class) target).getDeclaredFields();// 本类的所有字段
				fields.addAll(Arrays.asList(field));
				// 父类的字段
				superClass = ((Class) target).getSuperclass();
				while (superClass != null) {
					field = superClass.getDeclaredFields();
					fields.addAll(Arrays.asList(field));
					superClass = superClass.getSuperclass();
				}
				result = ((Class) target).newInstance();
			} else {
				field = target.getClass().getDeclaredFields();
				fields.addAll(Arrays.asList(field));
				// 父类字段
				superClass = target.getClass().getSuperclass();
				while (superClass != null) {
					field = superClass.getDeclaredFields();
					fields.addAll(Arrays.asList(field));
					superClass = superClass.getSuperclass();
				}
				result = target;
			}
			//
			Set<String> set = param.keySet();
			for (String key : set) {
				for (Field f : fields) {
					// key中存在与对象字段相同的
					if (key.equalsIgnoreCase(f.getName())) {
						// 如果对象的值为空或者为空字符串则返回null，否则则进行类型转换
						Object keys = param.get(key);
						keys = keys == null ? null : ("".equals(keys.toString()) ? null : ConvertUtils.convert(keys, f.getType()));
						ReflectUtil.setFieldValue(result, f.getName(), f.getType(), keys);
						break;
					}
				}
			}
		}
		return result;
	}

	/**
	 * 将List<Map>转为List对象集合
	 * @param map 传入的List<Map>
	 * @param clazz 指定类型
	 * @return 转化后的list
	 * @throws Exception
	 * @author:Fisher
	 * @email:zhuangcaijin@126.com
	 */
	public static <T> List<T> getMap2List(List<? extends Map> map, Class<T> clazz) throws Exception {
		List<T> list = new ArrayList<T>();
		if (map != null && !map.isEmpty()) {
			for (Map m : map) {
				list.add((T) getBean(m, clazz));
			}
		}
		return list;
	}

	/**
	 * 根据Map返回指定的List
	 * @param param 参数集合
	 * @param target 要返回的List的类型
	 * @param prefix 前缀
	 * @return 指定类型list
	 * @throws Exception
	 * @author:Fisher
     * @email:zhuangcaijin@126.com
	 */
	//TODO
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static <T> List<T> getListBean(Map<String, ?> param, Class<T> target, String prefix) throws Exception {
		List<T> result = new ArrayList<T>();
		Map map = new HashMap();
		boolean hasPrefix = StringUtils.isBlank(prefix);
		String regex = hasPrefix ? "\\w*\\[\\d+\\]" : prefix + "\\.\\w*\\[\\d+\\]";// 用于判断是否属于下标（前缀)同一组的map，起过滤数据作用
		String index = "\\[\\d+\\]";
		Pattern p = Pattern.compile(index);
		if (param != null && !param.isEmpty() && target != null) {
			Set<String> set = param.keySet();
			for (String item : set) {
				// 包含数组下标格式的Key
				if (item.matches(regex)) {
					map.put(!hasPrefix ? item.replace(prefix + ".", "") : item, param.get(item));
				}
			}
			while (!map.isEmpty()) {
				Map temp = new HashMap();// 临时map
				Object[] mapSet = map.keySet().toArray();
				Matcher m = p.matcher(mapSet[0].toString());// 匹配字符转中的[\d]
				String match = m.find() ? m.group() : "";// 存在则返回相应的字符串
				temp.put(mapSet[0].toString().replaceAll(index, ""), ((String[]) map.remove(mapSet[0]))[0]);// 添加到临时map中并移除
				for (int i = 1, size = mapSet.length; i < size; i++) {
					String key;
					String value;
					if (mapSet[i].toString().contains(match)) {// 如果存在相同的[\d]
						key = mapSet[i].toString().replaceAll(index, "");// 去除后缀
						value = ((String[]) map.remove(mapSet[i]))[0];// 从原map中移除
						temp.put(key, value);// 添加到临时map中
					}
				}
				result.add((T) getBean(temp, target));// 设置对象属性，并返回相应对象
			}
		}
		return result;
	}
}
