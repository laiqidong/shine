package com.shine.service.impl;


import com.shine.model.ysl.DocumentDownload;
import com.shine.model.ysl.DownloadType;
import com.shine.repository.front.DocumentDownloadRepository;
import com.shine.repository.front.DownloadTypeRepository;
import com.shine.service.DocumentDownloadService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by luoxuan on 2017/4/12.
 * Description:
 */

@Service
@Transactional
public class DocumentDownloadServiceImpl implements DocumentDownloadService {

    @Resource
    private DocumentDownloadRepository documentDownloadRepository;
    @Resource
    private DownloadTypeRepository downloadTypeRepository;

    @Override
    public DocumentDownload getDocumentDownload(Integer id) {
        return documentDownloadRepository.findOne(id);
    }

    @Override
    public void saveDocumentDownload(DocumentDownload t) {
        documentDownloadRepository.save(t);
    }

    @Override
    public DownloadType getDownloadType(Integer id) {
        return downloadTypeRepository.getOne(id);
    }

    @Override
    public void saveDownloadType(DownloadType t) {
        downloadTypeRepository.save(t);
    }

    @Override
    public List<DownloadType> getDownloadTypeList() {
        return downloadTypeRepository.findByStatus(1);
    }

    @Override
    public List<DownloadType> getDownloadTypeByTypeNot(String type) {
        return downloadTypeRepository.findByTypeAndStatusNot(type,0);
    }

    @Override
    public List<DownloadType> getDownloadTypeByTypeAndIdNot(String type, Integer id) {
        return downloadTypeRepository.findByTypeAndStatusNotAndIdNotIn(type,0,id);
    }

    @Override
    public List<DocumentDownload> getDocumentDownloadByAddressAndIdNot(String address,Integer id) {
        return documentDownloadRepository.findByAddressAndStatusNotAndIdNotIn(address,0,id);
    }
}
