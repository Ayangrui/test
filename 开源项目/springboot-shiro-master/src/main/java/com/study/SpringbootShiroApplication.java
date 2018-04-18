package com.study;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableTransactionManagement
@MapperScan(basePackages = "com.study.mapper")
public class SpringbootShiroApplication {

	
//	定义一个static 静态的方法去调用 SpringApplication的run的方法 
	/*
	    * 以下代码摘自：org.springframework.boot.SpringApplication
		 
		public static ConfigurableApplicationContext run(Object source, String... args) {
		    return run(new Object[] { source }, args);
		}
		 
		public static ConfigurableApplicationContext run(Object[] sources, String[] args) {
		    return new SpringApplication(sources).run(args);
		}
	 * 
	 * SpringbootShiroApplication.class相对于 创建一个SpringbootShiroApplication对象(实例化一个对象) 并且带着参数args
	 * springApplication.run是将参数和该类的对象进行发给springAppliction这个类	
	 * 
	 * */
public static void main(String[] args) {
		SpringApplication.run(SpringbootShiroApplication.class, args);
	}
}

