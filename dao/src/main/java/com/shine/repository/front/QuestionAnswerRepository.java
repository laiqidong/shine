package com.shine.repository.front;

import com.shine.model.ysl.QuestionAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by luoxuan on 2017/4/12.
 * Description:
 */

@Repository
public interface QuestionAnswerRepository extends JpaRepository<QuestionAnswer,Integer> {
    List<QuestionAnswer> findByStatus(Integer status);
}
