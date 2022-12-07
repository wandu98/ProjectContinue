package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.DetailDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DetailDAO {

    @Autowired
    SqlSession sqlSession;

    public List<Integer> detailCount(String mem_id) {
        return sqlSession.selectList("detail.count", mem_id);
    }

}
