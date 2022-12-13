package com.cafe24.nonchrono.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

    @Autowired
    private SqlSession sqlSession;

    public int sales_day() {
        return sqlSession.selectOne("admin.sales_day");
    }

    public int sales_month() {
        return sqlSession.selectOne("admin.sales_month");
    }

    public int sales_year() {
        return sqlSession.selectOne("admin.sales_month");
    }
}
