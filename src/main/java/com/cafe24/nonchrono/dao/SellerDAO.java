package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class SellerDAO {
    public SellerDAO() {
        System.out.println("------SellerDAO() 객체 생성");
    }

    @Autowired
    private SqlSession sqlSession;


    public int insert(DeliveryDTO deliveryDTO) {
        return sqlSession.insert("delivery.insert", deliveryDTO);
    } // insert() end





}//class end
