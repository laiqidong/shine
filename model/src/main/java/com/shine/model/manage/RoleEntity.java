package com.shine.model.manage;

import javax.persistence.*;

//角色
@Entity
@Table(name="ROLE_ENTITY")
//@SequenceGenerator(name = "SEQ_ROLE_ENTITY", sequenceName = "SEQ_ROLE_ENTITY", allocationSize = 1)
public class RoleEntity {

    @Id
    @Column(name = "ID", precision = 22, scale = 0)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;//id
    private String roleName;//角色名称
    private String description;//描述
    private Integer status; //1.在用。 0 删除 。
    private String menuIds; //菜单ID
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
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

    public String getMenuIds() {
        return menuIds;
    }

    public void setMenuIds(String menuIds) {
        this.menuIds = menuIds;
    }
}
