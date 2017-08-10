package com.shine.repository.front;

import com.shine.model.ysl.DocumentDownload;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by luoxuan on 2017/4/12.
 * Description:
 */

@Repository
public interface DocumentDownloadRepository extends JpaRepository<DocumentDownload,Integer> {
    List<DocumentDownload> findByTypeIdAndStatus(Integer typeId, Integer status);

    List<DocumentDownload> findByAddressAndStatusNotAndIdNotIn(String address, Integer status, Integer id);
}
