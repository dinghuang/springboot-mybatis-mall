package com.shopping.mall.service;

import com.shopping.mall.domain.Shoppingcart;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dinghuang on 2018/1/3.
 */
public interface ShoppingcartService {

    List<Shoppingcart> selectShoppingCartByUserName(String userName);

    List<Shoppingcart> selectByUserName(String userName);

}
