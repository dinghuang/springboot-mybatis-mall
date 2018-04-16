package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.UserDetail;


public interface UserDetailService extends Service<UserDetail> {

    /**
     * 添加用户详情
     *
     * @param userDetail userDetail
     * @return UserDetail
     */
    UserDetail add(UserDetail userDetail);

    /**
     * 根据id删除用户详情
     *
     * @param id id
     * @return 成功true
     */
    Boolean delete(Integer id);

    /**
     * 更新用户详情
     *
     * @param userDetail userDetail
     * @return UserDetail
     */
    UserDetail updateUserDetail(UserDetail userDetail);
}
