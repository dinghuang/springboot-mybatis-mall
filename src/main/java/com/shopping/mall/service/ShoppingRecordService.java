package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.ShoppingRecord;

import java.util.List;

/**
 * Created by CodeGenerator on 2018/02/02.
 */
public interface ShoppingRecordService extends Service<ShoppingRecord> {

    boolean getUserProductRecord(int userId, int productId);

    List<ShoppingRecord> findByUserId(int userId);
}
