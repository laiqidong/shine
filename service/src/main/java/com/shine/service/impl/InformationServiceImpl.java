package com.shine.service.impl;


import com.shine.model.message.Information;
import com.shine.model.ysl.InfoType;
import com.shine.repository.front.InfoTypeRepository;
import com.shine.repository.front.InformationRepository;
import com.shine.service.InformationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ffdn on 2017-6-14.
 */
@Service
@Transactional
public class InformationServiceImpl implements InformationService {
    @Resource
    private InformationRepository informationRepository;

    @Resource
    private InfoTypeRepository infoTypeRepository;

    @Override
    public void saveInformation(Information t) {
        informationRepository.save(t);
    }

    @Override
    public Information getInformationId(Integer id) {
        return informationRepository.getOne(id);
    }

    @Override
    public List<Information> getInformationType(Integer typeId) {
        return informationRepository.findByTypeIdAndStatusOrderByInfoDateDesc(typeId,1);
    }

    @Override
    public List<Information> getInformationByInfoTitle(String infoTitle) {
        return informationRepository.findByInfoTitleAndStatusNot(infoTitle,0);
    }

    @Override
    public List<Information> getInformationByInfoTitleAndIdNot(String infoTitle, Integer id) {
        return informationRepository.findByInfoTitleAndStatusNotAndIdNotIn(infoTitle,0,id);
    }

    @Override
    public InfoType getInfoType(Integer id) {
        return infoTypeRepository.getOne(id);
    }

    @Override
    public void saveInfoType(InfoType t) {
        infoTypeRepository.save(t);
    }

    @Override
    public List<InfoType> getInfoTypeList() {
        return infoTypeRepository.findByStatus(1);
    }

    @Override
    public InfoType getInfoTypeType(String type) {
        return infoTypeRepository.findByTypeAndStatus(type,1);
    }

    @Override
    public List<InfoType> getTypeByType(String type) {
        return infoTypeRepository.findByTypeAndStatusNot(type,0);
    }

    @Override
    public List<InfoType> getTypeByTypeAndIdNot(String type, Integer id) {
        return infoTypeRepository.findByTypeAndStatusNotAndIdNotIn(type,0,id);
    }
}
