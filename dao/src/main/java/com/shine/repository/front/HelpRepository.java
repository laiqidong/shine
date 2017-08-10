package com.shine.repository.front;

import com.shine.model.ysl.Help;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ffdn on 2017-6-12.
 */
@Repository
public interface HelpRepository extends JpaRepository<Help,Integer> {
    List<Help> findByStatus(Integer status);
}
