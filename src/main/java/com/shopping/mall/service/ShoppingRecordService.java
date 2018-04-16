package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.ShoppingRecord;

import java.util.List;

public interface ShoppingRecordService extends Service<ShoppingRecord> {

    /**
     * 获取用户产品记录是否存在
     *
     * @param userId    userId
     * @param productId productId
     * @return 成功true
     */
    boolean getUserProductRecord(int userId, int productId);

    /**
     * 根据用户id查找购物记录
     *
     * @param userId userId
     * @return List<ShoppingRecord>
     */
    List<ShoppingRecord> findByUserId(int userId);

    /**
     * 添加购物记录
     *
     * @param shoppingRecord shoppingRecord
     * @return 成功返回true
     */
    Boolean addShoppingRecord(ShoppingRecord shoppingRecord);

    /**
     * 修改购物记录
     *
     * @param shoppingRecord shoppingRecord
     * @return 成功返回true
     */
    Boolean changeShoppingRecord(ShoppingRecord shoppingRecord);
}
