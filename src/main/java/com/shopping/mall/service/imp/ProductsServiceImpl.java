package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.domain.Products;
import com.shopping.mall.mapper.ProductsMapper;
import com.shopping.mall.service.ProductsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Service
@Transactional
public class ProductsServiceImpl extends AbstractService<Products> implements ProductsService {
    @Resource
    private ProductsMapper productsMapper;

    @Override
    public List<Products> getProductsByKeyWord(String searchKeyWord) {
            String queryKeyWord = "%";
            for(int i=0;i<searchKeyWord.length();i++){
                queryKeyWord += String.valueOf(searchKeyWord.charAt(i)) +"%";
            }
            System.out.println("我搜索了"+queryKeyWord);
            return productsMapper.getProductsByKeyWord(queryKeyWord);
    }
}
