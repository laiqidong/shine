package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

/**
 * 受理申请实体类
 * laiqd 20170609 edit
 */
@Entity
@Table(name = "SLSQ")
//@SequenceGenerator(name = "SEQ_SLSQ", sequenceName = "SEQ_SLSQ", allocationSize = 1)
public class SLSQ {
    private Long id;
    private Integer user_id;
    private String yslywh;
    private String djdl;
    private String djxl;
    private String sqly;
    private String sqdwmc;//申请单位名称
    private Date sqsj;
    private Integer zt;//1待提交、2已提交、3、待审核、4审核成功、5、审核失败
    private String djywh;
    private String djsfsl;
    private String djbslyj;
    private Date djkssj;
    private Date djjssj;
    private Date gxsj;
    private Integer qxdm;
    private String qdfs;//取得方式
    private String qdfsmc;//取得方式名称
    private String fkfs;//付款方式
    private String fkfsmc;//付款方式名称
    private String htbh;//合同编号
    private Double jyje;//交易价格
    private String dyfs;//抵押方式
    private String dyfsmc;//抵押方式名称
    private Double bdbzqse;//被担保债权数额
    private Date zqqssj;//债权起始时间
    private Date zqjssj;//债权结束时间
    private String lcmc;//流程名称（查询用）
    private String startTime;//开始时间（查询用）
    private String endTime;//结束时间（查询用)
    private String blzt;//办理状态（查询用)
    private String qlrs;//权利人名称，展示用
    private String datumsortName;
    private String datumGuid;
    private String newywh;
    private String dklx;
    private String dklxmc;
    private String dyhtbh;//抵押合同编号
    private String tdzh;//土地证号

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getYslywh() {
        return yslywh;
    }

    public void setYslywh(String yslywh) {
        this.yslywh = yslywh;
    }

    public String getDjdl() {
        return djdl;
    }

    public void setDjdl(String djdl) {
        this.djdl = djdl;
    }

    public String getDjxl() {
        return djxl;
    }

    public void setDjxl(String djxl) {
        this.djxl = djxl;
    }

    public String getSqly() {
        return sqly;
    }

    public void setSqly(String sqly) {
        this.sqly = sqly;
    }

    public String getSqdwmc() {
        return sqdwmc;
    }

    public void setSqdwmc(String sqdwmc) {
        this.sqdwmc = sqdwmc;
    }

    public Date getSqsj() {
        return sqsj;
    }

    public void setSqsj(Date sqsj) {
        this.sqsj = sqsj;
    }

    public Integer getZt() {
        return zt;
    }

    public void setZt(Integer zt) {
        this.zt = zt;
    }

    public String getDjywh() {
        return djywh;
    }

    public void setDjywh(String djywh) {
        this.djywh = djywh;
    }

    public String getDjsfsl() {
        return djsfsl;
    }

    public void setDjsfsl(String djsfsl) {
        this.djsfsl = djsfsl;
    }

    public String getDjbslyj() {
        return djbslyj;
    }

    public void setDjbslyj(String djbslyj) {
        this.djbslyj = djbslyj;
    }

    public Date getDjkssj() {
        return djkssj;
    }

    public void setDjkssj(Date djkssj) {
        this.djkssj = djkssj;
    }

    public Date getDjjssj() {
        return djjssj;
    }

    public void setDjjssj(Date djjssj) {
        this.djjssj = djjssj;
    }

    public Date getGxsj() {
        return gxsj;
    }

    public void setGxsj(Date gxsj) {
        this.gxsj = gxsj;
    }

    public Integer getQxdm() {
        return qxdm;
    }

    public void setQxdm(Integer qxdm) {
        this.qxdm = qxdm;
    }

    public String getQdfs() {
        return qdfs;
    }

    public void setQdfs(String qdfs) {
        this.qdfs = qdfs;
    }

    public String getFkfs() {
        return fkfs;
    }

    public void setFkfs(String fkfs) {
        this.fkfs = fkfs;
    }

    public String getHtbh() {
        return htbh;
    }

    public void setHtbh(String htbh) {
        this.htbh = htbh;
    }

    public Double getJyje() {
        return jyje;
    }

    public void setJyje(Double jyje) {
        this.jyje = jyje;
    }

    public String getDyfs() {
        return dyfs;
    }

    public void setDyfs(String dyfs) {
        this.dyfs = dyfs;
    }

    public Double getBdbzqse() {
        return bdbzqse;
    }

    public void setBdbzqse(Double bdbzqse) {
        this.bdbzqse = bdbzqse;
    }


    public Date getZqqssj() {
        return zqqssj;
    }

    public void setZqqssj(Date zqqssj) {
        this.zqqssj = zqqssj;
    }


    public Date getZqjssj() {
        return zqjssj;
    }

    public void setZqjssj(Date zqjssj) {
        this.zqjssj = zqjssj;
    }

    @Transient
    public String getLcmc() {
        return lcmc;
    }

    public void setLcmc(String lcmc) {
        this.lcmc = lcmc;
    }

    @Transient
    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    @Transient
    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    @Transient
    public String getBlzt() {
        return blzt;
    }

    public void setBlzt(String blzt) {
        this.blzt = blzt;
    }

    @Transient
    public String getQlrs() {
        return qlrs;
    }

    public void setQlrs(String qlrs) {
        this.qlrs = qlrs;
    }

    public String getDatumsortName() {
        return datumsortName;
    }

    public void setDatumsortName(String datumsortName) {
        this.datumsortName = datumsortName;
    }

    public String getDatumGuid() {
        return datumGuid;
    }

    public void setDatumGuid(String datumGuid) {
        this.datumGuid = datumGuid;
    }

    @Transient
    public String getQdfsmc() {
        return qdfsmc;
    }

    public void setQdfsmc(String qdfsmc) {
        this.qdfsmc = qdfsmc;
    }

    @Transient
    public String getFkfsmc() {
        return fkfsmc;
    }

    public void setFkfsmc(String fkfsmc) {
        this.fkfsmc = fkfsmc;
    }

    @Transient
    public String getDyfsmc() {
        return dyfsmc;
    }

    public void setDyfsmc(String dyfsmc) {
        this.dyfsmc = dyfsmc;
    }

    public String getNewywh() {
        return newywh;
    }

    public void setNewywh(String newywh) {
        this.newywh = newywh;
    }

    public String getDklx() {
        return dklx;
    }

    public void setDklx(String dklx) {
        this.dklx = dklx;
    }
    @Transient
    public String getDklxmc() {
        return dklxmc;
    }

    public void setDklxmc(String dklxmc) {
        this.dklxmc = dklxmc;
    }

    public String getDyhtbh() {
        return dyhtbh;
    }

    public void setDyhtbh(String dyhtbh) {
        this.dyhtbh = dyhtbh;
    }

    public String getTdzh() {
        return tdzh;
    }

    public void setTdzh(String tdzh) {
        this.tdzh = tdzh;
    }
}
