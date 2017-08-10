package com.shine.repository.front;

import com.shine.model.message.Information;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ffdn on 2017-6-14.
 */
@Repository
public interface InformationRepository extends JpaRepository<Information,Integer> {
    List<Information> findByStatus(Integer status);

    List<Information> findByTypeIdAndStatusOrderByInfoDateDesc(Integer typeId, Integer status);

    List<Information> findByInfoTitleAndStatusNot(String infoTitle, Integer Status);

    List<Information> findByInfoTitleAndStatusNotAndIdNotIn(String infoTitle, Integer Status, Integer id);

}
