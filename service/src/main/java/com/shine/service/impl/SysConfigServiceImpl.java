package com.shine.service.impl;


import com.shine.model.system.SysConfig;
import com.shine.repository.manage.SysConfigRepository;
import com.shine.service.SysConfigService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by luoxuan on 2017/3/14.
 * Description:
 */
@Service
@Transactional
public class SysConfigServiceImpl implements SysConfigService {


    @Resource
    SysConfigRepository sysConfigRepository;

    @Override
    public void saveSysConfig(SysConfig t) {
        sysConfigRepository.save(t);
    }

    @Override
    public SysConfig getSysConfig(Integer id) {
        return sysConfigRepository.getOne(id);
    }
}
