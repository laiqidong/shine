package com.shine.util.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by luoxuan on 2017/6/9.
 * Description:发送短信工具类
 */

public class SmsUtil {

    private final static String URL = "http://www.y12345678.com/smsOrderIf";
    private final static String USER_ID = "4255";
    private final static String KEY = "lybdcdjzxkey";
    private final static String EXTRA = "lybdcdjzxkey";

    /**
     * 获取token
     *
     * @return
     * @throws Exception
     */
    public static String getToken() throws Exception {
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        String timestamp = new Date().getTime() + "";
        String digest = "userId=" + USER_ID + "&key=" + KEY + "&timestamp=" + timestamp + "&extra=" + EXTRA;
        String md5Encode = Md5Tool.EncoderMd5(digest);
        params.add(new BasicNameValuePair("userId", USER_ID));
        params.add(new BasicNameValuePair("timestamp", timestamp));
        params.add(new BasicNameValuePair("key", KEY));
        params.add(new BasicNameValuePair("digest", md5Encode));
        String result = HttpClientUtils.getHttpPostResult(URL + "/getToken", params);
        JSONObject o = JSONObject.fromObject(result);
        return o.optString("token");
    }

    /**
     * 发送短信
     * mobiles : 电话号码
     * content : 短信内容
     */
    public static String  sendSms(String mobiles, String content) throws Exception {
        List<String> tels = new ArrayList<>();
        tels.add(mobiles);
        String token = getToken();
        String timestamp = new Date().getTime() + "";
        JSONArray objects = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        //唯一ID seqId 请使用公司简写加6位随机数字
        jsonObject.put("seqId", "bctx123456");
        jsonObject.put("tels", tels);
        jsonObject.put("content", content);
        objects.add(jsonObject);
        String datas = objects.toString();
        String digest = "userId=" + USER_ID + "&token=" + token + "&key=" + KEY + "&datas=" + datas + "&timestamp=" + timestamp + "&extra=" + EXTRA;
        String md5Encode = Md5Tool.EncoderMd5(digest);
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("token", token));
        params.add(new BasicNameValuePair("userId", USER_ID));
        params.add(new BasicNameValuePair("timestamp", timestamp));
        params.add(new BasicNameValuePair("key", KEY));
        params.add(new BasicNameValuePair(digest, md5Encode));
        params.add(new BasicNameValuePair("datas", datas));
        params.add(new BasicNameValuePair("digest", md5Encode));
        String post = HttpClientUtils.getHttpPostResult(URL + "/sendSmsOrderIf", params);
//        System.out.println(post);
        return post;
    }

    /**
     * 行短回复记录查询
     * userId : 用户ID
     */
    /*public void getReplyRecord() throws Exception {
        String token = getToken();
        Map<String, String> params = new HashMap<String, String>();
        params.put("token", token);
        params.put("userId", USER_ID);
        String timestamp = "20151101130638";
        params.put("timestamp", timestamp);
        params.put("key", KEY);
        //  params.put("num", "1"); //一次取的个数 默认10 最大100
        String digest = "userId=" + USER_ID + "&token=" + token + "&key=" + KEY + "&timestamp=" + timestamp + "&extra=" + EXTRA;
        digest = Md5Tool.EncoderMd5(digest);
        params.put("digest", digest);
        String post = HttpClientUtil.post(URL + "/getReplyRecord", params);
        org.json.JSONObject objStr = new org.json.JSONObject(post);
        //上行数据格式：消息编号(msgid)#时间#手机号码#帐号#内容
    }*/


    public static void main(String[] args) {
        try {
            System.out.println(getToken());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
