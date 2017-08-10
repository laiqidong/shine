package com.shine.util.pub;


import com.shine.util.SystemConstants;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

/**
 * 共通工具类
 * @author wucx
 * 
 */
public class PubUtil {
    
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    /**
     * @param request
     * @return
     * @author:Fisher
     * @email:zhuangcaijin@126.com
     * @创建日期:2014-10-22
     * @功能说明：web根目录的本地路径
     */
    public static String getWebRoot(HttpServletRequest request) {
        String webRoot = request.getSession().getServletContext().getRealPath("/");
        return webRoot;
    }
    
    
	/**
	 * 检查传入的参数是否为空。
	 * 
	 * @return boolean 如果被检查值为null，返回true。 
	 * 如果value的类型为String，并且value.length()为0，返回true。
	 * 如果value的类型为Object[]，并且value.length为0，返回true。
	 * 如果value的类型为Collection，并且value.size()为0，返回true。
	 * 如果value的类型为Dictionary，并且value.size()为0，返回true。 
	 * 如果value的类型为Map，并且value.size()为0，返回true。 
	 * 否则返回false。
	 * @param value
	 *            被检查值。
	 */
	public static boolean isEmpty(Object value) {
		if (value == null){
			return true;
		}
		if ((value instanceof String) && (((String) value).trim().length() <= 0)){
			return true;
		}
        if ((value instanceof Object[]) && (((Object[]) value).length <= 0)) {
            return true;
        }
        //判断数组中的值是否全部为空null.
		if (value instanceof Object[]) {
            Object[] t = (Object[]) value;
            for (int i = 0; i < t.length; i++) {
                if (t[i] != null) {
                    return false;
                }
            }
            return true;
        }
		if ((value instanceof Collection) && ((Collection) value).size() <= 0){
			return true;
		}
		if ((value instanceof Dictionary) && ((Dictionary) value).size() <= 0){
			return true;
		}
		if ((value instanceof Map) && ((Map) value).size() <= 0){
			return true;
		}
		return false;
	}
	
	public static boolean isNotEmpty(Object value) {
		return !PubUtil.isEmpty(value);
	}

	/** 
     * 利用反射实现对象之间属性复制 
     * @param from 
     * @param to 
     */  
    public static void copyProperties(Object from, Object to) {
        try {
			copyPropertiesExclude(from, to, null);
		} catch (Exception e) {
		    e.printStackTrace();
		}  
    }  
      
    /** 
     * 复制对象属性 
     * @param from 
     * @param to 
     * @param excludsArray 排除属性列表 
     * @throws Exception
     */  
    @SuppressWarnings("unchecked")
    public static void copyPropertiesExclude(Object from, Object to, String[] excludsArray) throws Exception {
        List<String> excludesList = null;
        if(excludsArray != null && excludsArray.length > 0) {  
            excludesList = Arrays.asList(excludsArray); //构造列表对象
        }  
        Method[] fromMethods = from.getClass().getDeclaredMethods();
        if (PubUtil.isEmpty(fromMethods))
        	fromMethods = from.getClass().getSuperclass().getDeclaredMethods();
        
        Method[] toMethods = to.getClass().getDeclaredMethods();
        if (PubUtil.isEmpty(toMethods))
        	toMethods = to.getClass().getSuperclass().getDeclaredMethods();
        
        Map<String, Method> toMethodMap = Hashlize.hashlizeMap(toMethods, new HashKeyAdapter(new String[]{"name"}));
        
        if (PubUtil.isEmpty(fromMethods) || PubUtil.isEmpty(toMethodMap))
        	return ;
        
        Method fromMethod = null, toMethod = null;
        String fromMethodName = null, toMethodName = null;
        for (int i = 0; i < fromMethods.length; i++) {  
            fromMethod = fromMethods[i];  
            fromMethodName = fromMethod.getName();  
            if (!fromMethodName.contains("get"))  
                continue;  
            
            //排除列表检测  
            if(excludesList != null && excludesList.contains(fromMethodName.substring(3).toLowerCase())) {  
                continue;  
            }  
            
            toMethodName = "set" + fromMethodName.substring(3);  
            toMethod = toMethodMap.get(toMethodName);  
            if (toMethod == null)  
                continue;
            
            Object value = fromMethod.invoke(from, new Object[0]);
            if(value == null)  
                continue;  
            
            //集合类判空处理  
            if(value instanceof Collection) {
                Collection newValue = (Collection)value;
                if(newValue.size() <= 0)  
                    continue;  
            }  
            
            toMethod.invoke(to, new Object[] {value});
        }  
    }  
      
    /** 
     * 对象属性值复制，仅复制指定名称的属性值 
     * @param from 
     * @param to 
     * @param includsArray 
     * @throws Exception
     */  
    @SuppressWarnings("unchecked")
    public static void copyPropertiesInclude(Object from, Object to, String[] includsArray) throws Exception {
        List<String> includesList = null;
        if(includsArray != null && includsArray.length > 0) {  
            includesList = Arrays.asList(includsArray); //构造列表对象
        } else {  
            return;  
        }  
        
        Method[] fromMethods = from.getClass().getDeclaredMethods();
        Map<String, Method> toMethodMap = Hashlize.hashlizeMap(to.getClass().getDeclaredMethods(), new HashKeyAdapter(new String[]{"name"}));
        Method fromMethod = null, toMethod = null;
        String fromMethodName = null, toMethodName = null;
        for (int i = 0; i < fromMethods.length; i++) {  
            fromMethod = fromMethods[i];  
            fromMethodName = fromMethod.getName();  
            if (!fromMethodName.contains("get"))  
                continue; 
            
            //排除列表检测  
            String str = fromMethodName.substring(3);
            if(!includesList.contains(str.substring(0,1).toLowerCase() + str.substring(1))) {  
                continue;  
            }  
            
            toMethodName = "set" + fromMethodName.substring(3);  
            toMethod = toMethodMap.get(toMethodName);  
            if (toMethod == null)  
                continue;  
            Object value = fromMethod.invoke(from, new Object[0]);
            if(value == null)  
                continue;  
            
            //集合类判空处理  
            if(value instanceof Collection) {
                Collection newValue = (Collection)value;
                if(newValue.size() <= 0)  
                    continue;  
            }  
            toMethod.invoke(to, new Object[] {value});
        }  
    }  
      
  

    
    /**
     * map按key值复值value到类属性
     * @param from
     * @param to
     * @throws Exception
     */
    public static void copyProperties(Map from, Object to) {
    	if (PubUtil.isEmpty(from))
    		return;
    	
    	if (PubUtil.isEmpty(to))
    		throw new RuntimeException("targe object is null");
    	
        Iterator entries = ((Map) from).entrySet().iterator();
        while (entries.hasNext()) {
            Map.Entry entry = (Map.Entry) entries.next();
            String name = getPropertyNameByKey(entry.getKey().toString().toLowerCase());
            try {
                //oracle
                if(name.equals("rownum")){
                    continue;
                }
				PropertyUtils.setSimpleProperty(to, name, entry.getValue());
			} catch (IllegalAccessException e) {
				throw new RuntimeException(e.getMessage(), e);
			} catch (InvocationTargetException e) {
				throw new RuntimeException(e.getMessage(), e);
			} catch (NoSuchMethodException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
        }

    }
    
    /**
     * 把Map转换成对像(按key->property)
     * @param targetCLZ
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public static List convertListMapToObject(List<Map> from, Class targetCLZ) {
    	if (PubUtil.isEmpty(from))
    		return null;
    	
    	List resultList = new ArrayList();
    	for (Map map : from) {
    		Object targetInst = null;
			try {
				targetInst = targetCLZ.newInstance();
				copyProperties(map, targetInst);
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			
			resultList.add(targetInst);
		}
    	
    	return resultList;
    }
    
    /**
     * 把key转换属性名(删除split字符，split后第一个字符变成大写)
     * @param key
     * @return
     */
    public static String getPropertyNameByKey(String key){
        String split = "_";
    	if (PubUtil.isEmpty(key))
    		return null;
    	
    	if (key.indexOf(split)<=0)
    		return key;
    	
    	String[] keys = key.split(split);
    	String result = "";
    	for (int i = 0; i < keys.length; i++) {
    		if (i>0){
    			keys[i] = keys[i].substring(0, 1).toUpperCase() + keys[i].substring(1);
    		}
    		result = result + keys[i];
		}
    	
    	return result;
    }
    
	/**
	 * 将字符串数组(List)的元素以指定连接符unionChar拼接成字符串，每个数组元素前后都将添加appendChar。
	 * 
	 * <p>
	 * <strong>用例描述：</strong>
	 * 
	 * <pre>
	 * getUnionStr(new String[] { &quot;A&quot;, &quot;B&quot;, &quot;C&quot; }, &quot;,&quot;, &quot;&quot;) = &quot;A,B,C&quot;;
	 * getUnionStr(new String[] { &quot;A&quot;, &quot;B&quot;, &quot;C&quot; }, &quot;,&quot;, &quot;*&quot;) = &quot;*A*,*B*,*C*&quot;;
	 * </pre>
	 * 
	 * @params strAry 用于连接的字符串数组
	 * @params unionChar 用来连接的中间字符
	 * @params appendChar 用来在每个字符中追加
	 */
	public static String getUnionString(Collection<String> strCols, String unionChar, String appendChar) {
		if (PubUtil.isEmpty(strCols))
			return null;
		
		StringBuffer ret = new StringBuffer();
		int i=0;
		for (String str : strCols) {
			if (i != 0)
				ret.append(unionChar);
			ret.append(appendChar + str + appendChar);
			i++;
		}
		
		return ret.toString();
	}
	
	/**
	 * 取反数据库值
	 */
	public static BigDecimal getNegDoubleValue(BigDecimal value){
		if(value==null||value.toString()==null)
			return null;
		
		return SafeCompute.sub(BigDecimal.ZERO, value);
	}
	

	
	/**
	 * 安全比较
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static int safeCompare(BigDecimal d1, BigDecimal d2){
		d1 = (d1==null)?new BigDecimal(0):d1;
		d2 = (d2==null)?new BigDecimal(0):d2;
		
		return d1.compareTo(d2);
	}
	
	public static String filterNULL(Object target) {
        if (isNotEmpty(target)) {
            return target.toString();
        } else {
            return "";
        }
    }

    public static String filterNULLSPACE(Object target) {
        if (isNotEmpty(target)) {
            return StringUtils.trimWhitespace(target.toString());
        } else {
            return "";
        }
    }

    public static String filterNULLAllSPACE(Object target) {
        if (isNotEmpty(target)) {
            return StringUtils.trimAllWhitespace(target.toString());
        } else {
            return "";
        }
    }

    /**
     * 校验日期
     *
     * @param date
     * @return
     * @throws Exception
     */
    public static String validateDate(String date) throws Exception {
        if (!isDate(date)) {
            throw new Exception(String.format("日期格式不正确。[%s]", date));
        }
        return date;
    }
    
    //判断字符串是否为日期格式
    public static boolean isDate(String date) {
        //判断日期格式 2017-1-1  2017/1/1  2017.1.1  2017年1月1日、号
        String rexp = "\\d{4}[-|\\/|年|\\.]\\d{1,2}[-|\\/|月|\\.]\\d{1,2}([日|号]*)";
        return  Pattern.compile(rexp).matcher(date).matches();
    }

    public static String getRemoteAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 根据日期获得星期
     *
     * @param date
     * @return
     */
    public static String getWeekOfDate(Date date) {
        String[] weekDaysName = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        // String[] weekDaysCode = { "0", "1", "2", "3", "4", "5", "6" };
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int intWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        return weekDaysName[intWeek];
    }

    /**
     * 根据日期获得星期
     *
     * @param date
     * @return
     */
    public static String getWeekOfDate2(Date date) {
        String[] weekDaysName = {"周日", "周一", "周二", "周三", "周四", "周五", "周六"};
        // String[] weekDaysCode = { "0", "1", "2", "3", "4", "5", "6" };
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int intWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        return weekDaysName[intWeek];
    }

    /**
     * 带日期+时间的转换
     *
     * @param date
     * @return dateTimeString
     */
    public static String dateTimeToString(Date date) {
        if (date == null) {
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    /**
     * @Title: dateTimeToString @Description: 时间转换 @param: @param
     * date @param: @param fomart @param: @return @return:
     * String @throws
     */
    public static String dateTimeToString(Date date, String format) {
        if (date == null) {
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    public static Date parseDateTime(String date) throws ParseException {
        if(org.apache.commons.lang3.StringUtils.isBlank(date)){
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(SystemConstants.DATE_FORMAT_Y_M_D_H_M_S);
        return sdf.parse(date);
    }

    public static Date parseDate(String date) throws ParseException {
        if(org.apache.commons.lang3.StringUtils.isBlank(date)){
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(SystemConstants.DATE_FORMAT_YMD);
        return sdf.parse(date);
    }

    /**
     * 输出流到界面
     * @param response
     * @param obj
     */
    public static void write(HttpServletResponse response, String obj){
        Writer writer=null;
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            writer = response.getWriter();
            writer.write(obj);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
