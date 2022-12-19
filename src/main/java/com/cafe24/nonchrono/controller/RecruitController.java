package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.MemDAO;
import com.cafe24.nonchrono.dao.RecruitDAO;
import com.cafe24.nonchrono.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/recruit")
public class RecruitController {


    @Autowired
    private RecruitDAO recruitDAO;

    @Autowired
    private MemDAO memDAO;

    public RecruitController() {
        System.out.println("-----RecruitController() 객체 생성됨");
    } // RecruitController() end

    // 모집 게시판 홈
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView recruitList(HttpSession session, String order) {
        RecruitDTO dto = new RecruitDTO();
        ModelAndView mav = new ModelAndView();
        String order2 = "rcrbrd_num";
        if (order == null || order.equals("")) {
            order = order2;
        }
        // System.out.println("order : " + order);
        List<RecruitDTO> list = recruitDAO.list(order);
        List<String> gameList = new ArrayList<>();
        List<String> attendMembers = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {
            dto = list.get(i);
            int num = dto.getRcrbrd_num();
            // 게임 이름 가져오기
            gameList.add(recruitDAO.game(num));
            // 참여한 모집원들 수
            attendMembers.add(String.valueOf(recruitDAO.attendMembers(num).size()));

            //System.out.println("num : " + num);
            //System.out.println("게임 이름 : "+gameList.get(i));
        }

        String mem_id = (String) session.getAttribute("mem_id");
        if (mem_id != null && !mem_id.equals("guest")) {
            mav.addObject("list", list);
            mav.addObject("game", gameList);
            mav.addObject("attendCount", attendMembers);
            mav.addObject("rcrKing", recruitDAO.rcrKing());
            mav.addObject("searchRank", recruitDAO.searchRank());
            // System.out.println(recruitDAO.rcrKing());
            mav.setViewName("/recruit/recruit");
        } else {
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    } // recruitList() end

    // ajax로 정렬 기준 바꿀 때
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public List<MoreDTO> recruitListAjax(HttpSession session, String order, String keyword) {
        List<MoreDTO> list = new ArrayList<>();

        String order2 = "rcrbrd_num";
        if (order == null || order.equals("")) {
            order = order2;
        }
        // System.out.println("keyword : " + keyword);
        // System.out.println("order : " + order);
        if (keyword.equals("null") || keyword.equals("")) {
            // System.out.println("keyword null");
            list = recruitDAO.listAjax(order);
        } else {
            // System.out.println("keyword not null");
            list = recruitDAO.listAjax2(order, keyword);
        }
        // System.out.println(list);
        List<MoreDTO> list2 = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {
            MoreDTO moreDTO = new MoreDTO();
            moreDTO.setRcrbrd_num(list.get(i).getRcrbrd_num());
            moreDTO.setGm_code(list.get(i).getGm_code());
            moreDTO.setGm_name(list.get(i).getGm_name());
            moreDTO.setRcrbrd_subject(list.get(i).getRcrbrd_subject());
            moreDTO.setRcrbrd_edate(list.get(i).getRcrbrd_edate());
            moreDTO.setRcrbrd_max(list.get(i).getRcrbrd_max());
            moreDTO.setCount(recruitDAO.attendMembers(list.get(i).getRcrbrd_num()).size());

            list2.add(i, moreDTO);
        }
        // System.out.println(list2);
        return list2;
    } // recruitList() end

    // 모집 게시판 글 작성
    @RequestMapping("/form")
    public ModelAndView recruitForm(HttpServletRequest req) throws Exception {
        ModelAndView mav = new ModelAndView();
        HttpSession session = req.getSession();
        String mem_id = (String) session.getAttribute("mem_id");
        if (mem_id != null && !mem_id.equals("guest")) {
            mav.addObject("nickname", recruitDAO.nickname(mem_id));
            mav.setViewName("/recruit/recruitForm");
        } else {
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    } // recruitForm() end

    // 모집 게시판 검색 과정
    @RequestMapping( "/searchProc")
    @ResponseBody
    public String search(HttpServletRequest req) {
        String keyword = req.getParameter("gs_keyword").trim();
        String message = ""; // 응답 메세지


        // 검색어가 존재할 때
        if (keyword.length() > 0) {
            ArrayList<String> list = searchList(keyword);
            ArrayList<String> list2 = new ArrayList<String>();

            RecruitDTO dto = new RecruitDTO();


            int size = list.size();
            if (size > 0) {

                // 타이틀 제목을 message에 담기
                message += size + "^^^";
                for (int i = 0; i < size; i++) {
                    String title = list.get(i);
                    message += title;
                    // System.out.println(recruitDAO.gm_list2(title));
                    list2.add(recruitDAO.gm_list2(title));
                    // System.out.println(list2.get(i));
                    if (i < size - 1) {
                        message += ",";
                    } // if end
                } // for end

                // 구분
                message += "^^^";

                // 타이틀 코드를 message에 담기
                for (int j = 0; j < size; j++) {
                    String code = list2.get(j);
                    // System.out.println("code : " + code);
                    message += code;
                    if (j < size - 1) {
                        message += ",";
                    } // if end
                } // for end

            } // if end
        } // if end

        // System.out.println("view로 전달값 : " + message);

        return message;
    } // searchProc() end

    // 모집 게시판 검색 리스트
    public ArrayList<String> searchList(String keyword) {
        // 검색하고자 하는 게임 타이틀 목록
        ArrayList<String> list2 = new ArrayList<String>();
        for (int i = 0; i < recruitDAO.gm_list().size(); i++) {
            // 게임 타이틀 목록 중 검색어가 포함된 게임 타이틀을 list2에 추가
            list2.add(recruitDAO.gm_list().get(i).getGm_name());
        } // for end


        String[] keywords = list2.toArray(new String[list2.size()]);

        ArrayList<String> list = new ArrayList<String>();
        for (String word : keywords) {
            word = word.toUpperCase();
            if (word.contains(keyword.toUpperCase())) {
                list.add(word);
            } // if end
        } // for end

        // System.out.println("전체 게임 목록 : " + list2);
        // System.out.println("검색어가 포함된 리스트 : " + list);
        return list;
    } // searchList() end

    // CKEditor 이미지 업로드
    @RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try {
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = ResourceUtils.getURL("classpath:static/images").getPath(); // 이미지 경로 설정(폴더 자동 생성)
            path = path + "/recruit/";

            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            // System.out.println("path : " + path);// 이미지 저장경로 console에 확인//해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs();// 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/recruit/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면
            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return;
    }// imageUpload() end

    // CKEditor 서버로 전송된 이미지 뿌려주기
    @RequestMapping(value = "/ckImgSubmit")
    public void ckSubmit(@RequestParam(value = "uid") String uid
            , @RequestParam(value = "fileName") String fileName
            , HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        //서버에 저장된 이미지 경로
        // String path = "target/classes/static/images/recruit/";
        ServletContext application = req.getSession().getServletContext();
        String path = ResourceUtils.getURL("classpath:static/images").getPath(); // 이미지 경로 설정(폴더 자동 생성)
        path = path + "/recruit/";
        // System.out.println("path : " + path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try {
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = resp.getOutputStream();

                while ((readByte = fileInputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    } // ckSubmit() end

    // 모집 정보 상세보기
    @RequestMapping("/detail/{rcrbrd_num}")
    public ModelAndView recruitDetail(@PathVariable int rcrbrd_num, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        // System.out.println(mem_id);

        if (mem_id != null && !mem_id.equals("guest")) {
            mav.addObject("views", recruitDAO.views(rcrbrd_num)); // 조회수 증가
            mav.addObject("detail", recruitDAO.detail(rcrbrd_num)); // 모집 정보 상세보기
            mav.addObject("gameDetail", recruitDAO.gameDetail(rcrbrd_num)); // 게임 정보 상세보기
            mav.addObject("memDetail", recruitDAO.memDetail(rcrbrd_num)); // 모집장 정보 상세보기
            mav.addObject("recruitCount", recruitDAO.recruitCount(rcrbrd_num)); // 게시판의 모집장의 모집 횟수 카운트
            mav.addObject("roleList", recruitDAO.roleList(rcrbrd_num)); // 역할 테이블에서 역할 리스트 가져오기
            mav.addObject("roleNameSeat", recruitDAO.roleName(rcrbrd_num)); // 역할 배정 테이블에서 역할 이름과 좌석 번호 가져오기
            // mav.addObject("attendMembers", recruitDAO.attendMembers(rcrbrd_num)); // 참여자 목록 가져오기
            mav.addObject("attendCheck", recruitDAO.attendCheck(rcrbrd_num, mem_id)); // 본인이 어느 자리에 참가했는지 확인
            mav.addObject("attendCount", recruitDAO.attendCount(rcrbrd_num, mem_id)); // 본인이 참가한 횟수 확인
            mav.addObject("memName", recruitDAO.memName(rcrbrd_num)); // 자리와 id 조회
            mav.addObject("memNick", recruitDAO.memNick(rcrbrd_num)); // 자리당 닉네임 조회
            mav.addObject("mem_id", mem_id);
            mav.addObject("memPic", recruitDAO.memPic(rcrbrd_num)); // 자리당 프로필 사진 조회 // 아직 참가 안 한 자리는 ''로 표현
            mav.addObject("memSeat", recruitDAO.memSeat(rcrbrd_num)); // 자리당 좌석 번호 조회 // 아직 참가 안 한 자리는 ''로 표현
            mav.addObject("memTemp", memDAO.temp(recruitDAO.memDetail(rcrbrd_num).getMem_id())); // 모집장의 온도 가져오기
        /*
        List<RoleSeatDTO> rname = recruitDAO.roleName(rcrbrd_num);

        System.out.println(rname);
        mav.addObject("rname", rname); // 역할 이름 리스트
        */

            mav.setViewName("/recruit/recruitDetail");
        } else {
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    } // recruitDetail() end

    // 모집 정보 작성
    @RequestMapping("/insert")
    public String recruitInsert(@ModelAttribute RecruitDTO recruitDTO, @ModelAttribute RoleDTO roleDTO, HttpServletRequest req) {

        // 모집 내용 insert
        recruitDAO.insert(recruitDTO);
        // 위에서 insert한 게시글 번호 가져오기
        int num = recruitDAO.numSearch();

        // 역할 추가 수만큼 반복하여 역할 내용 insert
        for (int i = 1; i <= Integer.parseInt(req.getParameter("hiddenCount")); i++) {

            roleDTO.setRl_name(req.getParameter("rl_role" + i));
            roleDTO.setRcrbrd_num(num);

            recruitDAO.roleInsert(roleDTO);
        }

        return "redirect:/recruit";
    } // recruitWrite() end

    // 모집 좌석 예약
    @RequestMapping("/attend")
    public String attend(@ModelAttribute RecruitInfoDTO recruitInfoDTO) {
        recruitDAO.attend(recruitInfoDTO);
        return "redirect:/recruit";
    } // attend() end

    @RequestMapping("/roleConfirm")
    @ResponseBody
    public void roleConfirm(@ModelAttribute RoleSeatDTO roleSeatDTO, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        int cnt = recruitDAO.roleConfirm(roleSeatDTO);
        if (cnt == 0) {
            out.println("<script>alert('해당 역할은 모집이 마감되었습니다.'); history.go(-1);</script>");
            out.flush();
        }
    } // roleConfirm() end

    // 역할 배정 정보 실시간 갱신
    /*@RequestMapping("/roleName")
    @ResponseBody
    public List<RoleSeatDTO> roleName(@RequestParam int rcrbrd_num) throws IOException {
        *//*ModelAndView mav = new ModelAndView();
        mav.addObject("roleName", recruitDAO.roleName(rcrbrd_num));
        return mav;*//*

        List<RoleSeatDTO> list = new ArrayList<RoleSeatDTO>();
        list = recruitDAO.roleName(rcrbrd_num);

        return list;
    } // roleName() end*/

    // 게시판 번호와 좌석 번호로 데이터가 존재하는지 확인
    @RequestMapping("/roleSeatCheck")
    @ResponseBody
    public int roleSeatCheck(@ModelAttribute RoleSeatDTO roleSeatDTO) {
        int cnt = recruitDAO.roleSeatCheck(roleSeatDTO);
        return cnt;
    } // roleSeatCheck() end

    // 게시판 번호와 좌석 번호로 좌석 수 확인
    /*
    @RequestMapping("/roleSeatCount")
    @ResponseBody
    public int roleSeatCount(@RequestParam int rcrbrd_num) {
        int cnt = recruitDAO.roleSeatCount(rcrbrd_num);
        return cnt;
    } // roleSeatCount() end
    */

    @RequestMapping("/getMoreContents")
    @ResponseBody
    public List<MoreDTO> getMoreContents(int startCount, int endCount, String order, String keyword) {
        List<MoreDTO> list = new ArrayList<>();
        List<MoreDTO> list2 = new ArrayList<>();
        list = recruitDAO.getMoreContents(startCount, endCount, order, keyword);

        for (int i = 0; i < list.size(); i++) {
            MoreDTO moreDTO = new MoreDTO();
            moreDTO.setRcrbrd_num(list.get(i).getRcrbrd_num());
            moreDTO.setGm_code(list.get(i).getGm_code());
            moreDTO.setGm_name(list.get(i).getGm_name());
            moreDTO.setRcrbrd_subject(list.get(i).getRcrbrd_subject());
            moreDTO.setRcrbrd_edate(list.get(i).getRcrbrd_edate());
            moreDTO.setRcrbrd_max(list.get(i).getRcrbrd_max());
            moreDTO.setCount(recruitDAO.attendMembers(list.get(i).getRcrbrd_num()).size());

//            System.out.println("글번호 : " + moreDTO.getRcrbrd_num());
//            System.out.println("게임코드 : " + moreDTO.getGm_code());
//            System.out.println("게임 이름 : " + moreDTO.getGm_name());
//            System.out.println("게시글 제목 : " + moreDTO.getRcrbrd_subject());
//            System.out.println("종료 날짜 : " + moreDTO.getRcrbrd_edate());
//            System.out.println("최대 인원 : " + moreDTO.getRcrbrd_max());
//            System.out.println("카운트 : " + moreDTO.getCount());

            list2.add(i, moreDTO);
        }
        return list2;
    } // getMoreContents() end

    /* 업데이트는 기능상 만들면 안 될 것 같다
    @RequestMapping("/update")
    public ModelAndView update(@RequestParam int rcrbrd_num, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        if (mem_id != null && !mem_id.equals("guest")) {
            mav.addObject("detail", recruitDAO.detail(rcrbrd_num)); // 모집 정보 상세보기
            mav.addObject("gameDetail", recruitDAO.gameDetail(rcrbrd_num)); // 게임 정보 상세보기
            mav.addObject("roleList", recruitDAO.roleList(rcrbrd_num)); // 역할 테이블에서 역할 리스트 가져오기
            mav.setViewName("/recruit/updateForm");
        } else {
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    } // update() end
    */

    @RequestMapping("/delete")
    public String delete(@RequestParam int rcrbrd_num, HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        if (mem_id != null && !mem_id.equals("guest")) {
            int cnt = recruitDAO.delete(rcrbrd_num);
            if (cnt == 0) {
                System.out.println("삭제에 실패하였습니다!");
            }
            return "redirect:/recruit";
        } else {
            return "/mem/loginForm";
        }
    } // delete() end

    // 진행중 -> 진행완료 변경
    @RequestMapping("/status")
    public String status(int rcrbrd_num) {
        int cnt = recruitDAO.status(rcrbrd_num);
        return "redirect:/recruit/detail/" + rcrbrd_num;
    }

    @RequestMapping("/myDelete")
    @ResponseBody
    public String myDelete(HttpSession session, HttpServletRequest request) {
        String mem_id = (String) session.getAttribute("mem_id");
        int rcrbrd_num = Integer.parseInt(request.getParameter("rcrbrd_num"));
        int cnt = recruitDAO.delete(rcrbrd_num);
        String result = "";
        List<Map<String,?>> list = new ArrayList<>();
        if (cnt == 0) {
            System.out.println("삭제에 실패하였습니다!");
        } else {
            list = recruitDAO.rcrbrdlist(mem_id);
            if (list.size()==0) {
                result += "<tr><td colspan=\"5\"><h5>없음</h5></td></tr>";
            } else {
                for (int i=0; i< list.size(); i++) {
                    result += "<tr>";
                    result += "    <td class=\"shoping__cart__item\">";
                    result += "        <img class=\"gm_img\" src=\"/images/thumb/" + list.get(i).get("gm_code") + "/thumb.jpg\">";
                    result += "        <h5 style=\"font-weight: 700\">" + list.get(i).get("rcrbrd_subject") + "</h5>";
                    result += "    </td>";
                    result += "    <td class=\"shoping__cart__price gm_name\">";
                    result += "        "+list.get(i).get("gm_name");
                    result += "    </td>";
                    result += "    <td class=\"shoping__cart__quantity people_cnt\">";
                    result += "        <h5 style=\"font-weight: 700\">" + list.get(i).get("cnt") + "</h5>";
                    result += "    </td>";
                    result += "    <td class=\"shoping__cart__total\">";
                    result += "        " + list.get(i).get("rcrbrd_edate");
                    result += "    </td>";
                    result += "    <td class=\"shoping__cart__item__close\" id=\"close\">";
                    result += "        <span class=\"icon_close\" onclick=\"rcrDelete(" + list.get(i).get("rcrbrd_num") + ")\"></span>";
                    result += "    </td>";
                    result += "</tr>";
                }
            }

        }
        return result;
    }

    @RequestMapping("/heart")
    @ResponseBody
    public String heart(@ModelAttribute RatingDTO ratingDTO) {
        return recruitDAO.heart(ratingDTO);
    }

    @RequestMapping("/declare")
    @ResponseBody
    public String declare(@ModelAttribute RatingDTO ratingDTO) {
        return recruitDAO.declare(ratingDTO);
    }

    @RequestMapping("/comment")
    @ResponseBody
    public int comment(@ModelAttribute CommentDTO commentDTO, HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        commentDTO.setMem_id(mem_id);
        // System.out.println(commentDTO);
        int cnt = recruitDAO.comment(commentDTO);
        return cnt;
    }

    @RequestMapping("/searchWord")
    public ModelAndView searchWord(HttpSession session, String order, @RequestParam String gs_keyword) {
        RecruitDTO dto = new RecruitDTO();
        ModelAndView mav = new ModelAndView();
        String order2 = "rcrbrd_num";
        if (order == null || order.equals("")) {
            order = order2;
        }
        // System.out.println("order : " + order);
        // System.out.println("gs_keyword : " + gs_keyword);
        List<RecruitDTO> list = recruitDAO.list2(order, gs_keyword);
        // System.out.println("list : " + list);
        List<String> gameList = new ArrayList<>();
        List<String> attendMembers = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {
            dto = list.get(i);
            int num = dto.getRcrbrd_num();
            // 게임 이름 가져오기
            gameList.add(recruitDAO.game(num));
            // 참여한 모집원들 수
            attendMembers.add(String.valueOf(recruitDAO.attendMembers(num).size()));

            //System.out.println("num : " + num);
            //System.out.println("게임 이름 : "+gameList.get(i));
        }

        String mem_id = (String) session.getAttribute("mem_id");
        if (mem_id != null && !mem_id.equals("guest")) {
            mav.addObject("list", list);
            mav.addObject("game", gameList);
            mav.addObject("attendCount", attendMembers);
            mav.addObject("rcrKing", recruitDAO.rcrKing());
            mav.addObject("searchRank", recruitDAO.searchRank());
            // System.out.println(recruitDAO.rcrKing());
            mav.setViewName("/recruit/recruit");
        } else {
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    }


    // 삭제 후 이메일 발송

} // class end