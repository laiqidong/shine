package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by luoxuan on 2017/4/12.
 * Description:文书、文件管理
 */
@Entity
@Table
//@SequenceGenerator(name = "SEQ_DOCUMENT_DOWNLOAD", sequenceName = "SEQ_DOCUMENT_DOWNLOAD", allocationSize = 1)
public class DocumentDownload {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;           //文件名
    private String address;   //文件地址
    private Date uploadTime;  //上传时间
    private Integer typeId;       //文件分类
    private String suffix;       //后缀名
    private Integer status;   //状态  1.在用 2.禁用  0.删除
    private String description;  //描述   说明

    public DocumentDownload(){

    }

    public DocumentDownload setDocumentDownload(DocumentDownload t){
        this.typeId=t.getTypeId();
        this.description=t.getDescription();
        this.status=t.getStatus();
        return this;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
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

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }
}
