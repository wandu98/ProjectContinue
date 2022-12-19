package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.PagingDTO;
import com.cafe24.nonchrono.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDAO {

    @Autowired
    SqlSession sqlSession;

    public List<ReviewDTO> list(PagingDTO pagingDTO) {
        return sqlSession.selectList("review.list", pagingDTO);
    }

    public ReviewDTO listOne(int rv_num) {
        return sqlSession.selectOne("review.listOne", rv_num);
    }

    public int count(String mem_id) {
        return sqlSession.selectOne("review.count", mem_id);
    }

    public int delete(int rv_num) {
        return sqlSession.delete("review.delete", rv_num);
    }

    public int totalRowCount(String mem_id) {
        int cnt = 0;
        try {
            cnt = sqlSession.selectOne("review.count", mem_id);
        } catch (Exception e) {
            System.out.println("전체 행 갯수 : " + e);
        }//end
        return cnt;
    }

    public int rv_insert(ReviewDTO reviewDTO) { return sqlSession.insert("review.insert", reviewDTO);}

    public List<ReviewDTO> rv_list(int ss_num) {return sqlSession.selectList("review.rv_list", ss_num);}

    public ReviewDTO myrv_list (int rv_num) {
        return sqlSession.selectOne("review.myrv_list", rv_num);
    }

    public int modify(ReviewDTO reviewDTO) {
        return sqlSession.update("review.modify", reviewDTO);
    }
}
