package com.shine.service;


import com.shine.model.manage.MenuEntity;
import com.shine.model.manage.RoleEntity;
import com.shine.model.manage.UserEntity;

import java.util.List;

/**
 * Created by luoxuan on 2017/3/14.
 * Description: 管理平台管理模块Service
 */
public interface PurviewService {

    void saveUserEntity(UserEntity t);

    UserEntity getUserEntity(Integer id);

    void saveRoleEntity(RoleEntity t);

    RoleEntity getRoleEntity(Integer id);

    List<RoleEntity> getRoleEntityList();

    List<MenuEntity> findAllMenu();

    List<MenuEntity> findMenuByRoleId(Integer roleId);

    int deleteMenu(Integer id);

    MenuEntity getMenuById(Integer id);

    void saveMenu(MenuEntity t);


}
