package com.shine.repository.front;

import com.shine.model.ysl.Qlxx;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QlxxRepository extends JpaRepository<Qlxx, Long> {
    Qlxx findByQlbsm(Long qlbsm);
}
