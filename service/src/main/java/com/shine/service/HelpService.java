package com.shine.service;


import com.shine.model.ysl.Help;

import java.util.List;

/**
 * Created by ffdn on 2017-6-12.
 */
public interface HelpService {
    void saveHelp(Help t);

    Help getHelpId(Integer id);

    List<Help> getHelpList();

}
