package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.UserDetail;
import com.shopping.mall.service.UserDetailService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional(rollbackFor = CommonException.class)
public class UserDetailServiceImpl extends AbstractService<UserDetail> implements UserDetailService {

    @Override
    public UserDetail add(UserDetail userDetail) {
        try {
            save(userDetail);
            return userDetail;
        } catch (Exception e) {
            throw new CommonException("error.add");
        }
    }

    @Override
    public Boolean delete(Integer id) {
        try {
            return deleteById(id) == 1;
        } catch (Exception e) {
            throw new CommonException("error.delete");
        }
    }

    @Override
    public UserDetail updateUserDetail(UserDetail userDetail) {
        try {
            update(userDetail);
            return userDetail;
        } catch (Exception e) {
            throw new CommonException("error.updateUserDetail");
        }
    }
}
