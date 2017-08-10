package com.shine.ysl.constants;

import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.Map;

/**
 * <p>名称：JsonResult.java</p>
 * <p>描述：接口返回的json对象</p>
 */
@SuppressWarnings("all")
public class JsonResult implements Serializable {
    private String msg; // 接口调用结果描述信息
    private String ret; // 接口调用结果描述编码
    private Map<String, Object> data; // 接口返回的数据

    public JsonResult(Describable describable) {
        this.msg = describable.getMsg();
        this.ret = describable.getCode();
    }

    public JsonResult setJsonResult(Describable describable) {
        this.msg = describable.getMsg();
        this.ret = describable.getCode();
        return this;
    }
    public JsonResult(Describable describable, Map<String, Object> data) {
        this.msg = describable.getMsg();
        this.ret = describable.getCode();
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getRet() {
        return ret;
    }

    public void setRet(String ret) {
        this.ret = ret;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public void addData(String valueName, Object value) {
        if (null == data) {
            data = Maps.newHashMap();
        }
        this.data.put(valueName, value);
    }

    @Override
    public String toString() {
        return "{\"msg\":\"" + msg + "\"" +
                ",\"ret\":\"" + ret + '\"' +
                '}';
    }
}
