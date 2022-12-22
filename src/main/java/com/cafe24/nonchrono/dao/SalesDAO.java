package com.cafe24.nonchrono.dao;


import com.cafe24.nonchrono.dto.*;
import org.apache.ibatis.javassist.compiler.ast.Keyword;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public int searchAlltotalRowCount(String ss_name) {
        int cnt = 0;
        try {
            cnt = sqlSession.selectOne("sales.searchAlltotalRowCount", ss_name);
        } catch (Exception e) {
            System.out.println("전체 행 갯수 : " + e);
        }
        return cnt;
    }

    public int searchCategorytotalRowCount(SalesDTO salesDTO) {
        int cnt = 0;
        try {
            cnt = sqlSession.selectOne("sales.searchAlltotalRowCount", salesDTO);
        } catch (Exception e) {
            System.out.println("전체 행 갯수 : " + e);
        }
        return cnt;
    }

    //상품메인 페이징
    public List<SalesDTO> list3(PagingDTO pagingDTO) {
        Map<String, Object> map = new HashMap<>();
        map.put("startRow", (pagingDTO.getStartRow()-1));
        map.put("endRow", pagingDTO.getEndRow());
        map.put("order", pagingDTO.getOrder());

        //System.out.println("list3 : " + sqlSession.selectList("sales.list3", map).toString());
        return sqlSession.selectList("sales.list3", map);

    }

//    public List<SalesDTO> searchAll(String keyword) {
//        return sqlSession.selectList("sales.searchAll", keyword);
//    }

//    public List<SalesDTO> searchCategory(SalesDTO salesDTO) {
//        return sqlSession.selectList("sales.searchCategory", salesDTO);
//    }

    public List<SalesDTO> searchAlllist(PagingDTO pagingDTO) {
        Map<String, Object> map = new HashMap<>();
        map.put("startRow", (pagingDTO.getStartRow()-1));
        map.put("endRow", pagingDTO.getEndRow());
        map.put("order", pagingDTO.getOrder());
        map.put("ss_name", pagingDTO.getSs_name());
        //System.out.println("list : " + sqlSession.selectList("sales.searchAllList", map).toString());
        return sqlSession.selectList("sales.searchAllList", map);
    }

    public List<SalesDTO> searchCategorylist(PagingDTO pagingDTO) {return sqlSession.selectList("sales.searchCategorylist", pagingDTO);
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

    public List<ReviewnickDTO> reviewDetail(int ss_num) {
        return sqlSession.selectList("sales.reviewDetail", ss_num);
    } // reviewCmt() end

    public DeliveryDTO deliveryDetail(int ss_num) {
        return sqlSession.selectOne("sales.deliveryDetail", ss_num);
    } // deliveryDetail() end

//  회원정보 동일 눌렀을 때 회원정보 가져오기
    public MemDTO dv_mem_info(String mem_id) {return sqlSession.selectOne("sales.dv_mem_info", mem_id);}

//  회원 memdv 정보 가져오기
    public List<MemdvDTO> dvmem_info(String mem_id) {return sqlSession.selectList("sales.dvmem_info", mem_id);}

//  회원 memdv 인서트
    public int memdv_insert(MemdvDTO memdvDTO) {return sqlSession.insert("sales.memdv_insert", memdvDTO);
    }// memdv_insert() end

//  주문인서트
/*    public int order_insert(OrderDTO orderDTO) {
    return sqlSession.insert("sales.order_insert", orderDTO);
    }// insert() end*/

// dvnum Max값 구해서 신규 배송지 유무 파악
    public int max_dvnum(String mem_id){ return sqlSession.selectOne("sales.max_dvnum", mem_id);
    }// max_dvnum() end

    // 사용 가능한 마일리지 가져오기
    public int mileage(String mem_id) {
        return sqlSession.selectOne("sales.mileage", mem_id);
    }

    // 별칭으로 검색해서 해당 회원의 배송지가 있는지 확인
    public int memdv_count(MemdvDTO memdvDTO) {
        return sqlSession.selectOne("sales.memdv_count", memdvDTO);
    }

    public int memdv_search(MemdvDTO memdvDTO) {
        return sqlSession.selectOne("sales.memdv_search", memdvDTO);
    }

//   주문서 insert
    public int order(OrderDTO orderDTO) {
        return sqlSession.insert("basket.order", orderDTO);
    }

    public List<OrderdetailDTO> orderlist(String  od_num) {return sqlSession.selectList("order.orderlist", od_num);
    } // orderlist() end

    public MemdvDTO orderadr(int mem_dvnum) {return sqlSession.selectOne("order.orderadr", mem_dvnum);
    } // orderAdr() end

    public List<SalesDTO> sold_out() {return sqlSession.selectList("sales.sold_out");
    } // sold_out() end

    public List<SalesDTO> top_price_list(PagingDTO pagingDTO) {return sqlSession.selectList("sales.top_price_list", pagingDTO);}

    public int search(SearchDTO searchDTO) {return sqlSession.insert("sales.search", searchDTO);}

    public List<SearchDTO> last_seach() {return sqlSession.selectList("sales.last_search");}

    public List<SearchDTO> top_keyword() {return sqlSession.selectList("sales.top_keyword");}

}//class end
