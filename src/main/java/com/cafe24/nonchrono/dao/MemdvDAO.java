package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.MemdvDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemdvDAO {
    
    public MemdvDAO() {
        System.out.println("-----MemdvDAO() 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;

    public List<MemdvDTO> list() {
        return sqlSession.selectList("memdv.list");
    }
}
