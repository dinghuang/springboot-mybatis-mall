package com.shopping.mall;

import com.shopping.mall.conf.SmException;
import org.apache.tomcat.util.descriptor.web.ErrorPage;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.awt.*;
import java.util.Optional;

/**
 * @author dinghuang
 * @since 2017-12-04 16:16
 */
@SpringBootApplication
@MapperScan(basePackages = "com.shopping.mall.mapper")
public class SpringBootMybatisMallApplication  extends SpringBootServletInitializer implements CommandLineRunner,EmbeddedServletContainerCustomizer {
    private Logger logger = LoggerFactory.getLogger(SpringBootMybatisMallApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(SpringBootMybatisMallApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        logger.info("服务启动完成!");
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SpringBootMybatisMallApplication.class);
    }

    @RequestMapping("/")
    String home() {
        return "redirect:index";
    }

    @Override
    public void customize(ConfigurableEmbeddedServletContainer configurableEmbeddedServletContainer) {
        configurableEmbeddedServletContainer.setPort(8086);
    }

}
