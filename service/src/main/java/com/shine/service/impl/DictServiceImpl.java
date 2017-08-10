package com.shine.service.impl;


import com.shine.model.ysl.Dict;
import com.shine.repository.front.DictRepository;
import com.shine.service.DictService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class DictServiceImpl implements DictService {
    @Resource
    private DictRepository dictRepository;
    @Override
    public String findQlrlb(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("QLRLB", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }
    @Override
    public String findZjzl(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("ZJZL", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }
    @Override
    public String findGyfs(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("GYFS", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }
    @Override
    public String findDyfs(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("DYFS", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }
    @Override
    public String findQdfs(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("QDFS", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }
    @Override
    public String findFkfs(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("FKFS", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }
    @Override
    public List<Dict> findList(String name) {
        return dictRepository.findAllByName(name);
    }

    @Override
    public String findLcdm(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("LCDM", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }

    @Override
    public String findQlrlx(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("QLRLX", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }

    @Override
    public Dict getDict(Long id) {
        return dictRepository.getOne(id);
    }

    @Override
    public void saveDict(Dict t) {
        dictRepository.save(t);
    }

    @Override
    public String findDklx(String code) {
        Dict dict = dictRepository.findAllByNameAndCode("DKLX", code);
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }

    @Override
    public String findZjzlCode(String zjlx) {
        Dict dict = dictRepository.findAllByNameAndValue("ZJZL", zjlx);
        if (dict == null) {
            return "";
        }
        return dict.getCode();
    }

    @Override
    public String findQxdm() {
        Dict dict = dictRepository.findAllByNameAndCode("QXDM","QXDM");
        if (dict == null) {
            return "";
        }
        return dict.getValue();
    }
}
