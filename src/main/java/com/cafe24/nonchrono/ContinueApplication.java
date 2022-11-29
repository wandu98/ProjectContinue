package com.cafe24.nonchrono;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@SpringBootApplication
public class ContinueApplication {

	public static void main(String[] args) {
		SpringApplication.run(ContinueApplication.class, args);
	} // main() end

	/*
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
	    SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
	    bean.setDataSource(dataSource);
	    Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*.xml");
	    bean.setMapperLocations(res);
	    return bean.getObject();
	} // sqlSessionFactory() end

	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory factory) {
	    return new SqlSessionTemplate(factory);
	} // sqlSession() end
	*/

}
