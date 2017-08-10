package com.shine.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * Created by luoxuan on 2017/2/28.
 * Description:
 */
@Repository
public interface YslptDao {
    List<HashMap> queryBySql(@Param("sql") String sql);

    String getYslywh();
}
