package com.shine.model.ysl;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 权利信息单元关系
 * laiqd 20170609
 */
@Entity
@Table(name = "QLXX_DYGX")
public class QlxxDygx {
    private Long bsm;
    private Long qlbsm;
    private Long dybsm;
    private String bdcdyh;

    @Id
    public Long getBsm() {
        return bsm;
    }

    public void setBsm(Long bsm) {
        this.bsm = bsm;
    }

    public Long getQlbsm() {
        return qlbsm;
    }

    public void setQlbsm(Long qlbsm) {
        this.qlbsm = qlbsm;
    }

    public Long getDybsm() {
        return dybsm;
    }

    public void setDybsm(Long dybsm) {
        this.dybsm = dybsm;
    }

    public String getBdcdyh() {
        return bdcdyh;
    }

    public void setBdcdyh(String bdcdyh) {
        this.bdcdyh = bdcdyh;
    }
}
