package com.shopping.mall.mapper;


import com.shopping.mall.core.Mapper;
import com.shopping.mall.domain.Products;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public interface ProductsMapper extends Mapper<Products> {

    List<Products> queryAll();
}