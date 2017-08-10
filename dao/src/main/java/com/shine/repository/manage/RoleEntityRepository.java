package com.shine.repository.manage;

import com.shine.model.manage.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by luoxuan on 2017/2/28.
 * Description:
 */

@Repository
public interface RoleEntityRepository extends JpaRepository<RoleEntity,Integer> {
    List<RoleEntity> findByStatus(Integer status);
}
