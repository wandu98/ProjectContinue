package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.CouponDTO;
import com.cafe24.nonchrono.dto.OrderDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAO {

    public OrderDAO() {}

    @Autowired
    SqlSession sqlSession;

    public List<OrderDTO> purchaseHistoryList(String mem_id) {
        return sqlSession.selectList("order.historylist", mem_id);
    }

    public List<String> purchaseHistoryProduct(String od_num) {
        return sqlSession.selectList("order.historyproduct", od_num);
    }


//  배송메세지
    public String dvmsg(String od_num) {return sqlSession.selectOne("order.dvmsg", od_num);}

//  주문상세 합계
    public int total(String od_num) {return sqlSession.selectOne("order.total", od_num);}

//  비싼 배송비
    public int maxdt_fee(String od_num) {return sqlSession.selectOne("order.maxdt_fee", od_num);}

//  쿠폰정보
    public CouponDTO dt_coupon(String od_num) {return  sqlSession.selectOne("order.dt_coupon", od_num);}

//  사용한 마일리지
    public int umileage(String od_num) {return sqlSession.selectOne("order.umileage", od_num);}

}
