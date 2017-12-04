package com.shopping.mall.controller;

import com.github.pagehelper.PageInfo;
import com.shopping.mall.model.UserInfo;
import com.shopping.mall.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author dinghuang
 * @since 2017-12-04 16:16
 */
@RestController
@RequestMapping("/users")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping
    public PageInfo<UserInfo> getAll(UserInfo userInfo) {
        List<UserInfo> userInfoList = userInfoService.getAll(userInfo);
        return new PageInfo<UserInfo>(userInfoList);
    }

    @RequestMapping(value = "/add")
    public UserInfo add() {
        return new UserInfo();
    }

    @RequestMapping(value = "/view/{id}")
    public UserInfo view(@PathVariable Integer id) {
        ModelAndView result = new ModelAndView();
        UserInfo userInfo = userInfoService.getById(id);
        return userInfo;
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelMap delete(@PathVariable Integer id) {
        ModelMap result = new ModelMap();
        userInfoService.deleteById(id);
        result.put("msg", "删除成功!");
        return result;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelMap save(UserInfo userInfo) {
        ModelMap result = new ModelMap();
        String msg = userInfo.getId() == null ? "新增成功!" : "更新成功!";
        userInfoService.save(userInfo);
        result.put("userInfo", userInfo);
        result.put("msg", msg);
        return result;
    }
}
