package com.shine.model.lchj;


import javax.persistence.Transient;
import java.util.Date;

/**
 * Created by luoxuan on 2016/12/14.
 * Description: 自定义办理进度 bean
 */
//@Entity
//@IdClass(BljdMapPk.class)
//@Table(name="V_BDC_BLJD")
//@Cache(usage= CacheConcurrencyStrategy.READ_ONLY)
public class Bljd {

//    @Id
    private String ywh;  //业务号
    private String djlx;  //登记类型
    private String sqr;  //申请人
//    @Id
//    @Column(name = "zjh")
    private String sfzh;  //证件号
    private String hj;   //环节
    private String blts;  //办理天数
    private String lckey;   //流程key
    @Transient
    private Integer djhj; //第几环节
    @Transient
    private Integer rev_;   //暂时无用
    private Date slsj;   //受理时间
    private String sjhm;

    public Bljd() {
    }

    public Bljd(String ywh, String sfzh) {
        this.ywh = ywh;
        this.sfzh = sfzh;
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

    public String getSjhm() {
        return sjhm;
    }

    public void setSjhm(String sjhm) {
        this.sjhm = sjhm;
    }
}
