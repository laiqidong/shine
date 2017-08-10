package com.shine.service;


import com.shine.model.ysl.QuestionAnswer;

import java.util.List;

/**
 * Created by luoxuan on 2017/4/12.
 * Description:问答接口
 */

public interface QuestionAnswerService {

    /**
     * 查询单个
     * @param id
     * @return
     */
    QuestionAnswer getQuestionAnswer(Integer id);

    /**
     * 修改、保存
     * @param t
     */
    void  saveQuestionAnswer(QuestionAnswer t);

    List<QuestionAnswer> getQuestionAnswerList();
}
