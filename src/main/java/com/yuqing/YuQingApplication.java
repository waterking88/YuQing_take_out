package com.yuqing;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author waterking
 */
@Slf4j
/**输出日志信息方便调试*/
@SpringBootApplication
@ServletComponentScan
@EnableTransactionManagement
public class YuQingApplication {
    public static void main(String[] args) {
        SpringApplication.run(YuQingApplication.class, args);
        log.info("项目启动成功！");
    }
}
