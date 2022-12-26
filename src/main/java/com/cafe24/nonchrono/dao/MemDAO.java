package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.MemDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Repository
public class MemDAO { //Data Access Object

    @Autowired
    private SqlSession sqlSession;

    public MemDAO() {
        System.out.println("-----memDAO() 객체 생성됨");
    } // end

    public List<MemDTO> list() {
        return sqlSession.selectList("mem.list");
    }//list() end

    public String login(String id, String pw) {
        MemDTO dto = new MemDTO();
        dto.setMem_id(id);
        dto.setMem_pw(pw);
        return sqlSession.selectOne("login.login", dto);
    }

    public List<MemDTO> idcheck() {
        return sqlSession.selectList("login.check");
    }//idkcheck() end

    public List<MemDTO> nickcheck() {
        return sqlSession.selectList("login.nickcheck");
    }

    public MemDTO modify_list(String mem_id) {
        return sqlSession.selectOne("memmodify.list", mem_id);
    }

    public void modify_update(MemDTO memDTO) {
        sqlSession.update("memmodify.update", memDTO);
    }

    public MemDTO myList(String mem_id) {
        return sqlSession.selectOne("mypage.list", mem_id);
    }//list() end

    public int memInsert(MemDTO memDTO) {
        return sqlSession.insert("login.insert", memDTO);
    } //memInsert() end

    public double temp(String mem_id) {
        double temp = 0;
        if (mem_id != null) {
            MemDTO memDTO = new MemDTO();
            memDTO = this.myList(mem_id);
            String mem_grade = memDTO.getMem_grade();
            mem_grade = mem_grade.toLowerCase();
            int good = memDTO.getGood();
            int buyer_bad = memDTO.getBuyer_bad();
            if (mem_grade.equals("new")) {
                temp = 36.5 + 0 + (good * 1) + (buyer_bad * -5);
            } else if (mem_grade.equals("bronze")) {
                temp = 36.5 + 10 + (good * 1) + (buyer_bad * -5);
            } else if (mem_grade.equals("silver")) {
                temp = 36.5 + 20 + (good * 1) + (buyer_bad * -5);
            } else if (mem_grade.equals("gold")) {
                temp = 36.5 + 30 + (good * 1) + (buyer_bad * -5);
            } else {
                temp = 36.5 + 40 + (good * 1) + (buyer_bad * -5);
            }
        }

        return temp;
    }

}//end
