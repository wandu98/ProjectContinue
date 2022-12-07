package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.SalesDTO;
import com.cafe24.nonchrono.dto.SellerDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
@RequestMapping("/sales")
public class SalesDAO {

    public SalesDAO() {System.out.println("-----SalesDAO() 객체 생성"); }

    @Autowired
    private SqlSession sqlSession;

    public int insert(SalesDTO salesDTO) {
        return sqlSession.insert("sales.insert", salesDTO);
    } // insert() end

}//class end
