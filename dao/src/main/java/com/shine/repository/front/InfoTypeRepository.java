package com.shine.repository.front;

import com.shine.model.ysl.InfoType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by ffdn on 2017-6-15.
 */
public interface InfoTypeRepository extends JpaRepository<InfoType,Integer> {
    List<InfoType> findByStatus(Integer status);

    InfoType findByTypeAndStatus(String type, Integer status);

    List<InfoType> findByTypeAndStatusNot(String type, Integer status);

    List<InfoType> findByTypeAndStatusNotAndIdNotIn(String type, Integer status, Integer id);
}
