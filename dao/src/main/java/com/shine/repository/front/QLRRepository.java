package com.shine.repository.front;

import com.shine.model.ysl.QLR;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QLRRepository extends JpaRepository<QLR, Long> {
    List<QLR> findByDybsmAndQlbmAndDjzl(Long dybsm, String qlbm, String djzl);

    List<QLR> findByDybsmAndQlbm(Long dybsm, String qlbm);
}
