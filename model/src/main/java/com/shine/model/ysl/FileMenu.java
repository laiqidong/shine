package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "fileMenu")
//@SequenceGenerator(name = "SEQ_FILE_MENU", sequenceName = "SEQ_FILE_MENU", allocationSize = 1)
public class FileMenu {
    private Long id;
    private String menuName;
    private Date updateTime;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
