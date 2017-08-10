package com.shine.ysl.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shine.dao.RegisterDao;
import com.shine.model.ysl.XMGX;
import com.shine.model.ysl.ZD;
import com.shine.repository.front.XMGXRepository;
import com.shine.service.RegisterService;
import com.shine.ysl.constants.DescribableEnum;
import com.shine.ysl.constants.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 宗地、自然幢、房屋信息查询
 */
@Controller
@RequestMapping("register")
public class RegisterController extends ActionCommon {
    @Resource
    private RegisterDao registerDao;

    @Resource
    private RegisterService registerService;

    @Resource
    private XMGXRepository xmgxRepository;

    /**
     * 获取宗地
     *
     * @param param 参数，page 和 pageSize 不可为空
     * @return
     */
    @RequestMapping(value = "getLandList", method = RequestMethod.POST)
    @ResponseBody
    public Object getLandList(@RequestBody Map<String, Object> param) {
        Integer page = (Integer) param.get("page");
        Integer pageSize = (Integer) param.get("pageSize");
        PageHelper.startPage(page, pageSize);
        List<ZD> landList = registerDao.getLandList(param);
        PageInfo pageInfo = new PageInfo<>(landList);
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        jsonResult.addData("pageInfo", pageInfo);
        return jsonResult;
    }

    /**
     * 获取自然幢
     *
     * @param zddm       宗地代码
     * @param zdshiyqbsm 宗地使用权标识码
     * @return
     */
    @RequestMapping(value = "getBuildings", method = RequestMethod.GET)
    @ResponseBody
    public Object getBuildings(String zddm, String zdshiyqbsm) {
        List<Map<String, Object>> buildings = registerDao.getBuildings(zddm, zdshiyqbsm);
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        jsonResult.addData("buildings", buildings);
        return jsonResult;
    }

    /**
     * 获取户信息
     *
     * @param zrzbsm 自然幢标识码
     * @return
     */
    @RequestMapping(value = "getHouses", method = RequestMethod.GET)
    @ResponseBody
    public Object getHouses(String zrzbsm, String ygzt,String qszt) {
        Map<String, Object> houseMap = registerService.getHouses(zrzbsm, ygzt,qszt);
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        jsonResult.addData("houseMap", houseMap);
        return jsonResult;
    }


    @RequestMapping(value = "getHouseDetail/{dybsm}", method = RequestMethod.GET)
    @ResponseBody
    public Object getHouseDetail(@PathVariable String dybsm) {
        Map<String, Object> house = registerDao.getHouseDetail(dybsm);
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        jsonResult.addData("house", house);
        return jsonResult;
    }

    @RequestMapping(value = "checkBlz", method = RequestMethod.GET)
    @ResponseBody
    public Object checkBlz(String dybsm, String yslywh) {
        List<XMGX> xmgxes = registerDao.findXmgxByDybsm(Long.valueOf(dybsm));
        boolean blz = false;
        for (XMGX xmgx : xmgxes) {
            blz = !xmgx.getYslywh().equals(yslywh);
            if (blz) {
                break;
            }
        }
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        jsonResult.addData("blz", blz);
        return jsonResult;
    }

    @RequestMapping(value = "getRegisterList/{dybsm}", method = RequestMethod.GET)
    @ResponseBody
    public Object getRegisterList(@PathVariable String dybsm) {
        List<Map<String, Object>> registers = registerDao.getRegisterList(dybsm);
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        jsonResult.addData("registers", registers);
        return jsonResult;
    }

    @RequestMapping(value = "getHousesByZfbsm/{dybsm}", method = RequestMethod.GET)
    @ResponseBody
    public Object getHousesByZfbsm(@PathVariable String dybsm) {
        List<Map<String, Object>> houses = registerDao.getHousesByZfbsm(dybsm);
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        jsonResult.addData("houses", houses);
        return jsonResult;
    }
}
