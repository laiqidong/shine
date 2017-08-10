package com.shine.util.util;/**
 * Created by luoxuan on 2017/3/22.
 * Description:
 */

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.JSONUtils;
import net.sf.json.util.PropertyFilter;

import java.util.Date;

/**
 * JSON对象转换bean
 *
 * @author luoxuan
 * @create 2017-03-22 15:04
 **/
public class JSONConvertObject {

    public static Object convertJsonObject(JSONObject object, String rootClass) {
        Object o = new Object();
        try {
            JsonConfig config1 = new JsonConfig();// JSON转换DATE处理（date类型不经过处理报错）
            config1.registerJsonValueProcessor(Date.class,
                    new DateJsonValueProcessor("yyyy-MM-dd"));
            config1.setJsonPropertyFilter(new PropertyFilter() {
                @Override
                public boolean apply(Object source, String name, Object value) {
                    return value == null;
                }
            });
            config1.setRootClass(Class.forName(rootClass));
            JSONUtils.getMorpherRegistry().registerMorpher(
                    new DateMorpher(new String[] { "yyyy-MM-dd",
                            "yyyy-MM-dd HH:mm:ss" }));
            o = JSONObject.toBean(object, config1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }
}
