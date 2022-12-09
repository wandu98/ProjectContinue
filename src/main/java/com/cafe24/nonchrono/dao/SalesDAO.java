package com.cafe24.nonchrono.dao;


import com.cafe24.nonchrono.dto.GameDTO;
import com.cafe24.nonchrono.dto.PagingDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import com.cafe24.nonchrono.dto.WishlistDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SalesDAO {

    public SalesDAO() {
        System.out.println("-----SalesDAO() 객체 생성");
    }

    @Autowired
    private SqlSession sqlSession;


    public int insert(SalesDTO salesDTO) {
        return sqlSession.insert("sales.insert", salesDTO);
    } // insert() end


    //판매자의 상품 리스트
    public List<SalesDTO> list2() {
        return sqlSession.selectList("sales.list2");
    } // list2() end

    //상품메인 리스트
    public List<SalesDTO> list() {
        return sqlSession.selectList("sales.list");
    }


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

    public int totalRowCount() {
        int cnt = 0;
        try {
            cnt = sqlSession.selectOne("sales.totalRowCount");
        } catch (Exception e) {
            System.out.println("전체 행 갯수 : " + e);
        }//end
        //System.out.println(cnt);
        return cnt;
    }//totalRowCount() end

    public List<SalesDTO> list3(PagingDTO pagingDTO) {
        return sqlSession.selectList("sales.list3", pagingDTO);
    }
}//class end
