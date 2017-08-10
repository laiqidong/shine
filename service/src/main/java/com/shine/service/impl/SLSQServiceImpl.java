package com.shine.service.impl;


import com.shine.repository.front.FileRepository;
import com.shine.repository.front.SLSQRepository;
import com.shine.repository.front.SQRRepository;
import com.shine.repository.front.XMGXRepository;
import com.shine.service.SLSQService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class SLSQServiceImpl implements SLSQService {
    @Resource
    private SLSQRepository slsqRepository;
    @Resource
    private SQRRepository sqrRepository;
    @Resource
    private XMGXRepository xmgxRepository;
    @Resource
    private FileRepository fileRepository;

    @Override
    public void delete(String yslywh) {
        slsqRepository.deleteByYslywh(yslywh);
        sqrRepository.deleteByYslywh(yslywh);
        xmgxRepository.deleteByYslywh(yslywh);
        fileRepository.deleteByYslywh(yslywh);
    }
}
