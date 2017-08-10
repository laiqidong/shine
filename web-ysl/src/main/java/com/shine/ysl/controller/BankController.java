package com.shine.ysl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shine.dao.BankDao;
import com.shine.model.ysl.Bank;
import com.shine.service.DictService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("front/bank")
public class BankController {
    @Resource
    private BankDao bankDao;
    @Resource
    private DictService dictService;
    @RequestMapping("bankPage")
    public String bankPage() {
        return "front/ygdj/bankList";
    }

    @RequestMapping("getBankList")
    @ResponseBody
    public PageInfo getBankList(@RequestParam(required = true, defaultValue = "1") Integer page,
                                @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                Bank bank) {
        PageHelper.startPage(page, pageSize);
        List<Bank> list = bankDao.getBankList(bank);
        for (Bank temp : list) {
            temp.setZjzlmc(dictService.findZjzl(temp.getZjzl()));
        }
        return new PageInfo<>(list);
    }
}
