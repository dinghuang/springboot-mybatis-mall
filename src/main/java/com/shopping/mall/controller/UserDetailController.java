package com.shopping.mall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shopping.mall.core.CommonException;
import com.shopping.mall.core.Result;
import com.shopping.mall.core.ResultGenerator;
import com.shopping.mall.domain.UserDetail;
import com.shopping.mall.service.UserDetailService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/mall/user_detail")
public class UserDetailController {

    private final UserDetailService userDetailService;

    @Autowired
    public UserDetailController(UserDetailService userDetailService) {
        this.userDetailService = userDetailService;
    }

    @ApiOperation("添加用户详情")
    @PutMapping
    public ResponseEntity<UserDetail> add(@ApiParam(value = "用户详情", required = true)
                                          @RequestBody UserDetail userDetail) {
        return Optional.ofNullable(userDetailService.add(userDetail))
                .map(result -> new ResponseEntity<>(result, HttpStatus.CREATED))
                .orElseThrow(() -> new CommonException("error.add"));
    }

    @ApiOperation("删除用户详情")
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Boolean> delete(@ApiParam(value = "用户详情", required = true)
                                          @PathVariable Integer id) {
        return Optional.ofNullable(userDetailService.delete(id))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.delete"));
    }

    @ApiOperation("更新用户详情")
    @PostMapping
    public ResponseEntity<UserDetail> update(@ApiParam(value = "用户详情", required = true)
                                             @RequestBody UserDetail userDetail) {
        return Optional.ofNullable(userDetailService.updateUserDetail(userDetail))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.update"));
    }

    @ApiOperation("根据id获取用户详情")
    @GetMapping("/{id}")
    public ResponseEntity<UserDetail> queryDetail(@ApiParam(value = "用户详情", required = true)
                                                  @PathVariable Integer id) {
        return Optional.ofNullable(userDetailService.findById(id))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.queryDetail"));
    }

    @ApiOperation("分页获取所有用户详情")
    @GetMapping
    public ResponseEntity<PageInfo> list(@ApiParam(value = "页数")
                                         @RequestParam(defaultValue = "0") Integer page,
                                         @ApiParam(value = "页数大小")
                                         @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<UserDetail> list = userDetailService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return Optional.of(pageInfo)
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.queryDetail"));
    }
}
