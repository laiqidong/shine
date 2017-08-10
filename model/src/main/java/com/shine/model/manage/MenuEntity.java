package com.shine.model.manage;


import javax.persistence.*;
import java.util.List;

/**
 * The type Menu entity.
 */
//菜单
@Entity
@Table(name="MENU_ENTITY")
//@SequenceGenerator(name = "SEQ_MENU_ENTITY", sequenceName = "SEQ_MENU_ENTITY", allocationSize = 1)
public class MenuEntity{
    @Id
    @Column(name = "ID", precision = 22, scale = 0)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;//id
    private String menuname;//菜单名称
    private String url;//菜单访问路径
    private Integer orderNum;//菜单序号
    private Integer parentId;//父节点id
    private Integer status=1;  //1.在用，0.删除
    @Transient
    private List<MenuEntity> children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public List<MenuEntity> getChildren() {
        return children;
    }

    public void setChildren(List<MenuEntity> children) {
        this.children = children;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
