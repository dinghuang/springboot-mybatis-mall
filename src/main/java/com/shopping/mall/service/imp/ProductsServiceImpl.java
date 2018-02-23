package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.domain.Products;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.mapper.ProductsMapper;
import com.shopping.mall.service.ProductsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Service
@Transactional
public class ProductsServiceImpl extends AbstractService<Products> implements ProductsService {

}
