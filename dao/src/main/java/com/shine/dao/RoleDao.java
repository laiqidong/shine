package com.shine.dao;

import com.shine.model.manage.RoleEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao {

    List<RoleEntity> findAll(RoleEntity t);
}
