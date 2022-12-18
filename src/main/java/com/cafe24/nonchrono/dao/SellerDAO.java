package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class SellerDAO {

    @Autowired
    private SqlSession sqlSession;

    public SellerDAO() {
        System.out.println("------SellerDAO() 객체 생성");
    }//end

    public List<SellerDTO> list() {
        return sqlSession.selectList("seller.list");
    }
    public String login(String id, String pw) {
        SellerDTO dto = new SellerDTO();
        dto.setSl_id(id);
        dto.setSl_pw(pw);
        return sqlSession.selectOne("seller.login", dto);
    }//login() end

    public int sellerInsert(SellerDTO sellerDTO) {
        return sqlSession.insert("seller.seller_insert", sellerDTO);
    }//sellerInsert() end

    public List<SellerDTO> selcheck() {
        return sqlSession.selectList("seller.check");
    }//selcheck() end

    public int insert(DeliveryDTO deliveryDTO) {
        return sqlSession.insert("delivery.insert", deliveryDTO);
    }

    //배송정책 추가
    public int dv_insert(DeliveryDTO deliveryDTO) {
        return sqlSession.insert("seller.dv_insert", deliveryDTO);

    } // insert() end

    public DeliveryDTO deliveryDetail(String sl_id) {
        return sqlSession.selectOne("sales.deliveryDetail", sl_id);
    } // deliveryDetail() end

    public List<DeliveryDTO> dv_list(String sl_id) {return sqlSession.selectList("seller.dv_list", sl_id);}

    public List<Map<String, Integer>> dt_progCountDay(String sl_id) {
        return sqlSession.selectList("seller.progCountDay", sl_id);
    }

    public List<Map<String, Integer>> dt_progCountAll(String sl_id) {
        return sqlSession.selectList("seller.progCountAll", sl_id);
    }

    public List<Integer> saleAmountDay(String sl_id) {
        return sqlSession.selectList("seller.saleAmountDay", sl_id);
    }

    public List<Integer> saleAmountMonth(String sl_id) {
        return sqlSession.selectList("seller.saleAmountMonth", sl_id);
    }

    public List<Integer> saleAmountYear(String sl_id) {
        return sqlSession.selectList("seller.saleAmountYear", sl_id);
    }

    public List<Map<String, ?>> topSellingDay(String sl_id) {
        return sqlSession.selectList("seller.topSellingDay", sl_id);
    }

    public List<Map<String, ?>> topSellingMonth(String sl_id) {
        return sqlSession.selectList("seller.topSellingMonth", sl_id);
    }

    public List<Map<String, ?>> topSellingYear(String sl_id) {
        return sqlSession.selectList("seller.topSellingYear", sl_id);
    }

    public List<Map<String, ?>> recentsalesDay(String sl_id) {
        return sqlSession.selectList("seller.recentsalesDay", sl_id);
    }

    public List<Map<String, ?>> recentsalesMonth(String sl_id) {
        return sqlSession.selectList("seller.recentsalesMonth", sl_id);
    }

    public List<Map<String, ?>> recentsalesYear(String sl_id) {
        return sqlSession.selectList("seller.recentsalesYear", sl_id);
    }

    public List<Integer> salesreportDay(String sl_id) {
        return sqlSession.selectList("seller.budgetreportDay", sl_id);
    }

    public List<Integer> salesreportYesterday(String sl_id) {
        return sqlSession.selectList("seller.budgetreportYesterday", sl_id);
    }

    public List<Integer> salesreportMonth(String sl_id) {
        return sqlSession.selectList("seller.budgetreportMonth", sl_id);
    }

    public List<Integer> salesreportLastMonth(String sl_id) {
        return sqlSession.selectList("seller.budgetreportLastMonth", sl_id);
    }

    public List<Integer> salesreportYear(String sl_id) {
        return sqlSession.selectList("seller.budgetreportYear", sl_id);
    }

    public List<Integer> salesreportLastYear(String sl_id) {
        return sqlSession.selectList("seller.budgetreportLastYear", sl_id);
    }

    public int totalRowCount(String sl_id) {
        int cnt = 0;
        try {
            cnt = sqlSession.selectOne("seller.count", sl_id);
        } catch (Exception e) {
            System.out.println("전체 행 갯수 : " + e);
        }//end
        return cnt;
    }

    public List<SalesDTO> paginglist(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.paginglist", pagingDTO);
    }

    public List<Map<String, ?>> progSearch(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.progSearch", pagingDTO);
    }

    public int fullTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.fullTotalRowCount", pagingDTO);
    }

    public int progTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.progTotalRowCount", pagingDTO);
    }

    public int speriodTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.speriodTotalRowCount", pagingDTO);
    }

    public int eperiodTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.eperiodTotalRowCount", pagingDTO);
    }

    public int spepTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.spepTotalRowCount", pagingDTO);
    }

    public int ikTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.ikTotalRowCount", pagingDTO);
    }

    public int psTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.psTotalRowCount", pagingDTO);
    }

    public int peTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.peTotalRowCount", pagingDTO);
    }

    public int pseTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.pseTotalRowCount", pagingDTO);
    }

    public int pikTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.pikTotalCount", pagingDTO);
    }

    public int sikTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.sikTotalCount", pagingDTO);
    }

    public int eikTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.eikTotalCount", pagingDTO);
    }

    public int seikTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.seikTotalCount", pagingDTO);
    }

    public int psikTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.psikTotalCount", pagingDTO);
    }

    public int peikTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.peikTotalRowCount", pagingDTO);
    }

    public int pseikTotalRowCount(PagingDTO pagingDTO) {
        return sqlSession.selectOne("seller.pseikTotalRowCount", pagingDTO);
    }

    public List<Map<String,?>> fullList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.fullList", pagingDTO);
    }

    public List<Map<String,?>> progList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.progList", pagingDTO);
    }

    public List<Map<String,?>> speriodList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.speriodList", pagingDTO);
    }

    public List<Map<String,?>> eperiodList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.eperiodList", pagingDTO);
    }

    public List<Map<String,?>> spepList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.spepList", pagingDTO);
    }

    public List<Map<String,?>> ikList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.ikList", pagingDTO);
    }

    public List<Map<String,?>> psList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.psList", pagingDTO);
    }

    public List<Map<String,?>> peLIst(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.peLIst", pagingDTO);
    }

    public List<Map<String,?>> pseList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.pseList", pagingDTO);
    }

    public List<Map<String,?>> pikList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.pikList", pagingDTO);
    }

    public List<Map<String,?>> sikListList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.sikList", pagingDTO);
    }

    public List<Map<String,?>> eikList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.eikList", pagingDTO);
    }

    public List<Map<String,?>> seikList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.seikList", pagingDTO);
    }

    public List<Map<String,?>> psikList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.psikList", pagingDTO);
    }

    public List<Map<String,?>> peikList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.peikList", pagingDTO);
    }

    public List<Map<String,?>> pseikList(PagingDTO pagingDTO) {
        return sqlSession.selectList("seller.pseikList", pagingDTO);
    }



//판매자 페이지 전부 유효성 검사
//판매등록 write 배송정책 판매자의 배송정책 리스트에서 선택할 수 있게 변경해야됨
//판매자 헤더 알람, 로그아웃

}//class end
