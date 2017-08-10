package com.shine.repository.front;

import com.shine.model.ysl.FileEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FileRepository extends JpaRepository<FileEntity,Long> {
    List<FileEntity> findByDatumIdAndYslywh(String datumId, String yslywh);

    void deleteByYslywh(String yslywh);
}
