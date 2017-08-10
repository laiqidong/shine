package com.shine.model.ysl;

import javax.persistence.*;

/**
 * Created by ffdn on 2017-5-20.
 */
@Entity
@Table
//@SequenceGenerator(name = "SEQ_DOWNLOAD_TYPE", sequenceName = "SEQ_DOWNLOAD_TYPE", allocationSize = 1)
public class DownloadType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String type;     //文件类型类型
    private Integer status;   //状态  1.在用 2.禁用  0.删除
    private String description;  //描述   说明

    public DownloadType(){

    }

    public DownloadType setDownloadType(DownloadType t){
        this.type=t.getType();
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
}
