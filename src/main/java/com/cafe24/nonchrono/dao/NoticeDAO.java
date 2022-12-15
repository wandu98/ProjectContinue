package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.NoticeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class NoticeDAO {

    @Autowired
    private SqlSession sqlSession;

    public NoticeDAO() {
        System.out.println("----NoticeDAO() 객체 생성됨");
    }//NoticeDAO() end

    public int ntInsert(NoticeDTO noticeDTO) {
        return sqlSession.insert("notice.ntinsert", noticeDTO);
    }//NtInsert() end

    public List<NoticeDTO> noticelist() {
        List<NoticeDTO> list = sqlSession.selectList("notice.noticelist");
        return list;
    }//list() end

    public NoticeDTO ntdetail(int nt_num) {
        return sqlSession.selectOne("notice.ntdetail", nt_num);
    }//ntdetail() end

    public NoticeDTO ntUpdate(int nt_num) {
        return sqlSession.selectOne("notice.ntUpdate", nt_num);
    }//ntUpdate() end


    public int ntDelete(int nt_num) {
        System.out.println(nt_num);
        return sqlSession.delete("notice.ntDelete", nt_num);
    }//ntDelete() end

}//end
