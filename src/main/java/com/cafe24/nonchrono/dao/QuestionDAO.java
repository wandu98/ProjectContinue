package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.QuestionDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAO {

    @Autowired
    SqlSession sqlSession;

    public QuestionDTO list() {
        return sqlSession.selectOne("question.list");
    }

    public int count(String mem_id) {
        return sqlSession.selectOne("question.count", mem_id);
    }
}
