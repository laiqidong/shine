package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "SQR")
//@SequenceGenerator(name = "SEQ_SQR", sequenceName = "SEQ_SQR", allocationSize = 1)
public class SQR {

    private Long bsm;
    private String yslywh;
    private String sqrlb;
    private String sqrlbmc;
    private String sqrlx;
    private String sqrlxmc;
    private String sqrmc;
    private String sqrzjzl;
    private String sqrzjzlmc;
    private String sqrzjh;
    private String xb;
    private String sqrtxdz;
    private String sqryb;
    private String sqrgddh;
    private String sqryddh;
    private String sqrfrmc;
    private String sqrfrdh;
    private String sqrfrzjzl;
    private String sqrfrzjh;
    private String sqrfrlxdz;
    private String sqrdlrmc;
    private String sqrdlrdh;
    private String sqrdlrzjzl;
    private String sqrdlrzjh;
    private String sqrdljg;
    private String sqrdljgdm;
    private String hjszd;
    private String csny;
    private String bz;
    private Long qxdm;
    private String yxtbm;
    private Long yxtbsm;
    private Integer qszt;
    private Double qlmj;
    private String qlbl;
    private String gyfs;
    private String gyfsmc;
    private String gyqk;
    private String sshy;
    private String gzdw;
    private String dzyj;
    private Date gxsj;
    private String gj;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getBsm() {
        return bsm;
    }

    public void setBsm(Long bsm) {
        this.bsm = bsm;
    }

    public String getYslywh() {
        return yslywh;
    }

    public void setYslywh(String yslywh) {
        this.yslywh = yslywh;
    }

    public String getSqrlb() {
        return sqrlb;
    }

    public void setSqrlb(String sqrlb) {
        this.sqrlb = sqrlb;
    }

    public String getSqrlx() {
        return sqrlx;
    }

    public void setSqrlx(String sqrlx) {
        this.sqrlx = sqrlx;
    }

    public String getSqrmc() {
        return sqrmc;
    }

    public void setSqrmc(String sqrmc) {
        this.sqrmc = sqrmc;
    }

    public String getSqrzjzl() {
        return sqrzjzl;
    }

    public void setSqrzjzl(String sqrzjzl) {
        this.sqrzjzl = sqrzjzl;
    }

    public String getSqrzjh() {
        return sqrzjh;
    }

    public void setSqrzjh(String sqrzjh) {
        this.sqrzjh = sqrzjh;
    }

    public String getXb() {
        return xb;
    }

    public void setXb(String xb) {
        this.xb = xb;
    }

    public String getSqrtxdz() {
        return sqrtxdz;
    }

    public void setSqrtxdz(String sqrtxdz) {
        this.sqrtxdz = sqrtxdz;
    }

    public String getSqryb() {
        return sqryb;
    }

    public void setSqryb(String sqryb) {
        this.sqryb = sqryb;
    }

    public String getSqrgddh() {
        return sqrgddh;
    }

    public void setSqrgddh(String sqrgddh) {
        this.sqrgddh = sqrgddh;
    }

    public String getSqryddh() {
        return sqryddh;
    }

    public void setSqryddh(String sqryddh) {
        this.sqryddh = sqryddh;
    }

    public String getSqrfrmc() {
        return sqrfrmc;
    }

    public void setSqrfrmc(String sqrfrmc) {
        this.sqrfrmc = sqrfrmc;
    }

    public String getSqrfrdh() {
        return sqrfrdh;
    }

    public void setSqrfrdh(String sqrfrdh) {
        this.sqrfrdh = sqrfrdh;
    }

    public String getSqrfrzjzl() {
        return sqrfrzjzl;
    }

    public void setSqrfrzjzl(String sqrfrzjzl) {
        this.sqrfrzjzl = sqrfrzjzl;
    }

    public String getSqrfrzjh() {
        return sqrfrzjh;
    }

    public void setSqrfrzjh(String sqrfrzjh) {
        this.sqrfrzjh = sqrfrzjh;
    }

    public String getSqrfrlxdz() {
        return sqrfrlxdz;
    }

    public void setSqrfrlxdz(String sqrfrlxdz) {
        this.sqrfrlxdz = sqrfrlxdz;
    }

    public String getSqrdlrmc() {
        return sqrdlrmc;
    }

    public void setSqrdlrmc(String sqrdlrmc) {
        this.sqrdlrmc = sqrdlrmc;
    }

    public String getSqrdlrdh() {
        return sqrdlrdh;
    }

    public void setSqrdlrdh(String sqrdlrdh) {
        this.sqrdlrdh = sqrdlrdh;
    }

    public String getSqrdlrzjzl() {
        return sqrdlrzjzl;
    }

    public void setSqrdlrzjzl(String sqrdlrzjzl) {
        this.sqrdlrzjzl = sqrdlrzjzl;
    }

    public String getSqrdlrzjh() {
        return sqrdlrzjh;
    }

    public void setSqrdlrzjh(String sqrdlrzjh) {
        this.sqrdlrzjh = sqrdlrzjh;
    }

    public String getSqrdljg() {
        return sqrdljg;
    }

    public void setSqrdljg(String sqrdljg) {
        this.sqrdljg = sqrdljg;
    }

    public String getSqrdljgdm() {
        return sqrdljgdm;
    }

    public void setSqrdljgdm(String sqrdljgdm) {
        this.sqrdljgdm = sqrdljgdm;
    }

    public String getHjszd() {
        return hjszd;
    }

    public void setHjszd(String hjszd) {
        this.hjszd = hjszd;
    }

    public String getCsny() {
        return csny;
    }

    public void setCsny(String csny) {
        this.csny = csny;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public Long getQxdm() {
        return qxdm;
    }

    public void setQxdm(Long qxdm) {
        this.qxdm = qxdm;
    }

    public String getYxtbm() {
        return yxtbm;
    }

    public void setYxtbm(String yxtbm) {
        this.yxtbm = yxtbm;
    }

    public Long getYxtbsm() {
        return yxtbsm;
    }

    public void setYxtbsm(Long yxtbsm) {
        this.yxtbsm = yxtbsm;
    }

    public Integer getQszt() {
        return qszt;
    }

    public void setQszt(Integer qszt) {
        this.qszt = qszt;
    }

    public Double getQlmj() {
        return qlmj;
    }

    public void setQlmj(Double qlmj) {
        this.qlmj = qlmj;
    }

    public String getQlbl() {
        return qlbl;
    }

    public void setQlbl(String qlbl) {
        this.qlbl = qlbl;
    }

    public String getGyfs() {
        return gyfs;
    }

    public void setGyfs(String gyfs) {
        this.gyfs = gyfs;
    }

    public String getGyqk() {
        return gyqk;
    }

    public void setGyqk(String gyqk) {
        this.gyqk = gyqk;
    }

    public String getSshy() {
        return sshy;
    }

    public void setSshy(String sshy) {
        this.sshy = sshy;
    }

    public String getGzdw() {
        return gzdw;
    }

    public void setGzdw(String gzdw) {
        this.gzdw = gzdw;
    }

    public String getDzyj() {
        return dzyj;
    }

    public void setDzyj(String dzyj) {
        this.dzyj = dzyj;
    }

    public Date getGxsj() {
        return gxsj;
    }

    public void setGxsj(Date gxsj) {
        this.gxsj = gxsj;
    }

    public String getGj() {
        return gj;
    }

    public void setGj(String gj) {
        this.gj = gj;
    }

    @Transient
    public String getSqrlbmc() {
        return sqrlbmc;
    }

    public void setSqrlbmc(String sqrlbmc) {
        this.sqrlbmc = sqrlbmc;
    }

    @Transient
    public String getSqrzjzlmc() {
        return sqrzjzlmc;
    }

    public void setSqrzjzlmc(String sqrzjzlmc) {
        this.sqrzjzlmc = sqrzjzlmc;
    }

    @Transient
    public String getGyfsmc() {
        return gyfsmc;
    }

    public void setGyfsmc(String gyfsmc) {
        this.gyfsmc = gyfsmc;
    }

    @Transient
    public String getSqrlxmc() {
        return sqrlxmc;
    }

    public void setSqrlxmc(String sqrlxmc) {
        this.sqrlxmc = sqrlxmc;
    }
}
