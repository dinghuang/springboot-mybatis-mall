package com.shopping.mall.controller;

import com.alibaba.fastjson.JSON;
import com.shopping.mall.domain.Constant;
import com.shopping.mall.domain.Products;
import com.shopping.mall.service.ProductsService;
import net.minidev.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Condition;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by CodeGenerator on 2018/02/02.
 */
@Controller
public class ProductsController {
    @Resource
    private ProductsService productsService;

    private Logger logger = LoggerFactory.getLogger(ProductsController.class);

    @RequestMapping(value = "/getAllProducts")
    @ResponseBody
    public Map<String, Object> getAllProducts() {
        List<Products> productList;
        productList = productsService.findAll();
        String allProducts = JSONArray.toJSONString(productList);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("allProducts", allProducts);
        return resultMap;
    }

    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteProduct(int id) {
        String result = Constant.FAIL;
        if (productsService.deleteById(id) == 1) {
            result = Constant.SUCCESS;
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put(Constant.RESULT, result);
        return resultMap;
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addProduct(String name, String description, String keyWord, int price, int counts, int type) {
        logger.info("添加商品:", name);
        String result;
        Products product = new Products();
        product.setName(name);
        product.setDescription(description);
        product.setKeyWord(keyWord);
        product.setPrice(price);
        product.setCounts(counts);
        product.setType(type);
        productsService.save(product);
        result = Constant.SUCCESS;
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put(Constant.RESULT, result);
        return resultMap;
    }

    @RequestMapping(value = "/productDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> productDetail(int id, HttpSession httpSession) {
        Products product = productsService.findById(id);
        httpSession.setAttribute("productDetail", product);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put(Constant.RESULT, Constant.SUCCESS);
        return resultMap;
    }

    @RequestMapping(value = "/product_detail")
    public String productDetail() {
        return "product_detail";
    }

    @RequestMapping(value = "/searchPre", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchPre(String searchKeyWord, HttpSession httpSession) {
        httpSession.setAttribute("searchKeyWord", searchKeyWord);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put(Constant.RESULT, Constant.SUCCESS);
        return resultMap;
    }

    @RequestMapping(value = "/search")
    public String search() {
        return "search";
    }

    @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchProduct(String searchKeyWord) {
        List<Products> productList;
        Condition condition = new Condition(Products.class);
        condition.createCriteria().andCondition("name like ", searchKeyWord).orCondition("key_word like ", searchKeyWord);
        productList = productsService.findByCondition(condition);
        String searchResult = JSONArray.toJSONString(productList);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put(Constant.RESULT, searchResult);
        return resultMap;
    }

    @RequestMapping(value = "/getProductById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductById(int id) {
        Products product = productsService.findById(id);
        String result = JSON.toJSONString(product);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put(Constant.RESULT, result);
        return resultMap;
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(@RequestParam MultipartFile productImgUpload, String name, HttpServletRequest request) {
        String result = Constant.FAIL;
        try {
            if (productImgUpload != null && !productImgUpload.isEmpty()) {
                String sep = File.separator;
                String filePath = (Thread.currentThread().getContextClassLoader().getResource("").getPath() + "static" + sep + "img" + sep).substring(1);
                int id = productsService.findBy("name", name).getId();
                String fileName = String.valueOf(id) + ".jpg";
                byte[] bytes = productImgUpload.getBytes();
                logger.info("bytes:" + bytes);
                logger.info("filePath:" + filePath+ fileName);
                Path path = Paths.get(filePath + fileName);
                //创建文件
                if(!Files.exists(path)) {
                    try {
                        Files.createFile(path);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                Files.write(path, bytes);
                result = Constant.SUCCESS;
            }
        } catch (Exception e) {
            logger.info("Exception", e);
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put(Constant.RESULT, result);
        return resultMap;
    }
}
