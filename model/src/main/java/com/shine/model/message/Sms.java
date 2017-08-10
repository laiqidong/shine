package com.shine.model.message;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by luoxuan on 2017/4/11.
 * Description:短信表
 */
@Entity
@Table
//@SequenceGenerator(name = "SEQ_SMS", sequenceName = "SEQ_SMS", allocationSize = 1)
public class Sms {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer userId;     //用户ID
    private String mobile;   //手机号码
    @Column(length = 2000)
    private String content;  //内容
    private Date createTime;   //创建时间
    private Integer status;   //状态   1.待发送，2.已发送
    private Date sendTime;  //实际发送时间
    private Date planSendTime;  //计划发送时间
    private Integer type;  //短信类型，1.通知短信，2.验证码短信  ...
    private String code; //验证码
    private Date effcetiveTime; //验证码有效时间
    private String sendResult;

    public Sms() {
    }

    public Sms(String mobile, String content, Date createTime, Integer status, Date sendTime, Integer type, String code, Date effcetiveTime, String sendResult) {
        this.mobile = mobile;
        this.content = content;
        this.createTime = createTime;
        this.status = status;
        this.sendTime = sendTime;
        this.type = type;
        this.code = code;
        this.effcetiveTime = effcetiveTime;
        this.sendResult = sendResult;
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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Date getPlanSendTime() {
        return planSendTime;
    }

    public void setPlanSendTime(Date planSendTime) {
        this.planSendTime = planSendTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getEffcetiveTime() {
        return effcetiveTime;
    }

    public void setEffcetiveTime(Date effcetiveTime) {
        this.effcetiveTime = effcetiveTime;
    }

    public String getSendResult() {
        return sendResult;
    }

    public void setSendResult(String sendResult) {
        this.sendResult = sendResult;
    }
}
