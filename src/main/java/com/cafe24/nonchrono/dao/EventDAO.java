package com.cafe24.nonchrono.dao;
import com.cafe24.nonchrono.dto.EventDTO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class EventDAO {

    @Autowired
    private SqlSession sqlSession;

    public EventDAO() {
        System.out.println("-----EventDAO() 객체 생성됨");
    }//EventDAO() end

    public int evtInsert(EventDTO eventDTO) {
        return sqlSession.insert("event.evtInsert", eventDTO);
    }//evtInsert() end

    public List<EventDTO> eventlist() {
        List<EventDTO> list = sqlSession.selectList("event.eventlist");
        return list;
    }//eventlist() end

    public EventDTO evtdetail(int evt_num) {
        return sqlSession.selectOne("event.evtdetail", evt_num);
    }//evtdetail() end

    //조회수
    public EventDTO evtviews(int evt_num) {
        return sqlSession.selectOne("event.evtviews", evt_num);
    }//evtviews() end

    //삭제
    public int evtdelete(int evt_num) {
        return sqlSession.delete("event.evtdelete", evt_num);
    }//evtdelete() end

    //수정
    public int evtUpdate(EventDTO eventDTO) {
        return sqlSession.update("event.evtUpdate", eventDTO);
    }

}
