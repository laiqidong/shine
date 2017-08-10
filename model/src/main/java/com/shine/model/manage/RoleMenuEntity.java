package com.shine.model.manage;

import javax.persistence.*;

/**
 * Created by luoxuan on 2017/3/1.
 * Description:
 */
@Entity
@Table(name="ROLE_MENU_ENTITY")
//@SequenceGenerator(name = "SEQ_ROLE_MENU_ENTITY", sequenceName = "SEQ_ROLE_MENU_ENTITY", allocationSize = 1)
public class RoleMenuEntity {
    @Id
    @Column(name = "ID", precision = 22, scale = 0)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;//id
    private Integer roleId;
    private Integer menuId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }
}
