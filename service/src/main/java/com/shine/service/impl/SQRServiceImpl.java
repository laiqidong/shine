package com.shine.service.impl;


import com.shine.repository.front.SQRRepository;
import com.shine.service.SQRService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class SQRServiceImpl implements SQRService {
    @Resource
    private SQRRepository sqrRepository;

    @Override
    public void deleteByYslywh(String yslywh) {
        sqrRepository.deleteByYslywh(yslywh);
    }
}
