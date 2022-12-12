package com.cafe24.nonchrono.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BasketDAO {

    public BasketDAO() {}

    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> mylist(String mem_id) {
        return sqlSession.selectList("basket.list", mem_id);
    }

    public void delete(int bk_num) {
        sqlSession.delete("basket.delete", bk_num);
    }

    public void allClear(String mem_id) {
        sqlSession.delete("basket.allclear", mem_id);
    }

    public int total(String mem_id) {
        return sqlSession.selectOne("basket.total", mem_id);
    }
}
