package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.BasketDTO;
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

//   장바구니 합계
    public int bk_total(String mem_id) {
        return sqlSession.selectOne("basket.bk_total", mem_id);
    }

//   배송비 제일 높은 값
    public int max_fee(String mem_id) {
        return sqlSession.selectOne("basket.max_fee", mem_id);
    }
    public void insert(BasketDTO basketDTO) {
        sqlSession.insert("basket.insert", basketDTO);
    }

    public List<BasketDTO> basketList(String mem_id) {
        return sqlSession.selectList("basket.list", mem_id);
    }
}
