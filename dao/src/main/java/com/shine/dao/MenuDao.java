package com.shine.dao;

import com.shine.model.manage.MenuEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao {
    int addMenu(MenuEntity menuEntity);

    int updateMenu(MenuEntity menuEntity);

    int deleteMenu(Integer id);

    List<MenuEntity> findByParentId(Integer parentId);

    MenuEntity getMenuById(Integer id);

    List<Integer> getMenuIdByRole(Integer id);

    int deleteRoleMenuByRoleID(Integer roleId);

    int saveRoleMenu(@Param("roleId") Integer roleId, @Param("menuId") Integer menuId);
}
