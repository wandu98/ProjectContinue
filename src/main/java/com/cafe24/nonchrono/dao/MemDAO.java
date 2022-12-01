package com.cafe24.nonchrono.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Member;
import java.util.List;

@Repository
public class MemDAO { //Data Access Object

    @Autowired
    private SqlSession sqlSession;

    public MemDAO() {
        System.out.println("-----memDAO() 객체 생성됨");
    } // end



    }//end
