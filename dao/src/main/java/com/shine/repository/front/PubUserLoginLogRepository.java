package com.shine.repository.front;

import com.shine.model.ysl.PubUserLoginLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by Guosq on 2017/05/09.
 */
public interface PubUserLoginLogRepository  extends JpaRepository<PubUserLoginLog,Integer> {
    @Query(value = "SELECT  t FROM PubUserLoginLog t WHERE  t.userId=:userId order by t.id desc" )
    List<PubUserLoginLog> findByUserIdOrderById(@Param("userId") Integer userId);

}
