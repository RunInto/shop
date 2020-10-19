package com.zhonghualub.user;

import com.zhonghualub.common.utils.IdWorker;
import com.zhonghualub.common.utils.JwtUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

// 指定Springboot包扫描
@SpringBootApplication(scanBasePackages = "com.zhonghualub")
public class ShopUserServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShopUserServiceApplication.class, args);
	}

	@Bean
	public IdWorker idWorker() {
		return new IdWorker();
	}

	@Bean
	public JwtUtils jwtUtils() {
		return new JwtUtils();
	}
}
