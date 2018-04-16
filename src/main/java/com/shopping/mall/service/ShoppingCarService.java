package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.ShoppingCar;


public interface ShoppingCarService extends Service<ShoppingCar> {

    /**
     * 添加购物车
     *
     * @param shoppingCar shoppingCar
     * @return ShoppingCar
     */
    ShoppingCar addShoppingCar(ShoppingCar shoppingCar);

    /**
     * 根据用户id和产品id删除购物车
     *
     * @param userId    userId
     * @param productId productId
     * @return 成功true
     */
    Boolean deleteShoppingCar(int userId, int productId);
}
