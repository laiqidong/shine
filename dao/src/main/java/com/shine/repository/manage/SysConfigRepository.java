package com.shine.repository.manage;

import com.shine.model.system.SysConfig;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by luoxuan on 2017/2/28.
 * Description:
 */

@Repository
public interface SysConfigRepository extends JpaRepository<SysConfig,Integer> {

}
