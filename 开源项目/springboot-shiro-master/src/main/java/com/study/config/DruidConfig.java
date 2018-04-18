package com.study.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by yangqj on 2017/4/19.
 */



 /*
  *  要想实例化一个对象的时候必须加的一个的注解就是这个  @Configuration 只有在他的下面我们才可以加@Bean这个注解，为的就是我去加载的时候没必要去配置<bean><bean>这个配置的文件
  * */
@Configuration
public class DruidConfig {

	
	 
    @Bean
    public ServletRegistrationBean 	Servlet() {

        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
        //登录查看信息的账号密码.

        servletRegistrationBean.addInitParameter("loginUsername","admin");

        servletRegistrationBean.addInitParameter("loginPassword","123456");
        return servletRegistrationBean;
    }

    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new WebStatFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }
}
