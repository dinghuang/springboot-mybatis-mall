package com.shopping.mall.controller;

import com.shopping.mall.core.CommonException;
import com.shopping.mall.domain.Products;
import com.shopping.mall.service.ProductsService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Condition;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/mall/product")
public class ProductsController {

    private final ProductsService productsService;

    private static final String WIN = "win";

    @Autowired
    public ProductsController(ProductsService productsService) {
        this.productsService = productsService;
    }

    private Logger logger = LoggerFactory.getLogger(ProductsController.class);

    @ApiOperation("获取所有产品")
    @GetMapping(value = "/query_products")
    public ResponseEntity<List<Products>> queryAllProducts() {
        return Optional.ofNullable(productsService.findAll())
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.queryAllProducts"));
    }

    @ApiOperation("根据id删除产品")
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Boolean> deleteProduct(@ApiParam(value = "商品id", required = true)
                                                 @PathVariable int id) {
        return Optional.ofNullable(productsService.deleteProduct(id))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.deleteProduct"));
    }

    @ApiOperation("添加产品")
    @PutMapping
    public ResponseEntity<Products> addProduct(@ApiParam(value = "产品信息", required = true)
                                               @RequestBody Products product) {
        return Optional.ofNullable(productsService.addProduct(product))
                .map(result -> new ResponseEntity<>(result, HttpStatus.CREATED))
                .orElseThrow(() -> new CommonException("error.addProduct"));
    }

    @ApiOperation("根据id查询产品详情")
    @GetMapping(value = "/{id}")
    public ResponseEntity<Products> queryProduct(@ApiParam(value = "产品信息", required = true)
                                                 @PathVariable int id,
                                                 HttpSession httpSession) {
        Products product = productsService.findById(id);
        httpSession.setAttribute("productDetail", product);
        return Optional.ofNullable(product)
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.queryProduct"));
    }

    @ApiOperation("保存关键字到session")
    @GetMapping(value = "/search")
    public ResponseEntity<Boolean> searchPre(@ApiParam(value = "查询关键字", required = true)
                                             @RequestParam String searchKeyWord,
                                             HttpSession httpSession) {
        httpSession.setAttribute("searchKeyWord", searchKeyWord);
        return Optional.of(true)
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.searchPre"));
    }

    @ApiOperation("根据关键字查询产品详情")
    @GetMapping(value = "/search_by_key_word")
    public ResponseEntity<List<Products>> searchProduct(@ApiParam(value = "查询关键字", required = true)
                                                        @RequestParam String searchKeyWord) {
        Condition condition = new Condition(Products.class);
        condition.createCriteria().andCondition("name like ", searchKeyWord).orCondition("key_word like ", searchKeyWord);
        return Optional.ofNullable(productsService.findByCondition(condition))
                .map(result -> new ResponseEntity<>(result, HttpStatus.OK))
                .orElseThrow(() -> new CommonException("error.searchProduct"));
    }

    @ApiOperation("上传商品图片")
    @PostMapping(value = "/upload")
    public ResponseEntity<Boolean> uploadFile(@ApiParam(value = "图片", required = true)
                                              @RequestParam MultipartFile productImgUpload,
                                              @ApiParam(value = "名称", required = true)
                                              @RequestParam String name) {
        try {
            if (productImgUpload != null && !productImgUpload.isEmpty()) {
                String sep = File.separator;
                String filePath = (Thread.currentThread().getContextClassLoader().getResource("").getPath() + "static" + sep + "img" + sep).substring(1);
                int id = productsService.findBy("name", name).getId();
                String fileName = String.valueOf(id) + ".jpg";
                byte[] bytes = productImgUpload.getBytes();
                String os = System.getProperty("os.name");
                if (!os.toLowerCase().startsWith(WIN)) {
                    String sepa = java.io.File.separator;
                    filePath = sepa + filePath;
                }
                Path path = Paths.get(filePath + fileName);
                //创建文件
                if (!Files.exists(path)) {
                    Files.createFile(path);
                }
                Files.write(path, bytes);
            }
        } catch (Exception e) {
            logger.info("Exception", e);
        }
        return Optional.ofNullable(true)
                .map(result -> new ResponseEntity<>(result, HttpStatus.CREATED))
                .orElseThrow(() -> new CommonException("error.uploadFile"));
    }
}
