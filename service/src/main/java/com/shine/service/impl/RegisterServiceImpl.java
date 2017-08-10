package com.shine.service.impl;


import com.shine.dao.RegisterDao;
import com.shine.service.RegisterService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RegisterServiceImpl implements RegisterService {
    @Resource
    private RegisterDao registerDao;

    @Override
    public Map<String, Object> getHouses(String zrzbsm, String ygzt,String qszt) {
        List<Map<String, Object>> houses = registerDao.getHouses(zrzbsm, ygzt,qszt);

        List<String> chs = new ArrayList<>();
        List<String> dyhs = new ArrayList<>();
        for (Map<String, Object> house : houses) {
            int blz = registerDao.isBlz(Long.valueOf(String.valueOf(house.get("BSM"))));
            if (blz > 0) {
                house.put("BLZ", "1");
            } else {
                house.put("BLZ", "0");
            }
            String ch = (String) house.get("CH");
            ch = StringUtils.isBlank(ch) ? "null" : ch;
            if (!chs.contains(ch)) {
                chs.add(ch);
            }
            String dyh = (String) house.get("DYH");
            dyh = StringUtils.isBlank(dyh) ? "null" : dyh;
            if (!dyhs.contains(dyh)) {
                dyhs.add(dyh);
            }
        }
        Map<String, Object> houseMap = new HashMap<>();
        //层号排序
        for (int i = 0; i < chs.size(); i++) {
            for (int j = 0; j < chs.size() - i - 1; j++) {
                int a;
                int b;
                try {
                    a = Integer.valueOf(chs.get(j));
                } catch (Exception e) {
                    a = -9999;
                }
                try {
                    b = Integer.valueOf(chs.get(j + 1));
                } catch (Exception e) {
                    b = -9999;
                }
                if (a < b) {
                    String r = chs.get(j);
                    chs.set(j, chs.get(j + 1));
                    chs.set(j + 1, r);
                }
            }
        }
        houseMap.put("chs", chs);
        houseMap.put("dyhs", dyhs);
        houseMap.put("houses", houses);
        return houseMap;
    }
}
