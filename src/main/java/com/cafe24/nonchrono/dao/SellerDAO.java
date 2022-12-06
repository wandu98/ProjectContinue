package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.GameDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
@RequestMapping("/seller")
public class SellerDAO {
    public SellerDAO() {
        System.out.println("------SellerDAO() 객체 생성");
    }

    @Autowired
    private SqlSession sqlSession;

    public List<GameDTO> game() {
        return sqlSession.selectList("recruit.game");
    } // gm_name() end

    public List<GameDTO> gm_list() {
        return sqlSession.selectList("recruit.gm_list");
    } // gm_name() end

    public String gm_list2(String title) {
        return sqlSession.selectOne("recruit.gm_list2", title);
    } // gm_name() end
}//class end
