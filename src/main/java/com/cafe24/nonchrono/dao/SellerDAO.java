package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
public class SellerDAO {
    public SellerDAO() {
        System.out.println("------SellerDAO() 객체 생성");
    }

    @Autowired
    private SqlSession sqlSession;





}//class end
