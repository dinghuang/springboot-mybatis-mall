package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.service.ProductsService;
import com.shopping.mall.service.ShoppingCarService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;

import java.util.List;


@Service
@Transactional(rollbackFor = CommonException.class)
public class ShoppingCarServiceImpl extends AbstractService<ShoppingCar> implements ShoppingCarService {

    private ProductsService productsService;

    public ShoppingCarServiceImpl(ProductsService productsService) {
        this.productsService = productsService;
    }

    @Override
    public ShoppingCar addShoppingCar(ShoppingCar shoppingCar) {
        try {
            Condition condition = new Condition(ShoppingCar.class);
            condition.createCriteria().andCondition("user_id = ", shoppingCar.getUserId()).andCondition("product_id = ", shoppingCar.getProductId());
            List<ShoppingCar> shoppingCars = findByCondition(condition);
            if (shoppingCars != null && !shoppingCars.isEmpty()) {
                ShoppingCar oldShoppingCar = shoppingCars.get(0);
                shoppingCar.setCounts(shoppingCar.getCounts() + shoppingCar.getCounts());
                shoppingCar.setProductPrice(productsService.findById(shoppingCar.getProductId()).getPrice() * shoppingCar.getCounts());
                update(oldShoppingCar);
            } else {
                shoppingCar.setProductPrice(productsService.findById(shoppingCar.getProductId()).getPrice() * shoppingCar.getCounts());
                save(shoppingCar);
            }
            return shoppingCar;
        } catch (Exception e) {
            throw new CommonException("error.addShoppingCar");
        }
    }

    @Override
    public Boolean deleteShoppingCar(int userId, int productId) {
        Condition condition = new Condition(ShoppingCar.class);
        condition.createCriteria().andCondition("user_id = ", userId).andCondition("product_id = ", productId);
        if (deleteByCondition(condition) == 1) {
            return true;
        } else {
            throw new CommonException("error.deleteShoppingCar");
        }
    }
}
