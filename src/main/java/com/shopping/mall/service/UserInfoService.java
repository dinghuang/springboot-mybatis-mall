package com.shopping.mall.service;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shopping.mall.mapper.UserInfoMapper;
import com.shopping.mall.model.UserInfo;

import java.util.List;

/**
 * @author dinghuang
 * @since 2017-12-04 16:16
 */
@Service
public class UserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    public List<UserInfo> getAll(UserInfo UserInfo) {
        if (UserInfo.getPage() != null && UserInfo.getRows() != null) {
            PageHelper.startPage(UserInfo.getPage(), UserInfo.getRows());
        }
        return userInfoMapper.selectAll();
    }

    public UserInfo getById(Integer id) {
        return userInfoMapper.selectByPrimaryKey(id);
    }

    public void deleteById(Integer id) {
        userInfoMapper.deleteByPrimaryKey(id);
    }

    public void save(UserInfo country) {
        if (country.getId() != null) {
            userInfoMapper.updateByPrimaryKey(country);
        } else {
            userInfoMapper.insert(country);
        }
    }
}
