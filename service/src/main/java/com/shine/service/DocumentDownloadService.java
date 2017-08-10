package com.shine.service;


import com.shine.model.ysl.DocumentDownload;
import com.shine.model.ysl.DownloadType;

import java.util.List;

/**
 * Created by luoxuan on 2017/4/12.
 * Description: 文件下载
 */

public interface DocumentDownloadService {

    DocumentDownload getDocumentDownload(Integer id);

    void saveDocumentDownload(DocumentDownload t);

    DownloadType getDownloadType(Integer id);

    void saveDownloadType(DownloadType t);

    List<DownloadType> getDownloadTypeList();

    List<DownloadType> getDownloadTypeByTypeNot(String type);

    List<DownloadType> getDownloadTypeByTypeAndIdNot(String type, Integer id);

    List<DocumentDownload> getDocumentDownloadByAddressAndIdNot(String address, Integer id);

}
