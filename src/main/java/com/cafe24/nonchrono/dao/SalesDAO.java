package com.cafe24.nonchrono.dao;


import com.cafe24.nonchrono.dto.*;
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
    public List<SalesDTO> list2(String sl_id) {
        return sqlSession.selectList("sales.list2", sl_id);
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

    //상품메인 페이징
    public List<SalesDTO> list3(PagingDTO pagingDTO) {
        return sqlSession.selectList("sales.list3", pagingDTO);
    }

    public List<SalesDTO> searchAll(String keyword) {
        return sqlSession.selectList("sales.searchAll", keyword);
    }

    public List<SalesDTO> searchCategory(SalesDTO salesDTO) {
        return sqlSession.selectList("sales.searchCategory", salesDTO);
    }

    public SalesDTO detail(int ss_num) {
        return sqlSession.selectOne("sales.detail", ss_num);
    } // detail() end

    public GameDTO gameDetail(int ss_num) {
        return sqlSession.selectOne("sales.gameDetail", ss_num);
    } // gameDetail() end

    public int reviewCount(int ss_num) {
        return sqlSession.selectOne("sales.reviewCount", ss_num);
    }// reviewDetail() end

    public ReviewDTO reviewDetail(int ss_num) {
        return sqlSession.selectOne("sales.reviewDetail", ss_num);
    } // reviewCmt() end

    public DeliveryDTO deliveryDetail(int ss_num) {
        return sqlSession.selectOne("sales.deliveryDetail", ss_num);
    } // deliveryDetail() end

//  회원정보 동일 눌렀을 때 회원정보 가져오기
    public MemDTO dv_mem_info(String mem_id) {return sqlSession.selectOne("sales.dv_mem_info", mem_id);}

//  회원 memdv 정보 가져오기
//    public MemdvDTO dvmem_info(String mem_id) {return sqlSession.selectOne("sales.dvmem_info", mem_id);}
}//class end
