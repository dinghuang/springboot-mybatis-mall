package com.shopping.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.awt.*;

/**
 * @author dinghuang
 * @since 2017-12-04 16:16
 */
@Controller
@EnableWebMvc
@SpringBootApplication
@MapperScan(basePackages = "com.shopping.mall.mapper")
public class SpringBootMybatisMallApplication extends WebMvcConfigurerAdapter implements CommandLineRunner,EmbeddedServletContainerCustomizer {
    private Logger logger = LoggerFactory.getLogger(SpringBootMybatisMallApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(SpringBootMybatisMallApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        logger.info("服务启动完成!");
    }

    @RequestMapping("/")
    String home() {
        return "redirect:countries";
    }

    @Override
    public void customize(ConfigurableEmbeddedServletContainer configurableEmbeddedServletContainer) {
        configurableEmbeddedServletContainer.setPort(8086);
    }
}
