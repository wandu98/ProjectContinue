package com.cafe24.nonchrono.controller;



import com.cafe24.nonchrono.dao.RecruitDAO;
import com.cafe24.nonchrono.dao.SalesDAO;
import com.cafe24.nonchrono.dao.SellerDAO;
import com.cafe24.nonchrono.dto.MemDTO;
import com.cafe24.nonchrono.dto.RecruitDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import com.cafe24.nonchrono.dto.SellerDTO;
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
import java.util.ArrayList;
import java.util.UUID;


@Controller
@RequestMapping("/seller")
public class SellerController {

    public SellerController() {
        System.out.println("-----SellerController() 객체 생성됨");
    }

    @Autowired
    SellerDAO sellerDAO;
    @Autowired
    RecruitDAO recruitDAO;

    @Autowired
    SalesDAO salesDAO;


    //판매자 메인
    @RequestMapping("/seller")
    public ModelAndView seller() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/seller");
        return mav;
    }//seller() end

    //판매자가 판매하는 리스트 현황
    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/list");
        return mav;
    }// list() end

    //상품등록
    @RequestMapping("/write")
    public ModelAndView write() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/write");
        return mav;
    }// write() end

    //전체주문조회
    @RequestMapping("/order")
    public ModelAndView order() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/order");
        return mav;
    }// order() end

    //배송정책
    @RequestMapping("/delivery")
    public ModelAndView delivery() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/delivery");
        return mav;
    }// delivery() end

    ///후기관리
    @RequestMapping("/review")
    public ModelAndView review() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/review");
        return mav;
    }//review() end

    //1:1문의
    @RequestMapping("/one_sentence")
    public ModelAndView one_sentence() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/one_sentence");
        return mav;
    }//one_sentence() end

    @RequestMapping("/loginForm")
    public ModelAndView loginForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/loginForm");
        return mav;
    }//loginForm() end

    @RequestMapping("/searchProc")
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
                message += size + "|";
                for (int i = 0; i < size; i++) {
                    String title = list.get(i);
                    message += title;
                    // System.out.println(recruitDAO.gm_list2(title));
                    list2.add(recruitDAO.gm_list2(title));
                    System.out.println(list2.get(i));
                    if (i < size - 1) {
                        message += ",";
                    } // if end
                } // for end

                // 구분
                message += "|";

                // 타이틀 코드를 message에 담기
                for (int j = 0; j < size; j++) {
                    String code = list2.get(j);
                    System.out.println("code : " + code);
                    message += code;
                    if (j < size - 1) {
                        message += ",";
                    } // if end
                } // for end

            } // if end
        } // if end

        return message;
    } // searchProc() end

    // 상품등록 검색 리스트
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
        return list;
    } // searchList() end

    @RequestMapping("/insert")
    public String recruitInsert(@ModelAttribute SalesDTO salesDTO) {
        salesDAO.insert(salesDTO);
        return "redirect:/seller";
    } // insert() end


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
            System.out.println("path : " + path);// 이미지 저장경로 console에 확인//해당 디렉토리 확인
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
        System.out.println("path : " + path);
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


}//class end
