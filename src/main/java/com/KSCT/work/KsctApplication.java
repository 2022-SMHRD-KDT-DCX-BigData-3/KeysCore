package com.KSCT.work;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

// config : 각종 외부 설정들의 Bean 등록을 위한 패키지
// controller : 클라이언트 요청을 처리할 패키지
// model.mapper : DB에 접근을 위한 패키지 (DAO)
// service : 비지니스 로직을 처리할 패키지

@SpringBootApplication
public class KsctApplication {

	// SpringApplication.run()을 호출해서 웹 애플리케이션을 실행하는 역할
	public static void main(String[] args) {
		SpringApplication.run(KsctApplication.class, args);
	}

	
	// sqlsessionfactory 기능을 어디서든 사용할수 있도록 bean에 등록
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		
		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mapper/*.xml");
        sessionFactory.setMapperLocations(res);
        
        return sessionFactory.getObject();
	}
}