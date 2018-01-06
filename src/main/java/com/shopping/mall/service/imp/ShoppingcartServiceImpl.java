package com.shopping.mall.service.imp;

import com.shopping.mall.domain.Shoppingcart;
import com.shopping.mall.mapper.ShoppingcartMapper;
import com.shopping.mall.service.ShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dinghuang on 2018/1/6.
 */
@Service
public class ShoppingcartServiceImpl implements ShoppingcartService{

    @Autowired
    private ShoppingcartMapper shoppingcartMapper;

    @Override
    public List<Shoppingcart> selectShoppingCartByUserName(String userName) {
        return shoppingcartMapper.selectShoppingCartByUserName(userName);
    }

    @Override
    public List<Shoppingcart> selectByUserName(String userName) {
        return shoppingcartMapper.selectByUserName(userName);
    }
}
