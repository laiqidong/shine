package com.shine.util.util;

import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.util.List;

/**
 * Created by luoxuan on 2017/6/9.
 * Description:http请求工具类
 */

public class HttpClientUtils {
    // 编码
    private static String CHARSET = "UTF-8";
    // 连接超时时间
    private static int TIME_OUT = 60000;

    /**
     *  常规post请求
     * @param url
     * @param params
     * @return
     */
    public static String getHttpPostResult(String url,
                                           List<NameValuePair> params) {
        String body = "";
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost method = new HttpPost(url);
        try {
            method.setEntity(new UrlEncodedFormEntity(params, CHARSET));
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
}
