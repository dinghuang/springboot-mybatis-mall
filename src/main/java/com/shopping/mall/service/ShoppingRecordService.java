package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.ShoppingRecord;

/**
 * Created by CodeGenerator on 2018/02/02.
 */
public interface ShoppingRecordService extends Service<ShoppingRecord> {

    public boolean getUserProductRecord(int userId, int productId);

}
