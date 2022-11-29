package crawling;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CrawlingDAO {

    @Autowired
    private SqlSession sqlSession;


    public int AutoCrawling(CrawlingDTO crawlingDTO) {
        int cnt = sqlSession.insert("crawling.autoCrawling", crawlingDTO);
        return cnt;
    } // AutoCrawling() end

} // class end

