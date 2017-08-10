package com.shine.dao;


import com.shine.model.ysl.H;
import com.shine.model.ysl.XMGX;
import com.shine.model.ysl.ZD;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RegisterDao {
    /**
     * 获取宗地
     * @param param
     * @return
     */
    List<ZD> getLandList(Map<String, Object> param);

    /**
     * 获取自然幢
     * @param zddm
     * @param zdshiyqbsm
     * @return
     */
    List<Map<String,Object>> getBuildings(@Param("zddm") String zddm, @Param("zdshiyqbsm") String zdshiyqbsm);

    /**
     * 获取户信息
     * @param zrzbsm
     * @return
     */
    List<Map<String,Object>> getHouses(@Param("zrzbsm") String zrzbsm, @Param("ygzt") String ygzt, @Param("qszt") String qszt);

    /**
     * 获取房屋信息
     * @param dybsm
     * @return
     */
    Map<String,Object> getHouseDetail(@Param("dybsm") String dybsm);

    /**
     * 获取登记列表
     * @param dybsm
     * @return
     */
    List<Map<String,Object>> getRegisterList(@Param("dybsm") String dybsm);
    /**
     * 获取房屋
     * @param zfbsm
     * @return
     */
    List<Map<String,Object>> getHousesByZfbsm(@Param("zfbsm") String zfbsm);

    List<H> getHousesByYslywh(@Param("yslywh") String yslywh);

    List<XMGX> findXmgxByDybsm(@Param("dybsm") Long dybsm);

    int isBlz(@Param("dybsm") Long dybsm);
}
