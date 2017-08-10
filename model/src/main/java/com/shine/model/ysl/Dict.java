package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "T_DICT")
//@SequenceGenerator(name = "SEQ_DICT", sequenceName = "SEQ_DICT", allocationSize = 1)
public class Dict {
    private Long id;
    private String name;
    private String mc;
    private String code;
    private String value;
    private String use;
    private Integer type;
    private Long parentId;
    private Integer status;
    private String description;
    private Integer version;
    private Date updateTime;

    public Dict() {
    }

    public Dict setDict(Dict t)
    {
        this.id = t.getId();
        this.name = t.getName();
        this.mc=t.getMc();
        this.code = t.getCode();
        this.value = t.getValue();
        this.use = t.getUse();
        this.type=t.getType();
        this.parentId=t.getParentId();
        this.description=t.getDescription();
        this.updateTime=new Date();
        this.version=t.getVersion();
        this.status = t.getStatus();
        return this;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMc() {
        return mc;
    }

    public void setMc(String mc) {
        this.mc = mc;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
