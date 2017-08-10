package com.shine.repository.front;

import com.shine.model.ysl.XMGX;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface XMGXRepository extends JpaRepository<XMGX, Long> {
    List<XMGX> findByYslywh(String yslywh);

    void deleteByYslywh(String yslywh);

    List<XMGX> findByDybsm(Long dybsm);

    @Query("select t from XMGX t where t.yslywh  like CONCAT('%',:yslywh,'%') order by t.yslywh")
    List<XMGX> findByYslywhLike(@Param("yslywh") String yslywh);
}
