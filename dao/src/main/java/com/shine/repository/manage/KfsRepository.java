package com.shine.repository.manage;

import com.shine.model.ysl.KFS;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by luoxuan on 2017/5/25.
 * Description:
 */

@Repository
public interface KfsRepository extends JpaRepository<KFS,Integer> {
}
