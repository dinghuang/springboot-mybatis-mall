package com.shopping.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.shopping.mall.mapper")
public class SpringBootMybatisMallApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootMybatisMallApplication.class, args);
    }

}
