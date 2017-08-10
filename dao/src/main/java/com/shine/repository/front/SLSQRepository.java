package com.shine.repository.front;

import com.shine.model.ysl.SLSQ;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface SLSQRepository extends JpaRepository<SLSQ, Long>, PagingAndSortingRepository<SLSQ, Long> {
    SLSQ findByYslywh(String yslywh);

    void deleteByYslywh(String yslywh);

    @Query("select t.yslywh from SLSQ t where t.yslywh like concat('%',:yslywh,'%') order by t.yslywh")
    List<String> findYslywhs(@Param("yslywh") String yslywh);

    List<SLSQ> findByYslywhLike(String yslywh);

    @Modifying
    @Query("update SLSQ t set t.zt = 2 where t.yslywh like concat('%',:yslywh,'%')")
    @Transactional
    void updateSlsqZt(@Param("yslywh") String yslywh);
}
