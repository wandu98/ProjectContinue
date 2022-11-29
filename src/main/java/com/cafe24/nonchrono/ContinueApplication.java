package com.cafe24.nonchrono;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

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
