package com.etoak.models.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component  //相当于@Service @Controller
public class JobAnno {

	@Scheduled(cron="0/5 * * * * ?")
	public void job(){
		System.out.println("刘奶奶请柳奶奶喝牛奶......");
	}
	
}
