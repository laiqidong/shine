package com.shine.ysl.controller;


import com.shine.repository.front.DictRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("front/dict")
public class DictFrontController {
    @Resource
    private DictRepository dictRepository;

}
