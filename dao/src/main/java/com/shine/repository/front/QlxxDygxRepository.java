package com.shine.repository.front;

import com.shine.model.ysl.QlxxDygx;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QlxxDygxRepository extends JpaRepository<QlxxDygx,Long> {
    List<QlxxDygx> findByDybsm(Long dybsm);
    QlxxDygx findByQlbsm(Long qlbsm);
}
