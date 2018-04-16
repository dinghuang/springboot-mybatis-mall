package com.shopping.mall.service.imp;

import com.shopping.mall.core.AbstractService;
import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.Constant;
import com.shopping.mall.domain.Products;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.domain.ShoppingRecord;
import com.shopping.mall.mapper.ShoppingRecordMapper;
import com.shopping.mall.service.ProductsService;
import com.shopping.mall.service.ShoppingRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Service
@Transactional(rollbackFor = CommonException.class)
public class ShoppingRecordServiceImpl extends AbstractService<ShoppingRecord> implements ShoppingRecordService {

    private final ShoppingRecordMapper shoppingRecordMapper;

    private final ProductsService productsService;

    @Autowired
    public ShoppingRecordServiceImpl(ShoppingRecordMapper shoppingRecordMapper,
                                     ProductsService productsService) {
        this.shoppingRecordMapper = shoppingRecordMapper;
        this.productsService = productsService;
    }

    @Override
    public boolean getUserProductRecord(int userId, int productId) {
        if (shoppingRecordMapper.getUserProductRecord(userId, productId) != 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<ShoppingRecord> findByUserId(int userId) {
        return shoppingRecordMapper.findByUserId(userId);
    }

    @Override
    public Boolean addShoppingRecord(ShoppingRecord shoppingRecord) {
        try {
            Products product = productsService.findById(shoppingRecord.getProductId());
            if (shoppingRecord.getCounts() <= product.getCounts()) {
                shoppingRecord.setProductPrice(product.getPrice() * shoppingRecord.getCounts());
                shoppingRecord.setOrderStatus(0);
                Date date = new Date();
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                shoppingRecord.setTime(sf.format(date));
                product.setCounts(product.getCounts() - shoppingRecord.getCounts());
                productsService.update(product);
                save(shoppingRecord);
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            throw new CommonException("error.addShoppingRecord");
        }

    }

    @Override
    public Boolean changeShoppingRecord(ShoppingRecord shoppingRecord) {
        try {
            Condition condition = new Condition(ShoppingCar.class);
            condition.createCriteria().andCondition("user_id = ", shoppingRecord.getUserId()).
                    andCondition("product_id = ", shoppingRecord.getProductId()).andCondition("time = ", shoppingRecord.getTime());
            ShoppingRecord oldShoppingRecord = findByCondition(condition).get(0);
            oldShoppingRecord.setOrderStatus(shoppingRecord.getOrderStatus());
            update(oldShoppingRecord);
            return true;
        } catch (Exception e) {
            throw new CommonException("error.changeShoppingRecord");
        }
    }

}
