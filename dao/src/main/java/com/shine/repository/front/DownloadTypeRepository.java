package com.shine.repository.front;

import com.shine.model.ysl.DownloadType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ffdn on 2017-5-20.
 */
@Repository
public interface DownloadTypeRepository extends JpaRepository<DownloadType,Integer> {
    List<DownloadType> findByStatus(Integer status);

    List<DownloadType> findByTypeAndStatusNot(String type, Integer Status);

    List<DownloadType> findByTypeAndStatusNotAndIdNotIn(String type, Integer Status, Integer id);
}
