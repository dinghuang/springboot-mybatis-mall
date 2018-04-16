package com.shopping.mall.controller;


import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.ShoppingCar;
import com.shopping.mall.domain.ShoppingRecord;
import com.shopping.mall.service.ShoppingRecordService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Condition;

import java.util.*;


@Controller
@RequestMapping(value = "/mall/shopping_record")
public class ShoppingRecordController {

    private final ShoppingRecordService shoppingRecordService;

    @Autowired
    public ShoppingRecordController(ShoppingRecordService shoppingRecordService) {
        this.shoppingRecordService = shoppingRecordService;
    }

    @ApiOperation("添加购物记录")
    @PutMapping
    public ResponseEntity<Boolean> addShoppingRecord(@ApiParam(value = "购物记录信息", required = true)
                                                     @RequestBody ShoppingRecord shoppingRecord) {
        return Optional.ofNullable(shoppingRecordService.addShoppingRecord(shoppingRecord))
                .map(result -> new ResponseEntity<>(result, HttpStatus.CREATED))
                .orElseThrow(() -> new CommonException("error.addShoppingCar"));
    }

    @ApiOperation("修改购物记录")
    @PostMapping
    public ResponseEntity<Boolean> changeShoppingRecord(@ApiParam(value = "购物记录信息", required = true)
                                                        @RequestBody ShoppingRecord shoppingRecord) {
        return Optional.ofNullable(shoppingRecordService.changeShoppingRecord(shoppingRecord))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.changeShoppingRecord"));
    }

    @ApiOperation("根据用户id获取购物记录")
    @GetMapping(value = "/query_by_user_id/{userId}")
    public ResponseEntity<List<ShoppingRecord>> getShoppingRecords(@ApiParam(value = "用户id", required = true)
                                                                   @PathVariable int userId) {
        return Optional.ofNullable(shoppingRecordService.findByUserId(userId))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.getShoppingRecords"));
    }

    @ApiOperation("根据订单状态获取购物记录")
    @GetMapping(value = "/query_by_order_status/{orderStatus}")
    public ResponseEntity<List<ShoppingRecord>> getShoppingRecordsByOrderStatus(@ApiParam(value = "订单状态", required = true)
                                                                                @PathVariable int orderStatus) {
        Condition condition = new Condition(ShoppingCar.class);
        condition.createCriteria().andCondition("order_status", orderStatus);
        return Optional.ofNullable(shoppingRecordService.findByCondition(condition))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.getShoppingRecordsByOrderStatus"));
    }

    @ApiOperation("获取所有购物记录")
    @GetMapping
    public ResponseEntity<List<ShoppingRecord>> getAllShoppingRecords() {
        return Optional.ofNullable(shoppingRecordService.findAll())
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.getAllShoppingRecords"));
    }

    @ApiOperation("根据用户id和产品id查询用户是否有记录")
    @GetMapping(value = "/query_user_product_record/{userId}/{productId}")
    public ResponseEntity<Boolean> getUserProductRecord(@ApiParam(value = "用户id", required = true)
                                                        @PathVariable int userId,
                                                        @ApiParam(value = "产品id", required = true)
                                                        @PathVariable int productId) {
        return Optional.of(shoppingRecordService.getUserProductRecord(userId, productId))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.getUserProductRecord"));
    }

}
