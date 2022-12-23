package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.MemDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MinigameDAO {

    public MinigameDAO() {}

    @Autowired
    SqlSession sqlSession;

    public int getPoint(MemDTO memDTO) {
        return sqlSession.update("minigame.getPoint", memDTO);
    }


}
