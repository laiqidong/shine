package com.shine.dao;

import com.shine.model.manage.UserEntity;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface UserDao {

    List<HashMap> getUserEntityList(UserEntity t);

}
