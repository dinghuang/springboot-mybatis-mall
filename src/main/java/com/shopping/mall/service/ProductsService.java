package com.shopping.mall.service;


import com.shopping.mall.core.Service;
import com.shopping.mall.domain.Products;


public interface ProductsService extends Service<Products> {

    /**
     * 根据id删除商品
     *
     * @param id id
     * @return 成功true
     */
    Boolean deleteProduct(int id);

    /**
     * 添加产品
     *
     * @param products products
     * @return products
     */
    Products addProduct(Products products);

}
