package com.shopping.mall.service.imp;


import com.shopping.mall.core.AbstractService;
import com.shopping.mall.domain.UserMain;
import com.shopping.mall.mapper.UserMainMapper;
import com.shopping.mall.service.UserMainService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Service
@Transactional
public class UserMainServiceImpl extends AbstractService<UserMain> implements UserMainService {
    @Resource
    private UserMainMapper userMainMapper;

}
