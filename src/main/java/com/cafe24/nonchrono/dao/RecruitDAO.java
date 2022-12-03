package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.GameDTO;
import com.cafe24.nonchrono.dto.RecruitDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecruitDAO {


    @Autowired
    private SqlSession sqlSession;

    public RecruitDAO() {
        System.out.println("-----RecruitDAO() 객체 생성됨");
    } // end

    public List<RecruitDTO> list() {
        return sqlSession.selectList("recruit.list");
    } // list() end

    public List<GameDTO> game() {
        return sqlSession.selectList("recruit.game");
    } // gm_name() end

    public List<GameDTO> gm_list() {
        return sqlSession.selectList("recruit.gm_list");
    } // gm_name() end

    public String gm_list2(String title) {
        return sqlSession.selectOne("recruit.gm_list2", title);
    } // gm_name() end

} // class end