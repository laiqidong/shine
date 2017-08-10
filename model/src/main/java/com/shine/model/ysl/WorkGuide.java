package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by luoxuan on 2017/4/11.
 * Description:操作指南
 */
@Entity
@Table
//@SequenceGenerator(name = "SEQ_WORK_GUIDE", sequenceName = "SEQ_WORK_GUIDE", allocationSize = 1)
public class WorkGuide {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String qllx;   //权利类型
    private String djlx;  //登记类型
    @Column(length = 9999)
    private String content;  //富文本内容
    private Integer status;
    private Date createTime;
    private String createName;
    private Integer lcdm;  //流程代码
    private String syqx;//适用情形

    public WorkGuide(){

    }

    public WorkGuide setWorkGuide(WorkGuide t){
        this.createName=t.getCreateName();
        this.content=t.getContent();
        this.qllx=t.getQllx();
        this.djlx=t.getDjlx();
        this.status=t.getStatus();
        this.lcdm=t.getLcdm();
        this.syqx=t.getSyqx();
        return this;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQllx() {
        return qllx;
    }

    public void setQllx(String qllx) {
        this.qllx = qllx;
    }

    public String getDjlx() {
        return djlx;
    }

    public void setDjlx(String djlx) {
        this.djlx = djlx;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    public Integer getLcdm() {
        return lcdm;
    }

    public void setLcdm(Integer lcdm) {
        this.lcdm = lcdm;
    }

    public String getSyqx() {
        return syqx;
    }

    public void setSyqx(String syqx) {
        this.syqx = syqx;
    }
}
