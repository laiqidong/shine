package com.shine.model.ysl;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 权利信息
 * laiqd 20170609
 */
@Entity
@Table(name = "QLXX")
public class Qlxx {
    private Long bsm;
    private String ywh;
    private Long qlbsm;
    private String qlbm;
    private String dyfs;
    private Double qdjg;
    private Date qlqssj;
    private Date qljssj;
    private String ygdjzl;
    private String htbh;
    private String fkfs;
    private String qdfs;
    @Id
    public Long getBsm() {
        return bsm;
    }

    public void setBsm(Long bsm) {
        this.bsm = bsm;
    }

    public String getYwh() {
        return ywh;
    }

    public void setYwh(String ywh) {
        this.ywh = ywh;
    }

    public Long getQlbsm() {
        return qlbsm;
    }

    public void setQlbsm(Long qlbsm) {
        this.qlbsm = qlbsm;
    }

    public String getQlbm() {
        return qlbm;
    }

    public void setQlbm(String qlbm) {
        this.qlbm = qlbm;
    }

    public String getDyfs() {
        return dyfs;
    }

    public void setDyfs(String dyfs) {
        this.dyfs = dyfs;
    }

    public Double getQdjg() {
        return qdjg;
    }

    public void setQdjg(Double qdjg) {
        this.qdjg = qdjg;
    }

    public Date getQlqssj() {
        return qlqssj;
    }

    public void setQlqssj(Date qlqssj) {
        this.qlqssj = qlqssj;
    }

    public Date getQljssj() {
        return qljssj;
    }

    public void setQljssj(Date qljssj) {
        this.qljssj = qljssj;
    }

    public String getYgdjzl() {
        return ygdjzl;
    }

    public void setYgdjzl(String ygdjzl) {
        this.ygdjzl = ygdjzl;
    }

    public String getHtbh() {
        return htbh;
    }

    public void setHtbh(String htbh) {
        this.htbh = htbh;
    }

    public String getFkfs() {
        return fkfs;
    }

    public void setFkfs(String fkfs) {
        this.fkfs = fkfs;
    }

    public String getQdfs() {
        return qdfs;
    }

    public void setQdfs(String qdfs) {
        this.qdfs = qdfs;
    }
}
