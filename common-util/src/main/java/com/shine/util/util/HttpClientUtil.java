package com.shine.util.util;

import net.sf.json.JSONObject;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

/**
 * Created by luoxuan on 2017/3/21.
 * Description:Http客户端请求工具
 */
public class HttpClientUtil {

    /**
     * @Description: HTTP GET 请求
     */
    public static String getHttpGetResult(String url) {
        String body = "";
        CloseableHttpClient client = HttpClients.createDefault();
        HttpGet method = new HttpGet(url);
        try {
            // 设置编码
            CloseableHttpResponse response = client.execute(method);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != HttpStatus.SC_OK) {
                body = "-1";
            } else {
                body = EntityUtils.toString(response.getEntity());
            }
            response.close();
        } catch (Exception e) {
            e.printStackTrace();
            body = "0";
        } finally {
            // 关闭连接 ,释放资源
            try {
                client.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return body;
    }

    /**
     * @Description: HTTP POST 请求
     */
    public static String getHttpPostResultByXml(String url, String xml) {
        String body = "";
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost method = new HttpPost(url);
//        method.setHeader();
        try {
            method.setEntity(new StringEntity(xml));
            // 设置编码
            CloseableHttpResponse response = client.execute(method);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != HttpStatus.SC_OK) {
                //body = "-1";
                body = EntityUtils.toString(response.getEntity());
            } else {
                body = EntityUtils.toString(response.getEntity());
            }
            response.close();
        } catch (Exception e) {
            e.printStackTrace();
            body = "0";
        } finally {
            // 关闭连接 ,释放资源
            try {
                client.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return body;
    }

    /**
     * 根据ip获取当前省市县
     * @return
     */
    public static String getAddressByIp(String ip){
        //淘宝提供的api  http://ip.taobao.com/service/getIpInfo.php?ip=
        String body= getHttpGetResult("http://ip.taobao.com/service/getIpInfo.php?ip=120.40.42.99");//+request.getRemoteAddr()
        JSONObject jsonObject = JSONObject.fromObject(body);
        if("0".equals(jsonObject.optString("code"))){
            return jsonObject.optJSONObject("data").optString("region")+jsonObject.optJSONObject("data").optString("city");
        }else{
            return "";
        }
    }

    public static void main(String args[]){
        System.out.println(getAddressByIp(""));
    }
}
