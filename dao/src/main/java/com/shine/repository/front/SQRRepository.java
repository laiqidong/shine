package com.shine.repository.front;

import com.shine.model.ysl.SQR;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SQRRepository extends JpaRepository<SQR, Long> {
    List<SQR> findByYslywh(String yslywh);

    void deleteByYslywh(String yslywh);
}
