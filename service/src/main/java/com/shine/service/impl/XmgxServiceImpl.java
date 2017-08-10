package com.shine.service.impl;


import com.shine.model.ysl.XMGX;
import com.shine.repository.front.XMGXRepository;
import com.shine.service.XmgxService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class XmgxServiceImpl implements XmgxService {
    @Resource
    private XMGXRepository xmgxRepository;
    @Override
    public void deleteByYslywh(String yslywh) {
        List<XMGX> xmgxList = xmgxRepository.findByYslywh(yslywh);
        if (xmgxList.size() > 0) {
            xmgxRepository.delete(xmgxList);
        }
    }
}
