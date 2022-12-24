package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.PagingDTO;
import com.cafe24.nonchrono.dto.WishDTO;
import com.cafe24.nonchrono.dto.WishlistDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public void allRemove(String mem_id) {
        sqlSession.delete("wishlist.allRemove", mem_id);
    }

    public void delete(int ws_num) {
        sqlSession.delete("wishlist.delete", ws_num);
    }

    public int totalRowCount(String mem_id) {
        int cnt = 0;
        try {
            cnt = sqlSession.selectOne("wishlist.totalRowCount", mem_id);
        } catch (Exception e) {
            System.out.println("전체 행 갯수 : " + e);
        }//end
        return cnt;
    }//totalRowCount() end

    public void insert(WishDTO wishDTO) {
        sqlSession.insert("wishlist.insert", wishDTO);
    }

    public int idxWishCount(String mem_id) {
        if (sqlSession.selectOne("wishlist.idxWishCount", mem_id) == null){
            return  0;
        } else {
            return sqlSession.selectOne("wishlist.idxWishCount", mem_id);
        }
    }

    public List<Map<String,Object>> noPagingList(String mem_id) {
        return sqlSession.selectList("wishlist.noPagingList", mem_id);
    }

}
