package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by ffdn on 2017-6-13.
 */
@Entity
@Table(name = "help")
//@SequenceGenerator(name = "SEQ_HELP", sequenceName = "SEQ_HELP", allocationSize = 1)
public class Help {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String title;
    @Column(length = 4000)
    private String content;  //富文本内容
    private Date createTime;
    private Integer status;  //状态 1.在用  2.禁用   0.删除

    public Help(){

    }

    public Help setHelp(Help t){
        this.content=t.getContent();
        this.status=t.getStatus();
        this.title=t.getTitle();
        return this;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
