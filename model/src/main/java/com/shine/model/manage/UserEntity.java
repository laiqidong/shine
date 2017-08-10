package com.shine.model.manage;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "USER_ENTITY")
//@SequenceGenerator(name = "SEQ_USER_ENTITY", sequenceName = "SEQ_USER_ENTITY", allocationSize = 1)
public class UserEntity {
    private Integer id;
    private String username;//用户名
    private String password;//密码
    private String staffName;//员工姓名
    private Date createDate; //创建时间
    private Integer status;//账号状态，1.在用。2.禁用，0.删除
    private Date lastLogin; //最后登录时间
    private String roleName;
    private Integer roleId;

    public UserEntity() {
    }
    public UserEntity setPubUser(UserEntity t) {
        this.staffName=t.getStaffName();
        this.status=t.getStatus();
        this.roleId = t.getRoleId();
        this.roleName=t.getRoleName();
        return this;
    }
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "USERNAME")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "PASSWORD")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "STAFF_NAME")
    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }


    @Column(name="CREATE_DATE")
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Column(name="STATUS",precision =1)
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name="LAST_LOGIN")
    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    @Column(name="ROLE_NAME")
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Column(name = "ROLE_ID")
    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
