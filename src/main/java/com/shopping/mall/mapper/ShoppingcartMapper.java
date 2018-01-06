package com.shopping.mall.mapper;

import com.shopping.mall.conf.BaseMapper;
import com.shopping.mall.domain.Shoppingcart;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by dinghuang on 2018/1/3.
 */
public interface ShoppingcartMapper extends BaseMapper<Shoppingcart> {

    @Select("select * from shoppingcart where tuser=#{userName}")
    List<Shoppingcart> selectShoppingCartByUserName(String userName);

    List<Shoppingcart> selectByUserName(@Param("userName")String userName);

}
