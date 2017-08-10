package com.shine.repository.manage;

import com.shine.model.manage.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by luoxuan on 2017/2/28.
 * Description:
 */

@Repository
public interface UserEntityRepository extends JpaRepository<UserEntity,Integer> {
    UserEntity findByUsernameAndStatus(String username, Integer status);
}
