package com.shine.service;


import com.shine.model.lchj.Bljd;
import com.shine.model.ysl.KFS;
import com.shine.model.ysl.PubUser;
import com.shine.model.ysl.PubUserLoginLog;

import java.util.List;

/**
 * Created by luoxuan on 2017/5/12.
 * Description:公众用户模块接口
 */

public interface PubUserService {
    PubUser getUserEntity(String username, String password, String type);

    PubUser getUserEntityByFiled(String fieldName, String fieldValue);

    void savePubUser(PubUser pubUser);

    PubUser getPubUserByToken(String token);

    void savePubUserLoginLog(PubUserLoginLog log);

    PubUserLoginLog getLastLogin(Integer userId);

    PubUser getUserByAccount(String account);

    PubUser getUserByAccountForReg(String account);

    PubUser getPubUser(Integer id);

    KFS getKfs(Integer id);

    Bljd getBljd(String sfzh, String ywh);

    List<Bljd> getBljdList(String sjhm, String sfzh);
}
