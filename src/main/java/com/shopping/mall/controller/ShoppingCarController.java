package com.shopping.mall.controller;

import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.service.ShoppingCarService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Condition;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/mall/shopping_car")
public class ShoppingCarController {


    private ShoppingCarService shoppingCarService;

    public ShoppingCarController(ShoppingCarService shoppingCarService) {
        this.shoppingCarService = shoppingCarService;
    }

    @ApiOperation("添加购物车")
    @PutMapping
    public ResponseEntity<ShoppingCar> addShoppingCar(@ApiParam(value = "购物车信息", required = true)
                                                      @RequestBody ShoppingCar shoppingCar) {
        return Optional.ofNullable(shoppingCarService.addShoppingCar(shoppingCar))
                .map(result -> new ResponseEntity<>(result, HttpStatus.CREATED))
                .orElseThrow(() -> new CommonException("error.addShoppingCar"));
    }

    @ApiOperation("根据用户id查询购物车")
    @GetMapping(value = "/query_shopping_cars/{userId}")
    public ResponseEntity<List<ShoppingCar>> getShoppingCars(@ApiParam(value = "用户id", required = true)
                                                             @PathVariable int userId) {
        Condition condition = new Condition(ShoppingCar.class);
        condition.createCriteria().andCondition("user_id = ", userId);
        List<ShoppingCar> shoppingCarList = shoppingCarService.findByCondition(condition);
        return Optional.ofNullable(shoppingCarList)
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.getShoppingCars"));
    }

    @ApiOperation("根据用户id和产品id删除购物车")
    @DeleteMapping(value = "/{userId}/{productId}")
    public ResponseEntity<Boolean> deleteShoppingCar(@ApiParam(value = "用户id", required = true)
                                                     @PathVariable int userId,
                                                     @ApiParam(value = "产品id", required = true)
                                                     @PathVariable int productId) {
        return Optional.ofNullable(shoppingCarService.deleteShoppingCar(userId, productId))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.deleteShoppingCar"));
    }
}
