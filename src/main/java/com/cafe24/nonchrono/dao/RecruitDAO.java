package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.*;
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

    public RecruitDTO detail(int rcrbrd_num) {
        return sqlSession.selectOne("recruit.detail", rcrbrd_num);
    } // detail() end

    public GameDTO gameDetail(int rcrbrd_num) {
        return sqlSession.selectOne("recruit.gameDetail", rcrbrd_num);
    } // detail2() end

    public MemDTO memDetail(int rcrbrd_num) {
        return sqlSession.selectOne("recruit.memDetail", rcrbrd_num);
    } // detail2() end

    public int recruitCount(int rcrbrd_num) {
        return sqlSession.selectOne("recruit.recruitCount", rcrbrd_num);
    } // recruitCount() end

    public String nickname(String mem_id) {
        return sqlSession.selectOne("recruit.nickname", mem_id);
    } // nickname() end

    public int insert(RecruitDTO recruitDTO) {
        return sqlSession.insert("recruit.insert", recruitDTO);
    } // insert() end

    public List<GameDTO> myriList(String mem_id) {
        return sqlSession.selectList("mypage.recruitList", mem_id);
    }

    public List<RecruitDTO> myrcrList(String mem_id) {
        return sqlSession.selectList("mypage.rcrList", mem_id);
    }

    public List<Integer> rcrCoount(String mem_id) {
        return sqlSession.selectList("mypage.rcrCount", mem_id);
    }

    public int attend(RecruitInfoDTO recruitInfoDTO) {
        return sqlSession.insert("recruit.attend", recruitInfoDTO);
    } // attend() end

    public int roleInsert(RoleDTO roleDTO) {
        return sqlSession.insert("recruit.roleInsert", roleDTO);
    } // roleInsert() end

    public int numSearch() {
        return sqlSession.selectOne("recruit.numSearch");
    } // numSearch() end

    public List<RoleDTO> roleList(int rcrbrd_num) {
        return sqlSession.selectList("recruit.roleList", rcrbrd_num);
    } // roleList() end
    
    public List<GameDTO> idxRankingRecruit() {
        return sqlSession.selectList("recruit.idxRankingRecruit");
    }

    public List<RecruitDTO> idxrcrbrd() {
        return sqlSession.selectList("recruit.idxrcrbrdlist");
    }

    public Integer idxrcrbrdCount(int rcrbrd_num) {
        return sqlSession.selectOne("recruit.idxrcrbrdCount", rcrbrd_num);
    }


} // class end