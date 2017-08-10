package com.shine.model.ysl;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "BANK")
public class Bank {
    private Long bsm;
    private String qlrmc;
    private String zjzl;
    private String zjh;
    private String cyqlrlx;
    private String lxrmc;
    private String yzbm;
    private String lxdh;
    private String txdz;
    private Long sypl;
    private String qlrfrmc;
    private String qlrfrzjzl;
    private String qlrfrzjh;
    private Long badwbsm;
    private String dlrmc;
    private String dlrdh;
    private String dlrzjzl;
    private String dlrzjh;
    private String zjzlmc;

    @Id
    public Long getBsm() {
        return bsm;
    }

    public void setBsm(Long bsm) {
        this.bsm = bsm;
    }

    public String getQlrmc() {
        return qlrmc;
    }

    public void setQlrmc(String qlrmc) {
        this.qlrmc = qlrmc;
    }

    public String getZjzl() {
        return zjzl;
    }

    public void setZjzl(String zjzl) {
        this.zjzl = zjzl;
    }

    public String getZjh() {
        return zjh;
    }

    public void setZjh(String zjh) {
        this.zjh = zjh;
    }

    public String getCyqlrlx() {
        return cyqlrlx;
    }

    public void setCyqlrlx(String cyqlrlx) {
        this.cyqlrlx = cyqlrlx;
    }

    public String getLxrmc() {
        return lxrmc;
    }

    public void setLxrmc(String lxrmc) {
        this.lxrmc = lxrmc;
    }

    public String getYzbm() {
        return yzbm;
    }

    public void setYzbm(String yzbm) {
        this.yzbm = yzbm;
    }

    public String getLxdh() {
        return lxdh;
    }

    public void setLxdh(String lxdh) {
        this.lxdh = lxdh;
    }

    public String getTxdz() {
        return txdz;
    }

    public void setTxdz(String txdz) {
        this.txdz = txdz;
    }

    public Long getSypl() {
        return sypl;
    }

    public void setSypl(Long sypl) {
        this.sypl = sypl;
    }

    public String getQlrfrmc() {
        return qlrfrmc;
    }

    public void setQlrfrmc(String qlrfrmc) {
        this.qlrfrmc = qlrfrmc;
    }

    public String getQlrfrzjzl() {
        return qlrfrzjzl;
    }

    public void setQlrfrzjzl(String qlrfrzjzl) {
        this.qlrfrzjzl = qlrfrzjzl;
    }

    public String getQlrfrzjh() {
        return qlrfrzjh;
    }

    public void setQlrfrzjh(String qlrfrzjh) {
        this.qlrfrzjh = qlrfrzjh;
    }

    public Long getBadwbsm() {
        return badwbsm;
    }

    public void setBadwbsm(Long badwbsm) {
        this.badwbsm = badwbsm;
    }

    public String getDlrmc() {
        return dlrmc;
    }

    public void setDlrmc(String dlrmc) {
        this.dlrmc = dlrmc;
    }

    public String getDlrdh() {
        return dlrdh;
    }

    public void setDlrdh(String dlrdh) {
        this.dlrdh = dlrdh;
    }

    public String getDlrzjzl() {
        return dlrzjzl;
    }

    public void setDlrzjzl(String dlrzjzl) {
        this.dlrzjzl = dlrzjzl;
    }

    public String getDlrzjh() {
        return dlrzjh;
    }

    public void setDlrzjh(String dlrzjh) {
        this.dlrzjh = dlrzjh;
    }

    @Transient
    public String getZjzlmc() {
        return zjzlmc;
    }

    public void setZjzlmc(String zjzlmc) {
        this.zjzlmc = zjzlmc;
    }
}
