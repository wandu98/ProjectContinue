package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RecruitDAO {


    @Autowired
    private SqlSession sqlSession;

    public RecruitDAO() {
        System.out.println("-----RecruitDAO() 객체 생성됨");
    } // end

    public List<RecruitDTO> list(String order) {
        return sqlSession.selectList("recruit.list", order);
    } // list() end

    public List<MoreDTO> listAjax(String order) {
        return sqlSession.selectList("recruit.listAjax", order);
    } // list() end

    public String game(int rcrbrd_num) {
        return sqlSession.selectOne("recruit.game", rcrbrd_num);
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


    public int roleConfirm(RoleSeatDTO roleSeatDTO) {
        return sqlSession.insert("recruit.roleConfirm", roleSeatDTO);
    } // roleConfirm() end

    public List<RoleSeatDTO> roleName(int rcrbrd_num) {
        return sqlSession.selectList("recruit.roleName", rcrbrd_num);
    } // roleName() end

    public Integer roleSeatCheck(RoleSeatDTO roleSeatDTO) {
        String result = sqlSession.selectOne("recruit.roleSeatCheck", roleSeatDTO);

        if (result == null) {
            return 0;
        } else {
            return Integer.parseInt(result);
        }
    } // roleSeatCheck() end

    /*
    public int roleSeatCount(int rcrbrd_num) {
        return sqlSession.selectOne("recruit.roleSeatCount", rcrbrd_num);
    } // roleSeatCount() end
    */

    public List<RecruitInfoDTO> attendMembers(int rcrbrd_num) {
        return sqlSession.selectList("recruit.attendMembers", rcrbrd_num);
    } // attendMembers() end

    public int attendCount(int rcrbrd_num, String mem_id) {
        RecruitInfoDTO recruitInfoDTO = new RecruitInfoDTO();
        recruitInfoDTO.setRcrbrd_num(rcrbrd_num);
        recruitInfoDTO.setMem_id(mem_id);
        return sqlSession.selectOne("recruit.attendCount", recruitInfoDTO);
    }

    public List<RecruitInfoDTO> memName(int rcrbrd_num) {
        return sqlSession.selectList("recruit.memName", rcrbrd_num);
    }

    public List<String> memNick(int rcrbrd_num) {
        int count = (int) sqlSession.selectOne("recruit.rcrbrdMax", rcrbrd_num);
        List<String> list = new ArrayList<>();
        RecruitInfoDTO recruitInfoDTO = new RecruitInfoDTO();
        recruitInfoDTO.setRcrbrd_num(rcrbrd_num);
        for (int i = 1; i <= count; i++) {
            recruitInfoDTO.setRi_seat(i);
            String nick = sqlSession.selectOne("recruit.memNick", recruitInfoDTO);
            if (nick != null) {
                //System.out.println(nick.trim());
                list.add(nick);
            } else {
                list.add("");
            }
        }
        //System.out.println(list);
        return list;
    }

    public List<String> memPic(int rcrbrd_num) {
        int count = (int) sqlSession.selectOne("recruit.rcrbrdMax", rcrbrd_num);
        List<String> list = new ArrayList<>();
        RecruitInfoDTO recruitInfoDTO = new RecruitInfoDTO();
        recruitInfoDTO.setRcrbrd_num(rcrbrd_num);
        for (int i = 1; i <= count; i++) {
            recruitInfoDTO.setRi_seat(i);
            String pic = sqlSession.selectOne("recruit.memPic", recruitInfoDTO);
            if (pic != null) {
                list.add(pic.trim());
            } else {
                list.add("");
            }
        }
        // System.out.println(list);
        return list;
    } // membersPic() end

    public List<Map<String, Object>> rcrKing() {
        return sqlSession.selectList("recruit.rcrKing");
    } // rcrKing() end

    public List<MoreDTO> getMoreContents(int startCount, int endCount, String order, String keyword) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startCount", startCount);
        map.put("endCount", endCount);
        map.put("order", order);
        if (keyword.equals("null")) {
            return sqlSession.selectList("recruit.more", map);
        } else {
            map.put("keyword", keyword);
            return sqlSession.selectList("recruit.more2", map);
        }

    }

    public int delete(int rcrbrd_num) {
        int cnt = 0;
        cnt += sqlSession.delete("recruit.deleteRecruit", rcrbrd_num);
        cnt += sqlSession.delete("recruit.deleteRole", rcrbrd_num);
        cnt += sqlSession.delete("recruit.deleteRoleSeat", rcrbrd_num);
        cnt += sqlSession.delete("recruit.delete", rcrbrd_num);
        return cnt;
    } // delete() end

    public int status(int rcrbrd_num) {
        return sqlSession.update("recruit.status", rcrbrd_num);
    } // status() end

    public int views(int rcrbrd_num) {
        return sqlSession.update("recruit.views", rcrbrd_num);
    } // views() end

    public List<Map<String, ?>> rcrbrdlist(String mem_id) {
        return sqlSession.selectList("mypage.rcrbrdlist", mem_id);
    }

    public int attendCheck(int rcrbrd_num, String mem_id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rcrbrd_num", rcrbrd_num);
        map.put("mem_id", mem_id);
        if (sqlSession.selectOne("recruit.attendCheck", map) == null) {
            return 0;
        } else {
            return sqlSession.selectOne("recruit.attendCheck", map);
        }
    }

    public List<String> memSeat(int rcrbrd_num) {
        int count = (int) sqlSession.selectOne("recruit.rcrbrdMax", rcrbrd_num);
        List<String> list = new ArrayList<>();
        RecruitInfoDTO recruitInfoDTO = new RecruitInfoDTO();
        recruitInfoDTO.setRcrbrd_num(rcrbrd_num);
        for (int i = 1; i <= count; i++) {
            recruitInfoDTO.setRi_seat(i);
            if (sqlSession.selectOne("recruit.memSeat", recruitInfoDTO) != null) {
                list.add(sqlSession.selectOne("recruit.memSeat", recruitInfoDTO));
            } else {
                list.add("");
            }
        }
        return list;
    }

    public String heart(RatingDTO ratingDTO) {
        int cnt = sqlSession.selectOne("recruit.heartCheck", ratingDTO);
        String mem_id = ratingDTO.getReceive_id();
        if (cnt == 0) {
            sqlSession.insert("recruit.heart", ratingDTO);
            sqlSession.update("recruit.good", mem_id);
            return "님께 하트를 보냈습니다";
        } else {
            sqlSession.delete("recruit.heartDelete", ratingDTO);
            return "님께 보낸 하트를 취소했습니다";
        }
    }

    public String declare(RatingDTO ratingDTO) {
        sqlSession.insert("recruit.heart", ratingDTO);
        String mem_id = ratingDTO.getReceive_id();
        sqlSession.update("recruit.buyer_bad", mem_id);
        return "님을 신고했습니다";
    }

    public int comment(CommentDTO commentDTO) {
        return sqlSession.insert("recruit.comment", commentDTO);
    }

    public List<RecruitDTO> list2(String order, String keyword) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("order", order);
        map.put("keyword", keyword);
        sqlSession.insert("recruit.searchInsert", keyword);
        return sqlSession.selectList("recruit.list2", map);
    }

    public List<MoreDTO> listAjax2(String order, String keyword) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("order", order);
        map.put("keyword", keyword);
        return sqlSession.selectList("recruit.listAjax2", map);
    }

    public List<String> searchRank() {
        return sqlSession.selectList("recruit.searchRank");
    }
} // class end