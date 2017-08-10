package com.shine.service;


import com.shine.model.message.Sms;

/**
 * Created by luoxuan on 2017/5/23.
 * Description:消息模块接口，短信，其他消息等
 */

public interface MessageService {
    /**
     * 保存短信
     * @param t
     */
    void saveSms(Sms t);

    /**
     * 获得最新且有效短信
     * @param mobile
     * @return
     */
    Sms getSmsByMobile(String mobile);

}
