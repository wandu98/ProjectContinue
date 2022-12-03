package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.MypageDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
public class MypageDAO {
    public MypageDAO() {
        System.out.println("-----MypageDAO() 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;

    public List<MypageDTO> list() {
        return sqlSession.selectList("mypage.list");
    }//list() end


}
