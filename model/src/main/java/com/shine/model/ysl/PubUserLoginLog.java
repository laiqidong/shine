package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by luoxuan on 2017/4/11.
 * Description:用户登录日志
 */
@Entity
@Table(name = "PUB_USER_LOGIN_lOG")
//@SequenceGenerator(name = "SEQ_PUB_USER_LOGIN_LOG", sequenceName = "SEQ_PUB_USER_LOGIN_LOG", allocationSize = 1)
public class PubUserLoginLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer userId;
    @Transient
    private String account;  //账号
    private Date loginTime;  //登录时间
    private String ip;
    private String loginAddress;  //登录所在地址，根据IP获取
    private String token;

    public PubUserLoginLog() {
    }

    public PubUserLoginLog(Integer userId, Date loginTime, String ip, String loginAddress, String token) {
        this.userId = userId;
        this.loginTime = loginTime;
        this.ip = ip;
        this.loginAddress = loginAddress;
        this.token = token;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getLoginAddress() {
        return loginAddress;
    }

    public void setLoginAddress(String loginAddress) {
        this.loginAddress = loginAddress;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
