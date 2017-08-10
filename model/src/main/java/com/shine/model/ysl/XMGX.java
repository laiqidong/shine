package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "XMGX")
//@SequenceGenerator(name = "SEQ_XMGX", sequenceName = "SEQ_XMGX", allocationSize = 1)
public class XMGX {
    private Long bsm;
    private Integer djlx;
    private String dybm;
    private Long dybsm;
    private String qlbm;
    private String bdcdyh;
    private String yslywh;
    private Integer qxdm;
    private Date gxsj;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getBsm() {
        return bsm;
    }

    public void setBsm(Long bsm) {
        this.bsm = bsm;
    }
    @Column(length = 10)
    public Integer getDjlx() {
        return djlx;
    }

    public void setDjlx(Integer djlx) {
        this.djlx = djlx;
    }
    @Column(length = 50)
    public String getDybm() {
        return dybm;
    }

    public void setDybm(String dybm) {
        this.dybm = dybm;
    }
    @Column(length = 50)
    public String getQlbm() {
        return qlbm;
    }

    public void setQlbm(String qlbm) {
        this.qlbm = qlbm;
    }
    @Column(length = 50)
    public String getBdcdyh() {
        return bdcdyh;
    }

    public void setBdcdyh(String bdcdyh) {
        this.bdcdyh = bdcdyh;
    }
    @Column(length = 50)
    public String getYslywh() {
        return yslywh;
    }

    public void setYslywh(String yslywh) {
        this.yslywh = yslywh;
    }
    @Column(length = 6)
    public Integer getQxdm() {
        return qxdm;
    }

    public void setQxdm(Integer qxdm) {
        this.qxdm = qxdm;
    }

    public Long getDybsm() {
        return dybsm;
    }

    public void setDybsm(Long dybsm) {
        this.dybsm = dybsm;
    }

    public Date getGxsj() {
        return gxsj;
    }

    public void setGxsj(Date gxsj) {
        this.gxsj = gxsj;
    }
}
