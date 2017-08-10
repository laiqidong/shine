package com.shine.model.ysl;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 资料
 */
@Entity
@Table(name = "datum")
//@SequenceGenerator(name = "SEQ_DATUM", sequenceName = "SEQ_DATUM", allocationSize = 1)
public class Datum {
    private String id;
    private String datumName;
    private String receiveType;
    private Integer originalNumber;
    private Integer copyNumber;
    private String lcdm;
    private boolean status;
    private String datumsortName;
    private String datumGuid;

    @Id
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_DATUM")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDatumName() {
        return datumName;
    }

    public void setDatumName(String datumName) {
        this.datumName = datumName;
    }

    public String getReceiveType() {
        return receiveType;
    }

    public void setReceiveType(String receiveType) {
        this.receiveType = receiveType;
    }

    public Integer getOriginalNumber() {
        return originalNumber;
    }

    public void setOriginalNumber(Integer originalNumber) {
        this.originalNumber = originalNumber;
    }

    public Integer getCopyNumber() {
        return copyNumber;
    }

    public void setCopyNumber(Integer copyNumber) {
        this.copyNumber = copyNumber;
    }

    public String getLcdm() {
        return lcdm;
    }

    public void setLcdm(String lcdm) {
        this.lcdm = lcdm;
    }

    @Transient
    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
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
}
