package com.shopping.mall.mapper;


import com.shopping.mall.core.Mapper;
import com.shopping.mall.domain.ShoppingRecord;
import org.apache.ibatis.annotations.Param;

public interface ShoppingRecordMapper extends Mapper<ShoppingRecord> {

    Integer getUserProductRecord(@Param("userId") int userId, @Param("productId") int productId);

}