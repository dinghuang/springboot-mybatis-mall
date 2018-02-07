package com.shopping.mall.mapper;


import com.shopping.mall.core.Mapper;
import com.shopping.mall.domain.Products;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ProductsMapper extends Mapper<Products> {
    List<Products> getProductsByKeyWord(@Param("queryKeyWord") String queryKeyWord);
}