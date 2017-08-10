package com.shine.service.impl;


import com.shine.dao.ManagePageDao;
import com.shine.model.ysl.WorkGuide;
import com.shine.repository.front.WorkGuideRepository;
import com.shine.service.WorkGuideService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ffdn on 2017-5-17.
 */
@Service
@Transactional
public class WorkGuideServiceImpl implements WorkGuideService {

    @Resource
    private WorkGuideRepository workGuideRepository;

    @Resource
    private ManagePageDao managePageDao;

    @Override
    public void saveWorkGuide(WorkGuide t) {
        workGuideRepository.save(t);
    }

    @Override
    public WorkGuide getWorkGuideId(Integer id) {
        return workGuideRepository.getOne(id);
    }

    @Override
    public List<WorkGuide> getWorkGuideList() {
        return workGuideRepository.findByStatus(1);
    }

    @Override
    public List<WorkGuide> getWorkGuide(String djlx) {
        return workGuideRepository.findByDjlxAndStatus(djlx,1);
    }

    @Override
    public List<WorkGuide> getWorkGuideByQllxNot(String qllx) {
        return workGuideRepository.findByQllxAndStatusNot(qllx,0);
    }

    @Override
    public List<WorkGuide> getWorkGuideByQllxAndIdNot(String qllx, Integer id) {
        return workGuideRepository.findByQllxAndStatusNotAndIdNotIn(qllx,0,id);
    }
}
