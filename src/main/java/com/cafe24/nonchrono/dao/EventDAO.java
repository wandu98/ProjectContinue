package com.cafe24.nonchrono.dao;
import com.cafe24.nonchrono.dto.EventDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class EventDAO {

    @Autowired
    private SqlSession sqlSession;

    public EventDAO() {
        System.out.println("-----EventDAO() 객체 생성됨");
    }//EventDAO() end

}
