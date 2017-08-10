package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by luoxuan on 2017/4/11.
 * Description:公众用户表
 */

@Entity
@Table(name = "PUB_USER")
//@SequenceGenerator(name = "SEQ_PUB_USER", sequenceName = "SEQ_PUB_USER", allocationSize = 1)
public class PubUser {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String account;  //账号 （手机号）
    private String password; //密码
    private String idCard;  //身份证
    private String idType; //证件类型
    private String name;   //姓名、、公司员工
    private Integer type;  //类型  1.普通用户，2.企业用户（批量操作用户）
    private Integer status;  //状态 1.在用  2.禁用  0.删除
    private Date createTime;
    private String token;
    private Date actionTime;   //最后活动时间
    private String organizationCode;   //机构代码
    private String companyAddress;   //公司地址
    private String companyPhone;    //公司电话
    private Long kfsbsm;//开发商标识码
    private String companyName;  //公司名称
    private String boss;  //企业法人
    private String companyIdType;  //企业证件类型
    private String companyIdCard;  //企业证件编码
    private String mobile; //手机号码，存储企业用户工作人员的手机号码，个人用户：账号就是手机号；
    public PubUser() {
    }

    /**
     * 新增开发商用户
     * @param t
     */
    public void addCompanyUser(KFS t) {
//        this.idCard = t.getZjbm();
//        this.idType = t.getZjlx();
        this.type = 2;
        this.status = 1;
        this.createTime = new Date();
        this.companyAddress = t.getDz();
        this.companyPhone = t.getDh();
        this.companyName = t.getKfsmc();
        this.boss = t.getJfr();
        this.companyIdCard=t.getZjbm();
        this.companyIdType=t.getZjlx();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getActionTime() {
        return actionTime;
    }

    public void setActionTime(Date actionTime) {
        this.actionTime = actionTime;
    }

    public String getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public Long getKfsbsm() {
        return kfsbsm;
    }

    public void setKfsbsm(Long kfsbsm) {
        this.kfsbsm = kfsbsm;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getIdType() {
        return idType;
    }

    public void setIdType(String idType) {
        this.idType = idType;
    }

    public String getBoss() {
        return boss;
    }

    public void setBoss(String boss) {
        this.boss = boss;
    }

    public String getCompanyIdType() {
        return companyIdType;
    }

    public void setCompanyIdType(String companyIdType) {
        this.companyIdType = companyIdType;
    }

    public String getCompanyIdCard() {
        return companyIdCard;
    }

    public void setCompanyIdCard(String companyIdCard) {
        this.companyIdCard = companyIdCard;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
