package com.shine.util.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * @版权：Fundoy 版权所有 (c) 2013
 * @author:Fisher
 * @version Revision 1.0.0
 * @email:zhuangcaijin@126.com
 * @see:
 * @创建日期：2014-4-12
 * @功能说明：object转化为map
 * @begin
 * @修改记录:
 * @修改后版本          修改人      	修改内容
 * @2014-4-12  	         Fisher        	创建
 * @end
 */
public class DataConvertUtil {
    
    @SuppressWarnings("rawtypes")
    public static Map ConvertObjToMap(Object obj){
        Map<String,Object> reMap = new HashMap<String,Object>();
        if (obj == null) 
            return null;
        Field[] fields = obj.getClass().getDeclaredFields();
        try {
            for(int i=0;i<fields.length;i++){
                try {
                    Field f = obj.getClass().getDeclaredField(fields[i].getName());
                    f.setAccessible(true);
                    Object o = f.get(obj);
                    reMap.put(fields[i].getName(), o);
                } catch (NoSuchFieldException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IllegalArgumentException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return reMap;
    }
}    