package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.CouponDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CouponlistDAO {

    @Autowired
    SqlSession sqlSession;

    public List<CouponDTO> list(String mem_id) {
        return sqlSession.selectList("couponlist.list", mem_id);
    }

    public List<Map<String,?>> mileageList(String mem_id) {
        return sqlSession.selectList("couponlist.mileageList", mem_id);
    }

    public int couponCount(String mem_id) {
        return sqlSession.selectOne("mypage.couponCount", mem_id);
    }
}
