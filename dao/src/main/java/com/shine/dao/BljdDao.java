package com.shine.dao;

import com.shine.model.lchj.Bljd;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BljdDao {

    Bljd findByYwhAndSfzh(@Param("ywh") String ywh, @Param("zjh") String sfzh);
    List<Bljd> findBySfzhAndSjhm(@Param("sjhm") String sjhm, @Param("zjh") String sfzh);
}
