package com.shine.dao;

import com.shine.model.ysl.Qlxx;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QlxxDao {
    List<Qlxx> findByDybsm(@Param("dybsm") Long dybsm);
}
