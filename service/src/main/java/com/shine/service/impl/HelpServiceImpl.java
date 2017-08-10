package com.shine.service.impl;


import com.shine.model.ysl.Help;
import com.shine.repository.front.HelpRepository;
import com.shine.service.HelpService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ffdn on 2017-6-12.
 */
@Service
@Transactional
public class HelpServiceImpl implements HelpService {
    @Resource
    private HelpRepository helpRepository;

    @Override
    public void saveHelp(Help t) {
        helpRepository.save(t);
    }

    @Override
    public Help getHelpId(Integer id) {
        return helpRepository.getOne(id);
    }

    @Override
    public List<Help> getHelpList() {
        return helpRepository.findByStatus(1);
    }


}
