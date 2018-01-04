package com.shopping.mall.service;

import com.shopping.mall.domain.Shoppingcart;
import com.shopping.mall.mapper.RollingMapper;
import com.shopping.mall.mapper.ShoppingcartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dinghuang on 2018/1/3.
 */
@Service
public class ShoppingcartService {

    @Autowired
    private ShoppingcartMapper shoppingcartMapper;

    public List<Shoppingcart> getShoppingcartListByname(String name){
        Shoppingcart shoppingcart = new Shoppingcart();
        shoppingcart.setTuser(name);
        return shoppingcartMapper.selectByExample(shoppingcart);
    }
}
