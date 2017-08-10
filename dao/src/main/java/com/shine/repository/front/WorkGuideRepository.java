package com.shine.repository.front;

import com.shine.model.ysl.WorkGuide;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by luoxuan on 2017/4/12.
 * Description:
 */

@Repository
public interface WorkGuideRepository extends JpaRepository<WorkGuide,Integer> {
    List<WorkGuide> findByStatus(Integer status);

    List<WorkGuide> findByDjlxAndStatus(String djlx, Integer status);

    List<WorkGuide> findByQllxAndStatusNot(String qllx, Integer Status);

    List<WorkGuide> findByQllxAndStatusNotAndIdNotIn(String qllx, Integer Status, Integer id);
}
