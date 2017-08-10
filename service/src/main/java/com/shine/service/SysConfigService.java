package com.shine.service;


import com.shine.model.system.SysConfig;

/**
 * Created by luoxuan on 2017/3/14.
 * Description:
 */


public interface SysConfigService {

    void saveSysConfig(SysConfig t);

    SysConfig getSysConfig(Integer id);
}
