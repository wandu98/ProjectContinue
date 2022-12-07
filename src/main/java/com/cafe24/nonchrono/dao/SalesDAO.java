package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.GameDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SalesDAO {

    public SalesDAO() {System.out.println("-----SalesDAO() 객체 생성"); }

    @Autowired
    SqlSession sqlSession;

    public List<SalesDTO> idxLatestProduct() {
        return sqlSession.selectList("sales.idxLatestProduct");
    }

    public List<SalesDTO> idxTopProduct() {
        return sqlSession.selectList("sales.idxTopProduct");
    }

    public List<SalesDTO> idxReviewProduct() {
        return sqlSession.selectList("sales.idxReviewProduct");
    }

    public List<SalesDTO> idxFeaturedProduct() {
        return sqlSession.selectList("sales.idxFeaturedProduct");
    }

    public List<GameDTO> idxRankingSales() {
        return sqlSession.selectList("sales.idxRankingSales");
    }


}//class end
