package com.shine.service.impl;


import com.shine.model.message.Sms;
import com.shine.repository.front.SmsRepository;
import com.shine.service.MessageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by luoxuan on 2017/6/12.
 * Description:
 */
@Service
@Transactional
public class MessageServiceImpl implements MessageService {

    @Resource
    private SmsRepository smsRepository;

    @Override
    public void saveSms(Sms t) {
        smsRepository.save(t);
    }

    @Override
    public Sms getSmsByMobile(String mobile) {
        return smsRepository.findByMobileAndEffcetiveTimeGreaterThan(mobile,new Date());
    }
}
