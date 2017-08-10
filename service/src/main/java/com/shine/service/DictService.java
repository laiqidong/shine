package com.shine.service;


import com.shine.model.ysl.Dict;

import java.util.List;

public interface DictService {
    String findQlrlb(String code);

    String findZjzl(String code);

    String findGyfs(String code);

    String findDyfs(String code);

    String findQdfs(String code);

    List<Dict> findList(String name);

    String findFkfs(String code);

    String findLcdm(String code);

    String findQlrlx(String code);

    String findQxdm();

    Dict getDict(Long id);

    void saveDict(Dict t);

    String findDklx(String code);

    String findZjzlCode(String zjlx);
}
