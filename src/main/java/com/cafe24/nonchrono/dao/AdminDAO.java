package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.GameDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public String typeName(String type) {
        String result = sqlSession.selectOne("admin.typeName", type);
        System.out.println("result : "+result);

        if (result != null) {
            return result;
        } else {
            return type+"0000";
        }
    }

    public int gameInsert(GameDTO gameDTO) {
        return sqlSession.insert("admin.gameInsert", gameDTO);
    }

    public List<GameDTO> gameList(String type) {
        return sqlSession.selectList("admin.gameList", type);
    }

    public int revenue_day() {
        return sqlSession.selectOne("admin.revenue_day");
    }

    public int revenue_month() {
        return sqlSession.selectOne("admin.revenue_month");
    }

    public int revenue_year() {
        return sqlSession.selectOne("admin.revenue_year");
    }

    public int customer_day() {
        return sqlSession.selectOne("admin.customer_day");
    }

    public int customer_month() {
        return sqlSession.selectOne("admin.customer_month");
    }

    public int customer_year() {
        return sqlSession.selectOne("admin.customer_year");
    }
}
