package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.WishlistDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WishDAO {

    public WishDAO() {
        System.out.println("-----WishDAO() 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;

    public List<WishlistDTO> list() {
        return sqlSession.selectList("wishlist.list");
    }

}
