package com.example;

import com.example.model.App;
import com.example.service.AppService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestJspApplicationTests {


	@Autowired
	private AppService appService;

	@Test
	public void contextLoads() throws JsonProcessingException {




		for (int i = 0; i <20 ; i++) {
			String a=i+"";
			appService.save(new App("2",a,a,a,a,a,a));
		}



		for (int i = 0; i <30 ; i++) {
			String a=i+"";
			appService.save(new App("3",a,a,a,a,a,a));
		}
		for (int i = 0; i <40 ; i++) {
			String a=i+"";
			appService.save(new App("4",a,a,a,a,a,a));
		}
		for (int i = 0; i <50 ; i++) {
			String a=i+"";
			appService.save(new App("5",a,a,a,a,a,a));
		}
	}

}
