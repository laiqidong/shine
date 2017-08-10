package com.shine.service;


import com.shine.model.ysl.WorkGuide;

import java.util.List;

/**
 * Created by ffdn on 2017-5-17.
 */
public interface WorkGuideService {
    void saveWorkGuide(WorkGuide t);

    WorkGuide getWorkGuideId(Integer id);

    List<WorkGuide> getWorkGuideList();

    List<WorkGuide> getWorkGuide(String djlx);

    List<WorkGuide> getWorkGuideByQllxNot(String qllx);

    List<WorkGuide> getWorkGuideByQllxAndIdNot(String qllx, Integer id);
}
