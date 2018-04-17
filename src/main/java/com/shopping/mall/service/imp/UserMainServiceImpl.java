package com.shopping.mall.service.imp;


import com.shopping.mall.core.AbstractService;
import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.domain.UserDetail;
import com.shopping.mall.domain.UserDto;
import com.shopping.mall.domain.UserMain;
import com.shopping.mall.service.UserDetailService;
import com.shopping.mall.service.UserMainService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;


@Service
@Transactional(rollbackFor = CommonException.class)
public class UserMainServiceImpl extends AbstractService<UserMain> implements UserMainService {

    private UserDetailService userDetailService;

    public UserMainServiceImpl(UserDetailService userDetailService) {
        this.userDetailService = userDetailService;
    }

    @Override
    public String doLogin(UserMain userMain, HttpSession session) {
        Condition condition = new Condition(ShoppingCar.class);
        condition.createCriteria().andCondition(" name = '" + userMain.getUserNameOrEmail() + "' or email = '" + userMain.getUserNameOrEmail() + "'");
        UserMain user = findByCondition(condition).get(0);
        if (user == null) {
            return "unexist";
        } else {
            UserDetail userDetail = userDetailService.findById(user.getId());
            if (userDetail.getPassword().equals(userMain.getPassword())) {
                session.setAttribute("currentUser", user);
                return "success";
            } else {
                return "wrong";
            }
        }
    }

    @Override
    public String doRegister(UserDto userDto) {
        try {
            UserMain user = findBy("name", userDto.getUserName());
            if (user != null) {
                return "nameExist";
            } else {
                user = findBy("email", userDto.getEmail());
                if (user != null) {
                    return "emailExist";
                } else {
                    UserMain user1 = new UserMain();
                    user1.setName(userDto.getUserName());
                    user1.setEmail(userDto.getEmail());
                    user1.setNickName(userDto.getNickName());
                    user1.setRole(0);
                    save(user1);
                    user1 = findBy("name", userDto.getUserName());
                    UserDetail userDetail = new UserDetail();
                    userDetail.setId(user1.getId());
                    userDetail.setAddress(userDto.getAddress());
                    userDetail.setBirthday(userDto.getBirthday());
                    userDetail.setPassword(userDto.getPassword());
                    userDetail.setPhoneNumber(userDto.getPhoneNumber());
                    userDetail.setSex(userDto.getSex());
                    userDetail.setPostNumber(userDto.getPostNumber());
                    Date date = new Date();
                    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    userDetail.setRegisterTime(sf.format(date));
                    userDetailService.save(userDetail);
                    return "success";
                }
            }
        } catch (Exception e) {
            throw new CommonException("error.doRegister");
        }
    }

    @Override
    public Boolean doUpdate(UserDto userDto) {
        try {
            UserMain user = findBy("name", userDto.getUserName());
            user.setEmail(userDto.getEmail());
            user.setNickName(userDto.getNickName());
            update(user);
            UserDetail userDetail = userDetailService.findById(user.getId());
            userDetail.setAddress(userDto.getAddress());
            userDetail.setBirthday(userDto.getBirthday());
            userDetail.setPassword(userDto.getPassword());
            userDetail.setPhoneNumber(userDto.getPhoneNumber());
            userDetail.setSex(userDto.getSex());
            userDetail.setPostNumber(userDto.getPostNumber());
            userDetailService.update(userDetail);
            return true;
        } catch (Exception e) {
            throw new CommonException("error.doRegister");
        }
    }
}
