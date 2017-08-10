package com.shine.dao;

import com.shine.model.ysl.Datum;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DatumDao {
    List<Datum> getDatum(@Param("lcdm") String lcdm,
                         @Param("datumsortName") String datumsortName,
                         @Param("yslywh") String yslywh);
}
