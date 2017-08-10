package com.shine.service.impl;


import com.shine.model.manage.MenuEntity;
import com.shine.model.manage.RoleEntity;
import com.shine.model.manage.UserEntity;
import com.shine.repository.manage.MenuEntityRepository;
import com.shine.repository.manage.RoleEntityRepository;
import com.shine.repository.manage.UserEntityRepository;
import com.shine.service.PurviewService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by luoxuan on 2017/3/14.
 * Description:
 */
@Service
@Transactional
public class PurviewServiceImpl implements PurviewService {

    @Resource
    private RoleEntityRepository roleEntityRepository;
    @Resource
    private UserEntityRepository userEntityRepository;
    @Resource
    private MenuEntityRepository menuEntityRepository;



    @Override
    public void saveUserEntity(UserEntity t) {
        userEntityRepository.save(t);
    }

    @Override
    public UserEntity getUserEntity(Integer id) {
        return userEntityRepository.getOne(id);
    }

    @Override
    public void saveRoleEntity(RoleEntity t) {
        roleEntityRepository.save(t);
    }

    @Override
    public RoleEntity getRoleEntity(Integer id) {
        return roleEntityRepository.getOne(id);
    }

    @Override
    public List<RoleEntity> getRoleEntityList() {
        return roleEntityRepository.findByStatus(1);
    }

    @Override
    public List<MenuEntity> findAllMenu() {
        List<MenuEntity> menus = menuEntityRepository.findByParentIdAndStatusOrderByOrderNumAsc(0,1);
        for (MenuEntity menu : menus) {
            menu.setChildren( menuEntityRepository.findByParentIdAndStatusOrderByOrderNumAsc(menu.getId(),1));
        }
        return menus;
    }

    @Override
    public List<MenuEntity> findMenuByRoleId(Integer roleId) {
        String[] str=getRoleEntity(roleId).getMenuIds().split(",");
        Integer[] intArr=new Integer[str.length];
        for(int a=0;a<str.length;a++) {
            intArr[a] = Integer.valueOf(str[a]);
        }
        List<MenuEntity> list =  menuEntityRepository.findByParentIdAndStatusAndIdInOrderByOrderNumAsc(0,1,intArr);
        for (MenuEntity menu : list) {
            menu.setChildren( menuEntityRepository.findByParentIdAndStatusAndIdInOrderByOrderNumAsc(menu.getId(),1,intArr));
        }
        return list;
    }

    @Override
    public int deleteMenu(Integer id) {
        return  menuEntityRepository.deleteMenu(id);
    }

    @Override
    public MenuEntity getMenuById(Integer id) {
        return menuEntityRepository.getOne(id);
    }


    @Override
    public void saveMenu(MenuEntity t) {
        menuEntityRepository.save(t);
    }



}
