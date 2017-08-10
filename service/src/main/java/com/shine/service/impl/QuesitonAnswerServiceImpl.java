package com.shine.service.impl;


import com.shine.model.ysl.QuestionAnswer;
import com.shine.repository.front.QuestionAnswerRepository;
import com.shine.service.QuestionAnswerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by luoxuan on 2017/4/12.
 * Description:问答接口实现类
 */

@Service
@Transactional
public class QuesitonAnswerServiceImpl implements QuestionAnswerService {

    @Resource
    private QuestionAnswerRepository questionAnswerRepository;

    @Override
    public QuestionAnswer getQuestionAnswer(Integer id) {
        return questionAnswerRepository.getOne(id);
    }

    @Override
    public void saveQuestionAnswer(QuestionAnswer t) {
        questionAnswerRepository.save(t);
    }

    @Override
    public List<QuestionAnswer> getQuestionAnswerList() {
        return questionAnswerRepository.findByStatus(1);
    }
}
