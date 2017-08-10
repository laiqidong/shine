package com.shine.service;


import com.shine.model.message.Information;
import com.shine.model.ysl.InfoType;

import java.util.List;

public interface InformationService {

	void saveInformation(Information t);

	Information getInformationId(Integer id);

	List<Information> getInformationType(Integer typeId);

	List<Information> getInformationByInfoTitle(String infoTitle);

	List<Information> getInformationByInfoTitleAndIdNot(String infoTitle, Integer id);

	InfoType getInfoType(Integer id);

	void saveInfoType(InfoType t);

	List<InfoType> getInfoTypeList();

	InfoType getInfoTypeType(String type);

	List<InfoType> getTypeByType(String type);

	List<InfoType> getTypeByTypeAndIdNot(String type, Integer id);
}
