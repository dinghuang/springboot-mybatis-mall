package com.shopping.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import java.util.ArrayList;
import java.util.List;


/**
 * @author dinghuang
 * @since 2017-12-04 16:16
 */
@SpringBootApplication
@MapperScan(basePackages = "com.shopping.mall.mapper")
public class SpringBootMybatisMallApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootMybatisMallApplication.class, args);
    }


}
