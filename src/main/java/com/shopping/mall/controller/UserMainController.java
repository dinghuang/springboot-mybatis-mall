package com.shopping.mall.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.domain.UserDetail;
import com.shopping.mall.domain.UserMain;
import com.shopping.mall.service.UserDetailService;
import com.shopping.mall.service.UserMainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Condition;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Controller
public class UserMainController {
    @Resource
    private UserMainService userService;
    @Resource
    UserDetailService userDetailService;

    @RequestMapping("/")
    public String index() {
        return "main";
    }

    @RequestMapping(value = "/register")
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/amend_info")
    public String amend_info() {
        return "amend_info";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/main")
    public String main() {
        return "main";
    }

    @RequestMapping(value = "/control")
    public String control(HttpSession httpSession) {
        if (httpSession.getAttribute("currentUser") == null||httpSession.getAttribute("currentUser").equals("")) {
            return "main";
        }else{
            UserMain userMain = (UserMain) httpSession.getAttribute("currentUser");
            if (userMain.getRole() == 1) {
                return "control";
            } else {
                return "main";
            }
        }
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doLogin(String userNameOrEmail, String password, HttpSession httpSession) {
        System.out.println("我接收到了登录请求" + userNameOrEmail + " " + password);
        String result;
        Condition condition = new Condition(ShoppingCar.class);
        condition.createCriteria().andCondition(" name = '" + userNameOrEmail + "' or email = '" + userNameOrEmail + "'");
        UserMain user = userService.findByCondition(condition).get(0);
        if (user == null) {
            result = "unexist";
        } else {
            UserDetail userDetail = userDetailService.findById(user.getId());
            if (userDetail.getPassword().equals(password)) {
                result = "success";
                httpSession.setAttribute("currentUser", user);
            } else {
                result = "wrong";
            }
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doRegister(String userName, String email, String nickName, String password, String phoneNumber, int sex, String birthday, String postNumber, String address) {

        String result;
        UserMain user = userService.findBy("name", userName);
        if (user != null) {
            result = "nameExist";
        } else {
            user = userService.findBy("email", email);
            if (user != null) {
                result = "emailExist";
            } else {
                UserMain user1 = new UserMain();
                user1.setName(userName);
                System.out.println(userName);
                user1.setEmail(email);
                System.out.println(email);
                user1.setNickName(nickName);
                System.out.println(nickName);
                user1.setRole(0);
                userService.save(user1);
                user1 = userService.findBy("name", userName);
                UserDetail userDetail = new UserDetail();
                userDetail.setId(user1.getId());
                userDetail.setAddress(address);
                userDetail.setBirthday(birthday);
                userDetail.setPassword(password);
                userDetail.setPhoneNumber(phoneNumber);
                userDetail.setSex(sex);
                userDetail.setPostNumber(postNumber);
                Date date = new Date();
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                userDetail.setRegisterTime(sf.format(date));
                userDetailService.save(userDetail);
                result = "success";
            }
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/doUpdate", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doUpdate(String userName, String email, String nickName, String password, String phoneNumber, int sex, String birthday, String postNumber, String address) {
        String result;
        UserMain user = userService.findBy("name", userName);
        user.setEmail(email);
        user.setNickName(nickName);
        userService.update(user);
        UserDetail userDetail = userDetailService.findById(user.getId());
        userDetail.setAddress(address);
        userDetail.setBirthday(birthday);
        userDetail.setPassword(password);
        userDetail.setPhoneNumber(phoneNumber);
        userDetail.setSex(sex);
        userDetail.setPostNumber(postNumber);
        userDetailService.update(userDetail);
        result = "success";
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllUser() {
//        System.out.println("我接收到了获取用户请求");
        List<UserMain> userList = new ArrayList<>();
        userList = userService.findAll();
        String allUsers = JSONArray.toJSONString(userList);
//        System.out.println("我返回的结果是"+allUsers);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("allUsers", allUsers);
        return resultMap;
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteUser(int id) {
        String result = "fail";
        if (userDetailService.deleteById(id) == 1) {
            if (userService.deleteById(id) == 1) {
                result = "success";
            }
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getUserAddressAndPhoneNumber", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserAddressAndPhoneNumber(int id) {
        String address = userDetailService.findById(id).getAddress();
        String phoneNumber = userDetailService.findById(id).getPhoneNumber();
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("address", address);
        resultMap.put("phoneNumber", phoneNumber);
        return resultMap;
    }

    @RequestMapping(value = "/doLogout")
    public String doLogout(HttpSession httpSession) {
        httpSession.setAttribute("currentUser", "");
        return "redirect:login";
    }

    @RequestMapping(value = "/getUserById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserById(int id) {
        UserMain user = userService.findById(id);
        String result = JSON.toJSONString(user);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getUserDetailById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserDetailById(int id) {
        UserDetail userDetail = userDetailService.findById(id);
        String result = JSON.toJSONString(userDetail);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", result);
        return resultMap;
    }
}
