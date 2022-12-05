package com.cafe24.nonchrono.dao;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
@RequestMapping("/sales")
public class SalesDAO {

    public SalesDAO() {System.out.println("-----SalesDAO() 객체 생성"); }
/*
    @Autowired
    SqlSession sqlSession;
*/

}//class end
