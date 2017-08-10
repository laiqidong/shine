package com.shine.dao;


import com.shine.model.ysl.Ysht;
import com.shine.model.ysl.YshtSqr;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 预售合同DAO
 * laiqidong 20170623
 */
@Repository
public interface YshtDao {
    List<Ysht> findByDybsm(@Param("dybsm") String dybsm);

    List<YshtSqr> findByHtbh(@Param("htbh") String htbh);
}
