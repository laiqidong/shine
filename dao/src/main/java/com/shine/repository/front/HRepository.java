
package com.shine.repository.front;

import com.shine.model.ysl.H;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface HRepository extends JpaRepository<H, Long> {
    @Query(value = "SELECT  t FROM H t WHERE  t.bdcdyh=:bdcdyh")
    H findByBdcdyh(@Param("bdcdyh") String bdcdyh);
}
