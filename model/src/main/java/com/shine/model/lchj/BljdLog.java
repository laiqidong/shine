package com.shine.model.lchj;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by luoxuan on 2016/12/14.
 * Description: 办理进度查询记录
 */
@Entity
@Table
//@SequenceGenerator(name = "SEQ_BLJD_LOG", sequenceName = "SEQ_BLJD_LOG", allocationSize = 1)
public class BljdLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String ywh;  //业务号
    private String djlx;  //登记类型
    private String sqr;  //申请人
    private String sfzh;  //证件号
    private String hj;   //环节
    private String blts;  //办理天数
    private String lckey;   //流程key
    @Transient
    private Integer djhj; //第几环节
    @Transient
    private Integer rev_;   //暂时无用
    private Date slsj;   //受理时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYwh() {
        return ywh;
    }

    public void setYwh(String ywh) {
        this.ywh = ywh;
    }

    public String getDjlx() {
        return djlx;
    }

    public void setDjlx(String djlx) {
        this.djlx = djlx;
    }

    public String getSqr() {
        return sqr;
    }

    public void setSqr(String sqr) {
        this.sqr = sqr;
    }

    public String getSfzh() {
        return sfzh;
    }

    public void setSfzh(String sfzh) {
        this.sfzh = sfzh;
    }

    public String getBlts() {
        return blts;
    }

    public void setBlts(String blts) {
        this.blts = blts;
    }

    public String getHj() {
        return hj;
    }

    public void setHj(String hj) {
        this.hj = hj;
    }

    public String getLckey() {
        return lckey;
    }

    public void setLckey(String lckey) {
        this.lckey = lckey;
    }

    public Integer getDjhj() {
        return djhj;
    }

    public void setDjhj(Integer djhj) {
        this.djhj = djhj;
    }

    public Date getSlsj() {
        return slsj;
    }

    public void setSlsj(Date slsj) {
        this.slsj = slsj;
    }

    public Integer getRev_() {

        return rev_;
    }

    public void setRev_(Integer rev_) {
        this.rev_ = rev_;
    }
}
