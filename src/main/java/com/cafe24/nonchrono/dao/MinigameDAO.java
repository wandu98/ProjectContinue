package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.MemDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MinigameDAO {

    public MinigameDAO() {}

    @Autowired
    SqlSession sqlSession;

    public int getPoint(MemDTO memDTO) {
        return sqlSession.update("minigame.getPoint", memDTO);
    }
    public int rollDice(String mem_id, String dice) {
        Map<String, String> map = new HashMap<>();
        map.put("mem_id", mem_id);
        map.put("dice", dice);
        return sqlSession.insert("minigame.rollDice", map);
    }

    public List<String> rollCount(String mem_id) {
        return sqlSession.selectList("minigame.rollCount", mem_id);
    }

    public int attendenceCheck(String mem_id) {
        return sqlSession.selectOne("minigame.attendenceCheck", mem_id);
    }

    public int attendence(String mem_id) {
        return sqlSession.insert("minigame.attendence", mem_id);
    }
}