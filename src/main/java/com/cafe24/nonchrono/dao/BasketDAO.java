package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.BasketDTO;
import com.cafe24.nonchrono.dto.CouponlistDTO;
import com.cafe24.nonchrono.dto.DetailDTO;
import com.cafe24.nonchrono.dto.OrderDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BasketDAO {

    public BasketDAO() {}

    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> mylist(String mem_id) {
        return sqlSession.selectList("basket.list", mem_id);
    }

    public void delete(int bk_num) {
        sqlSession.delete("basket.delete", bk_num);
    }

    public void allClear(String mem_id) {
        sqlSession.delete("basket.allclear", mem_id);
    }

//   배송비 제일 높은 값
    public int max_fee(String mem_id) {
        return sqlSession.selectOne("basket.max_fee", mem_id);
    }
    public void insert(BasketDTO basketDTO) {
        sqlSession.insert("basket.insert", basketDTO);
    }

    public List<BasketDTO> basketList(String mem_id) {
        return sqlSession.selectList("basket.list", mem_id);
    }

    public List<Map<String, Integer>> dv_sum(String mem_id) {
        return sqlSession.selectList("basket.dv_sum", mem_id);
    }

    public int total(String mem_id) {
        return sqlSession.selectOne("basket.total", mem_id);
    }

    public String od_num(String today) {
        return sqlSession.selectOne("basket.od_num", today);
    }

    public int dv_num(int ss_num) {
        return sqlSession.selectOne("basket.dv_num", ss_num);
    }

    public int order_detail(DetailDTO detailDTO) {
        return sqlSession.insert("basket.order_detail", detailDTO);
    }

    public int basket_delete(String mem_id) {
        return sqlSession.delete("basket.basket_delete", mem_id);
    }

    public int coupon_delete(CouponlistDTO couponlistDTO) {
        return sqlSession.delete("basket.coupon_delete", couponlistDTO);
    }

    public int usemileage(String mem_id, int umileage) {
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setMem_id(mem_id);
        orderDTO.setUmileage(umileage);
        return sqlSession.update("basket.usemileage", orderDTO);
    }

    public int stock(int ss_num, int bk_amount) {
        Map<String, Integer> map = new java.util.HashMap<>();
        map.put("ss_num", ss_num);
        map.put("bk_amount", bk_amount);
        return sqlSession.update("basket.stock", map);
    }
}
