package com.shopping.mall.controller;

import com.alibaba.fastjson.JSON;
import com.shopping.mall.domain.Products;
import com.shopping.mall.service.ProductsService;
import net.minidev.json.JSONArray;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by CodeGenerator on 2018/02/02.
*/
@RestController
public class ProductsController {
    @Resource
    private ProductsService productsService;

    @RequestMapping(value = "/getAllProducts")
    @ResponseBody
    public Map<String,Object> getAllProducts(){
        List<Products> productList;
        productList = productsService.findAll();
        String allProducts = JSONArray.toJSONString(productList);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("allProducts",allProducts);
        return resultMap;
    }

    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteProduct(int id) {
        String result ="fail";
        if(productsService.deleteById(id)==1){
            result="success";
        }
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addProduct(String name,String description,String keyWord,int price,int counts,int type) {
        System.out.println("添加了商品："+name);
        String result ="fail";
        Products product = new Products();
        product.setName(name);
        product.setDescription(description);
        product.setKeyWord(keyWord);
        product.setPrice(price);
        product.setCounts(counts);
        product.setType(type);
        productsService.save(product);
        result = "success";
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/productDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> productDetail(int id, HttpSession httpSession) {
        System.out.println("I am here!"+id);
        Products product = productsService.findById(id);
        httpSession.setAttribute("productDetail",product);
        System.out.print("I am here"+product.getName());
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result","success");
        return resultMap;
    }

    @RequestMapping(value = "/product_detail")
    public String product_detail() {
        return "product_detail";
    }

    @RequestMapping(value = "/searchPre", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> searchPre(String searchKeyWord,HttpSession httpSession) {
        httpSession.setAttribute("searchKeyWord",searchKeyWord);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result","success");
        return resultMap;
    }

    @RequestMapping(value = "/search")
    public String search() {
        return "search";
    }

    @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> searchProduct(String searchKeyWord){
        System.out.println("我到了SearchProduct"+searchKeyWord);
        List<Products> productList;
        productList = productsService.getProductsByKeyWord(searchKeyWord);
        String searchResult = JSONArray.toJSONString(productList);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result",searchResult);
        System.out.println("我返回了"+searchResult);
        return resultMap;
    }

    @RequestMapping(value = "/getProductById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductById(int id) {
        Products product = productsService.findById(id);
        String result = JSON.toJSONString(product);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(@RequestParam MultipartFile productImgUpload, String name, HttpServletRequest request) {
        String result = "fail";
        try{
            if(productImgUpload != null && !productImgUpload.isEmpty()) {
                String fileRealPath = request.getSession().getServletContext().getRealPath("/static/img");
                int id = productsService.findBy("name",name).getId();
                String fileName = String.valueOf(id)+".jpg";
                File fileFolder = new File(fileRealPath);
                System.out.println("fileRealPath=" + fileRealPath+"/"+fileName);
                if(!fileFolder.exists()){
                    fileFolder.mkdirs();
                }
                File file = new File(fileFolder,fileName);
                productImgUpload.transferTo(file);
                result = "success";
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("result",result);
        return resultMap;
    }
}
