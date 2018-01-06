package com.shopping.mall;

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
        logger.info("Service Run Success");
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SpringBootMybatisMallApplication.class);
    }

    @Override
    public void customize(ConfigurableEmbeddedServletContainer configurableEmbeddedServletContainer) {
        configurableEmbeddedServletContainer.setPort(8086);
    }

}
