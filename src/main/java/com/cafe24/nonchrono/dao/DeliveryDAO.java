package com.cafe24.nonchrono.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDAO {

    @Autowired
    SqlSession sqlSession;

    public void delete(int dv_num) {
        sqlSession.delete("delivery.delete", dv_num);
    }
}
