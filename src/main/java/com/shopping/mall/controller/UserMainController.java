package com.shopping.mall.controller;

import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.UserDetail;
import com.shopping.mall.domain.UserDto;
import com.shopping.mall.domain.UserMain;
import com.shopping.mall.service.UserDetailService;
import com.shopping.mall.service.UserMainService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/mall/user_main")
public class UserMainController {

    private UserMainService userService;
    private UserDetailService userDetailService;

    public UserMainController(UserMainService userService,
                              UserDetailService userDetailService) {
        this.userService = userService;
        this.userDetailService = userDetailService;
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
                .orElseThrow(() -> new CommonException("error.getAllUser"));
    }

    @ApiOperation("根据用户id删除用户")
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Boolean> deleteUser(@ApiParam(value = "用户id", required = true)
                                              @PathVariable int id) {
        //todo 关联删除用户的所有东西
        return Optional.of(userService.deleteById(id) == 1)
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.deleteUser"));
    }

    @ApiOperation("根据用户id查询地址和手机号")
    @GetMapping(value = "/{id}/query_user_address_and_phone_number")
    public ResponseEntity<Map<String, Object>> getUserAddressAndPhoneNumber(@ApiParam(value = "用户id", required = true)
                                                                            @PathVariable int id) {
        String address = userDetailService.findById(id).getAddress();
        String phoneNumber = userDetailService.findById(id).getPhoneNumber();
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("address", address);
        resultMap.put("phoneNumber", phoneNumber);
        return Optional.of(resultMap)
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.getUserAddressAndPhoneNumber"));
    }

    @ApiOperation("注销登陆")
    @PostMapping(value = "do_logout")
    public ResponseEntity<String> doLogout(HttpSession httpSession) {
        httpSession.setAttribute("currentUser", "");
        return Optional.of("redirect:login")
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.doLogout"));
    }

    @ApiOperation("根据用户id获取用户信息")
    @GetMapping(value = "{id}")
    public ResponseEntity<UserMain> getUserById(@ApiParam(value = "用户id", required = true)
                                                @PathVariable int id) {
        return Optional.ofNullable(userService.findById(id))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.getUserById"));
    }

    @ApiOperation("根据用户id获取用户详细信息")
    @GetMapping(value = "{id}/detail")
    public ResponseEntity<UserDetail> getUserDetailById(@ApiParam(value = "用户id", required = true)
                                                        @PathVariable int id) {
        return Optional.ofNullable(userDetailService.findById(id))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.getUserDetailById"));
    }
}
