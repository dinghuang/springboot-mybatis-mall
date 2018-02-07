package com.shopping.mall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shopping.mall.core.Result;
import com.shopping.mall.core.ResultGenerator;
import com.shopping.mall.domain.UserDetail;
import com.shopping.mall.service.UserDetailService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2018/02/02.
*/
@RestController
@RequestMapping("/user/detail")
public class UserDetailController {
    @Resource
    private UserDetailService userDetailService;

    @PostMapping("/add")
    public Result add(UserDetail userDetail) {
        userDetailService.save(userDetail);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        userDetailService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/update")
    public Result update(UserDetail userDetail) {
        userDetailService.update(userDetail);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        UserDetail userDetail = userDetailService.findById(id);
        return ResultGenerator.genSuccessResult(userDetail);
    }

    @PostMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<UserDetail> list = userDetailService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
