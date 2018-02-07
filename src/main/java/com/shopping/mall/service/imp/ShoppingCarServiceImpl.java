package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.mapper.ShoppingCarMapper;
import com.shopping.mall.service.ShoppingCarService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Service
@Transactional
public class ShoppingCarServiceImpl extends AbstractService<ShoppingCar> implements ShoppingCarService {
    @Resource
    private ShoppingCarMapper shoppingCarMapper;

}
