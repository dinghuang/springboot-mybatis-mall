package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.domain.ShoppingRecord;
import com.shopping.mall.mapper.ShoppingRecordMapper;
import com.shopping.mall.service.ShoppingRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Service
@Transactional
public class ShoppingRecordServiceImpl extends AbstractService<ShoppingRecord> implements ShoppingRecordService {
    @Resource
    private ShoppingRecordMapper shoppingRecordMapper;

    @Override
    public boolean getUserProductRecord(int userId,int productId) {
        if(shoppingRecordMapper.getUserProductRecord(userId,productId)!=0){
           return true;
        }else{
            return false;
        }
    }

}
