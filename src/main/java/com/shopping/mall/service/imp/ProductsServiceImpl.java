package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.Products;
import com.shopping.mall.mapper.ProductsMapper;
import com.shopping.mall.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional(rollbackFor = CommonException.class)
public class ProductsServiceImpl extends AbstractService<Products> implements ProductsService {

    @Autowired
    private ProductsMapper productsMapper;

    @Override
    public Boolean deleteProduct(int id) {
        if (deleteById(id) == 1) {
            return true;
        } else {
            throw new CommonException("error.deleteProduct");
        }
    }

    @Override
    public Products addProduct(Products products) {
        try {
            save(products);
        } catch (Exception e) {
            e.printStackTrace();
            throw new CommonException("error.addProduct");
        }
        return products;
    }

    @Override
    public List<Products> queryAll() {
        return productsMapper.queryAll();
    }
}
