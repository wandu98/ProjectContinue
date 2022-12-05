package com.cafe24.nonchrono.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
@RequestMapping("/seller")
public class SellerDAO {
    public SellerDAO() {System.out.println("------SellerDAO() 객체 생성");}

//    @Autowired
//    SqlSession sqlSession;
//

}//class end
