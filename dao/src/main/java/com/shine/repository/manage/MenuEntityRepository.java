package com.shine.repository.manage;

import com.shine.model.manage.MenuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by luoxuan on 2017/2/28.
 * Description:
 */

@Repository
public interface MenuEntityRepository extends JpaRepository<MenuEntity,Integer> {
    List<MenuEntity> findByParentIdAndStatusOrderByOrderNumAsc(Integer parendId, Integer status);
    @Modifying
    @Query(value = "update MenuEntity  set status=0  where id=:id or parentId=:id" ,nativeQuery=true)
    int deleteMenu(@Param("id") Integer id);

    List<MenuEntity> findByParentIdAndStatusAndIdInOrderByOrderNumAsc(Integer parentId, Integer status, Integer ids[]);
}
