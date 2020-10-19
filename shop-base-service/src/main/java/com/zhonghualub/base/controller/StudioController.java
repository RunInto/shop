package com.zhonghualub.base.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.transform.Result;

/**
 * @author: ys
 * desc:
 * date: 2020/10/19
 */
@Slf4j
@RestController
@RequestMapping("/studio")
public class StudioController {

    @GetMapping("/detail")
    public Result detail() {
        log.info("studio detail");
        return null;
    }

}
