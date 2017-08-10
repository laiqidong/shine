package com.shine.model.ysl;

import java.util.List;

/**
 * 传参用的javaBean
 */
public class SQXX {
    private String dybsms;
    private String lcdm;
    private String yslywh;
    private List<SQR> sqrs;
    private SLSQ slsq;

    public String getDybsms() {
        return dybsms;
    }

    public void setDybsms(String dybsms) {
        this.dybsms = dybsms;
    }

    public String getLcdm() {
        return lcdm;
    }

    public void setLcdm(String lcdm) {
        this.lcdm = lcdm;
    }

    public String getYslywh() {
        return yslywh;
    }

    public void setYslywh(String yslywh) {
        this.yslywh = yslywh;
    }

    public List<SQR> getSqrs() {
        return sqrs;
    }

    public void setSqrs(List<SQR> sqrs) {
        this.sqrs = sqrs;
    }

    public SLSQ getSlsq() {
        return slsq;
    }

    public void setSlsq(SLSQ slsq) {
        this.slsq = slsq;
    }
}
