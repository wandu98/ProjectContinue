package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.MemDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemDAO { //Data Access Object

    @Autowired
    private SqlSession sqlSession;

    public MemDAO() {
        System.out.println("-----memDAO() 객체 생성됨");
    } // end
    
    public String idcheck() {
        return sqlSession.selectOne("login.memid"); //mapper id 'login' 안에 select id 'memid'
    }//idcheck() end

    public String pwcheck() {
        return sqlSession.selectOne("login.mempw");
    }//pwcheck() end

    public MemDTO modify_list() {
        return sqlSession.selectOne("memmodify.list");
    }

    public void modify_update(MemDTO memDTO) {
        sqlSession.update("memmodify.update", memDTO);
    }

    }//end
