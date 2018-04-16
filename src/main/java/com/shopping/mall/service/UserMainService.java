package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.UserDto;
import com.shopping.mall.domain.UserMain;

import javax.servlet.http.HttpSession;

public interface UserMainService extends Service<UserMain> {

    /**
     * 用户登陆
     *
     * @param userMain userMain
     * @param session  session
     * @return String
     */
    String doLogin(UserMain userMain, HttpSession session);

    /**
     * 用户注册
     *
     * @param userDto userDto
     * @return String
     */
    String doRegister(UserDto userDto);

    /**
     * 用户更新
     *
     * @param userDto userDto
     * @return 成功true
     */
    Boolean doUpdate(UserDto userDto);
}
