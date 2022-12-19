package com.cafe24.nonchrono.dao;

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

    public String dvmsg(String od_num) {return sqlSession.selectOne("order.dvmsg", od_num);}

}
