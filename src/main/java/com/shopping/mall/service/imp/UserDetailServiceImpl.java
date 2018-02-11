package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.domain.UserDetail;
import com.shopping.mall.mapper.UserDetailMapper;
import com.shopping.mall.service.UserDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Service
public class UserDetailServiceImpl extends AbstractService<UserDetail> implements UserDetailService {
    @Resource
    private UserDetailMapper userDetailMapper;

}
