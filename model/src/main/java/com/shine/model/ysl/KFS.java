package com.shine.model.ysl;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by luoxuan on 2017/5/25.
 * Description:开发商bean
 */
@Entity
@Table
public class KFS {

    @Id
    private Integer bsm;
    private String lx;
    private String kfsmc;
    private String jfr;
    private String dh;
    private String dz;
    private String zjlx;
    private String zjbm;
    private String lxr;

    public Integer getBsm() {
        return bsm;
    }

    public void setBsm(Integer bsm) {
        this.bsm = bsm;
    }

    public String getLx() {
        return lx;
    }

    public void setLx(String lx) {
        this.lx = lx;
    }

    public String getKfsmc() {
        return kfsmc;
    }

    public void setKfsmc(String kfsmc) {
        this.kfsmc = kfsmc;
    }

    public String getJfr() {
        return jfr;
    }

    public void setJfr(String jfr) {
        this.jfr = jfr;
    }

    public String getDh() {
        return dh;
    }

    public void setDh(String dh) {
        this.dh = dh;
    }

    public String getDz() {
        return dz;
    }

    public void setDz(String dz) {
        this.dz = dz;
    }

    public String getZjlx() {
        return zjlx;
    }

    public void setZjlx(String zjlx) {
        this.zjlx = zjlx;
    }

    public String getZjbm() {
        return zjbm;
    }

    public void setZjbm(String zjbm) {
        this.zjbm = zjbm;
    }

    public String getLxr() {
        return lxr;
    }

    public void setLxr(String lxr) {
        this.lxr = lxr;
    }
}

