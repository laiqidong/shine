package com.shine.model.system;

import javax.persistence.*;

/**
 * Created by luoxuan on 2017/3/2.
 * Description:通用功能配置
 */
@Entity
@Table(name = "SYS_CONFIG")
@SequenceGenerator(name = "SEQ_SYS_CONFIG", sequenceName = "SEQ_SYS_CONFIG", allocationSize = 1)
public class SysConfig {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_SYS_CONFIG")
    private Integer id;
    private String name; //功能名称
    private String code;    //名称代码
    private String value; //值
    private String description; //描述
    private Integer status ;  //1.在用。0.删除

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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {

        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
