package com.shine.service.impl;


import com.shine.dao.BljdDao;
import com.shine.model.lchj.Bljd;
import com.shine.model.ysl.KFS;
import com.shine.model.ysl.PubUser;
import com.shine.model.ysl.PubUserLoginLog;
import com.shine.repository.front.PubUserLoginLogRepository;
import com.shine.repository.front.PubUserRepository;
import com.shine.repository.manage.KfsRepository;
import com.shine.service.PubUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by luoxuan on 2017/5/12.
 * Description:
 */

@Service
@Transactional
public class PubUserServiceImpl implements PubUserService {

    @Resource
    private PubUserRepository pubUserRepository;

    @Resource
    private PubUserLoginLogRepository pubUserLoginLogRepository;
    @Resource
    private KfsRepository kfsRepository;
    @Resource
    private BljdDao bljdDao;


    @Override
    public PubUser getUserEntity(String username, String password, String type) {
        return pubUserRepository.findByAccountAndPasswordAndType(username, password, Integer.valueOf(type));
    }

    @Override
    public PubUser getUserEntityByFiled(String fieldName, String fieldValue) {
        // return pubUserRepository.getUserEntityByFiled(fieldValue);
//        if(fieldName.equals("account")){
//            return pubUserRepository.findByAccount(fieldValue);
//        }else  if(fieldName.equals("id_card")){
//            return pubUserRepository.findByIdCard(fieldValue);
//        }else  if(fieldName.equals("company_phone")){
//            return pubUserRepository.findByCompanyPhone(fieldValue);
//        }else {
        return pubUserRepository.findByAccountAndStatus(fieldValue, 1);
//        }
    }

    @Override
    public void savePubUser(PubUser pubUser) {
        pubUserRepository.save(pubUser);
    }

    @Override
    public PubUser getPubUserByToken(String token) {
        return pubUserRepository.findByToken(token);
    }

    @Override
    public void savePubUserLoginLog(PubUserLoginLog log) {
        pubUserLoginLogRepository.save(log);
    }

    @Override
    public PubUserLoginLog getLastLogin(Integer userId) {
        List<PubUserLoginLog> list = pubUserLoginLogRepository.findByUserIdOrderById(userId);
        if (list.size() == 1) {
            return list.get(0);
        } else {
            return list.get(1);
        }

    }

    @Override
    public PubUser getUserByAccount(String account) {
        return pubUserRepository.findByAccountAndStatus(account, 1);
    }

    @Override
    public PubUser getUserByAccountForReg(String account) {
        return pubUserRepository.findByAccountAndStatusNotIn(account, 0);
    }

    @Override
    public PubUser getPubUser(Integer id) {
        return pubUserRepository.findOne(id);
    }

    @Override
    public KFS getKfs(Integer id) {
        return kfsRepository.findOne(id);
    }

    @Override
    public Bljd getBljd(String sfzh, String ywh) {
        return bljdDao.findByYwhAndSfzh(ywh,sfzh);
    }

    @Override
    public List<Bljd> getBljdList(String sjhm, String sfzh) {
        return bljdDao.findBySfzhAndSjhm(sjhm, sfzh);
    }
}
