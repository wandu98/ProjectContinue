package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.PagingDTO;
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

    public List<WishlistDTO> list(PagingDTO pagingDTO) {
        return sqlSession.selectList("wishlist.list", pagingDTO);
    }

    public void allRemove() {
        sqlSession.delete("wishlist.allRemove");
    }

    public void delete(int ws_num) {
        sqlSession.delete("wishlist.delete", ws_num);
    }

    public int totalRowCount() {
        int cnt = 0;
        try {
            cnt = sqlSession.selectOne("wishlist.totalRowCount");
        } catch (Exception e) {
            System.out.println("전체 행 갯수 : " + e);
        }//end
        return cnt;
    }//totalRowCount() end

}
