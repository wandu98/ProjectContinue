package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

    @Autowired
    SqlSession sqlSession;

    public ReviewDTO list() {
        return sqlSession.selectOne("review.list");
    }


}
