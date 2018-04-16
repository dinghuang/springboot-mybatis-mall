package com.shopping.mall.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.domain.UserDetail;
import com.shopping.mall.domain.UserDto;
import com.shopping.mall.domain.UserMain;
import com.shopping.mall.service.UserDetailService;
import com.shopping.mall.service.UserMainService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Condition;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/mall/user_main")
public class UserMainController {

    private final UserMainService userService;

    @Autowired
    public UserMainController(UserMainService userService) {
        this.userService = userService;
    }

    @ApiOperation("用户登陆")
    @PostMapping(value = "/do_login")
    public ResponseEntity<String> doLogin(@ApiParam(value = "用户登陆信息", required = true)
                                          @RequestBody UserMain userMain, HttpSession httpSession) {
        return Optional.ofNullable(userService.doLogin(userMain, httpSession))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.doLogin"));
    }

    @ApiOperation("用户注册")
    @PutMapping(value = "/do_register")
    public ResponseEntity<String> doRegister(@ApiParam(value = "用户注册信息", required = true)
                                                 @RequestBody UserDto userDto) {
        return Optional.ofNullable(userService.doRegister(userDto))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.doRegister"));
    }

    @ApiOperation("用户信息更新")
    @PostMapping
    public ResponseEntity<Boolean> doUpdate(@ApiParam(value = "用户更新信息", required = true)
                                            @RequestBody UserDto userDto) {
        return Optional.ofNullable(userService.doUpdate(userDto))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.doUpdate"));
    }

    @ApiOperation("获取所有用户")
    @GetMapping
    public ResponseEntity<List<UserMain>> getAllUser() {
        return Optional.ofNullable(userService.findAll())
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.doLogin"));
    }

//    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String, Object> deleteUser(int id) {
//        String result = "fail";
//        if (userDetailService.deleteById(id) == 1) {
//            if (userService.deleteById(id) == 1) {
//                result = "success";
//            }
//        }
//        Map<String, Object> resultMap = new HashMap<>();
//        resultMap.put("result", result);
//        return resultMap;
//    }
//
//    @RequestMapping(value = "/getUserAddressAndPhoneNumber", method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String, Object> getUserAddressAndPhoneNumber(int id) {
//        String address = userDetailService.findById(id).getAddress();
//        String phoneNumber = userDetailService.findById(id).getPhoneNumber();
//        Map<String, Object> resultMap = new HashMap<>();
//        resultMap.put("address", address);
//        resultMap.put("phoneNumber", phoneNumber);
//        return resultMap;
//    }
//
//    @RequestMapping(value = "/doLogout")
//    public String doLogout(HttpSession httpSession) {
//        httpSession.setAttribute("currentUser", "");
//        return "redirect:login";
//    }
//
//    @RequestMapping(value = "/getUserById", method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String, Object> getUserById(int id) {
//        UserMain user = userService.findById(id);
//        String result = JSON.toJSONString(user);
//        Map<String, Object> resultMap = new HashMap<String, Object>();
//        resultMap.put("result", result);
//        return resultMap;
//    }
//
//    @RequestMapping(value = "/getUserDetailById", method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String, Object> getUserDetailById(int id) {
//        UserDetail userDetail = userDetailService.findById(id);
//        String result = JSON.toJSONString(userDetail);
//        Map<String, Object> resultMap = new HashMap<>();
//        resultMap.put("result", result);
//        return resultMap;
//    }
}
