package com.shopping.mall.mapper;


import com.shopping.mall.core.Mapper;
import com.shopping.mall.domain.ShoppingRecord;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ShoppingRecordMapper extends Mapper<ShoppingRecord> {

    @Select("SELECT count(*) from shopping_record where user_id=#{userId} and product_id=#{productId}")
    Integer getUserProductRecord(@Param("userId") int userId, @Param("productId") int productId);

    @Select("SELECT * from shopping_record where user_id = #{userId}")
    List<ShoppingRecord> findByUserId(int userId);
}