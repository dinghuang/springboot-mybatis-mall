package com.shopping.mall.controller;

import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.service.ProductsService;
import com.shopping.mall.service.ShoppingCarService;
import net.minidev.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import tk.mybatis.mapper.entity.Condition;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by CodeGenerator on 2018/02/02.
*/
@Controller
public class ShoppingCarController {
    @Resource
    private ShoppingCarService shoppingCarService;

    @Resource
    private ProductsService productService;

    @RequestMapping(value = "/shopping_car")
    public String shopping_car(){
        return "shopping_car";
    }

    @RequestMapping(value = "/addShoppingCar",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addShoppingCar(int userId, int productId, int counts){
        System.out.println("数量为"+counts);
        Condition condition=new Condition(ShoppingCar.class);
        condition.createCriteria().andCondition("user_id",userId).andCondition("product_id",productId);
        ShoppingCar shoppingCar = shoppingCarService.findByCondition(condition).get(0);
        if(shoppingCar == null){
            ShoppingCar shoppingCar1 = new ShoppingCar();
            shoppingCar1.setUserId(userId);
            shoppingCar1.setProductId(productId);
            shoppingCar1.setCounts(counts);
            shoppingCar1.setProductPrice(productService.findBy("product_id",productId).getPrice()*counts);
            shoppingCarService.save(shoppingCar1);
        }
        else{
            shoppingCar.setCounts(shoppingCar.getCounts()+counts);
            shoppingCar.setProductPrice(productService.findBy("product_id",productId).getPrice()*shoppingCar.getCounts());
            shoppingCarService.update(shoppingCar);
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result","success");
        System.out.println("我返回了");
        return resultMap;
    }

    @RequestMapping(value = "/getShoppingCars",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getShoppingCars(int userId){
        Condition condition=new Condition(ShoppingCar.class);
        condition.createCriteria().andCondition("user_id = ",userId);
        List<ShoppingCar> shoppingCarList = shoppingCarService.findByCondition(condition);
        String shoppingCars = JSONArray.toJSONString(shoppingCarList);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result",shoppingCars);
        return resultMap;
    }

    @RequestMapping(value = "/deleteShoppingCar",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteShoppingCar(int userId,int productId){
        Condition condition=new Condition(ShoppingCar.class);
        condition.createCriteria().andCondition("user_id",userId).andCondition("product_id",productId);
        shoppingCarService.deleteByCondition(condition);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result","success");
        System.out.println("我返回了");
        return resultMap;
    }
}
