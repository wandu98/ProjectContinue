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
        return sqlSession.insert("seller.insert", sellerDTO);
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

}//class end
