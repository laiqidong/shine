package com.shine.model.lchj;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by luoxuan on 2017/6/14.
 * Description:办理进度查询日志
 */
@Entity
@Table
//@SequenceGenerator(name = "SEQ_BLJD_QUERY_LOG", sequenceName = "SEQ_BLJD_QUERY_LOG", allocationSize = 1)
public class BljdQueryLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer userId;
    private Date queryTime;  //查询时间
    private String idCard;     //身份证号
    private String mobile;  //手机号
    private String ywhs; //查询结果的业务号，“，”分隔。

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getQueryTime() {
        return queryTime;
    }

    public void setQueryTime(Date queryTime) {
        this.queryTime = queryTime;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getYwhs() {
        return ywhs;
    }

    public void setYwhs(String ywhs) {
        this.ywhs = ywhs;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
