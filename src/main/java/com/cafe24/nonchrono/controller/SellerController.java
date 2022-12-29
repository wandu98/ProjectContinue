package com.cafe24.nonchrono.controller;


import com.cafe24.nonchrono.dao.RecruitDAO;
import com.cafe24.nonchrono.dao.SalesDAO;
import com.cafe24.nonchrono.dao.SellerDAO;
import com.cafe24.nonchrono.dto.*;
import org.json.simple.JSONObject;
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
import java.awt.print.Pageable;
import java.io.*;
import java.util.*;

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
    public ModelAndView seller(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String sl_id = (String) session.getAttribute("sl_id");
        mav.addObject("progCountDay", sellerDAO.dt_progCountDay(sl_id));
        mav.addObject("progCountAll", sellerDAO.dt_progCountAll(sl_id));
        mav.addObject("saleAmountDay", sellerDAO.saleAmountDay(sl_id));
        mav.addObject("tsd", sellerDAO.topSellingDay(sl_id));
        mav.addObject("rsd", sellerDAO.recentsalesDay(sl_id));
        mav.addObject("srd", sellerDAO.salesreportDay(sl_id));
        mav.addObject("sryd", sellerDAO.salesreportYesterday(sl_id));
        mav.setViewName("seller/seller");
        return mav;
    }//seller() end

    //판매자가 판매하는 리스트 현황
    @RequestMapping("/list")
    public ModelAndView list2(HttpSession session, PagingDTO pagingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String sl_id = (String) session.getAttribute("sl_id");

        pagingDTO.setSl_id(sl_id);

        int totalRowCount = sellerDAO.totalRowCount(sl_id);

        //페이징
        int numPerPage = 5; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
        String pageNum = request.getParameter("pageNum");
        if(pageNum==null) {
            pageNum = "1";
        }//if end

        //현재 보고 있는 페이지
        int currentPage = Integer.parseInt(pageNum);

        int startRow = (currentPage-1)*numPerPage+1; //1  | 1
        int endRow = currentPage*numPerPage; //5
        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);

        double totcnt = (double)totalRowCount/numPerPage;
        int totalPage = (int)Math.ceil(totcnt);

        double d_page = (double)currentPage/pagePerBlock; // 1/10 -> 0.1
        //페이지 묶음 번호
        int Pages = (int)Math.ceil(d_page)-1; //0  1~10페이지 : 0, 11~20 : 1
        //페이지 묶음의 시작 페이지 번호
        int startPage = Pages*pagePerBlock; //0*10 -> 0
        //페이지 묶음의 마지막 페이지 번호
        int endPage = startPage + pagePerBlock+1; //0+10+1 = 11

        List list = null;
        if(totalRowCount>0) {
            list = sellerDAO.paginglist(pagingDTO); // 1, 5
        } else {
            list = Collections.EMPTY_LIST;
        }//if end
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("list2", list);
        mav.setViewName("seller/list");
        return mav;
    }// list() end

    //상품등록
    @RequestMapping("/write")
    public ModelAndView write(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String sl_id = (String) session.getAttribute("sl_id");
        if (sl_id != null && !sl_id.equals("guest")) {
            mav.setViewName("/seller/write");
            mav.addObject("dv_list", sellerDAO.dv_list(sl_id));
        } else {
            mav.setViewName("/mem/loginForm");
        }


        return mav;
    }// write() end

    //전체주문조회
    @RequestMapping("/order")
    public ModelAndView order(HttpSession session, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        PagingDTO pagingDTO = new PagingDTO();
        String sl_id = (String) session.getAttribute("sl_id");
        pagingDTO.setSl_id(sl_id);
        int totalRowCount = sellerDAO.fullTotalRowCount(pagingDTO);

        //페이징
        int numPerPage = 5; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
        String pageNum = request.getParameter("pageNum");
        if(pageNum==null) {
            pageNum = "1";
        }//if end

        //현재 보고 있는 페이지
        int currentPage = Integer.parseInt(pageNum);

        int startRow = (currentPage-1)*numPerPage+1; //1  | 1
        int endRow = currentPage*numPerPage; //5
        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);

        double totcnt = (double)totalRowCount/numPerPage;
        int totalPage = (int)Math.ceil(totcnt);

        double d_page = (double)currentPage/pagePerBlock; // 1/10 -> 0.1
        //페이지 묶음 번호
        int Pages = (int)Math.ceil(d_page)-1; //0  1~10페이지 : 0, 11~20 : 1
        //페이지 묶음의 시작 페이지 번호
        int startPage = Pages*pagePerBlock; //0*10 -> 0
        //페이지 묶음의 마지막 페이지 번호
        int endPage = startPage + pagePerBlock+1; //0+10+1 = 11

        List list = null;
        if(totalRowCount>0) {
            list = sellerDAO.fullList(pagingDTO); // 1, 5
        } else {
            list = Collections.EMPTY_LIST;
        }//if end

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("list", list);

        mav.setViewName("seller/order");
        return mav;
    }// order() end

    //배송정책
    @RequestMapping("/delivery")
    public ModelAndView delivery(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String sl_id = (String) session.getAttribute("sl_id");
        mav.setViewName("seller/delivery");
        mav.addObject("dv_list", sellerDAO.dv_list(sl_id));

        return mav;
    }// delivery() end

    //배송정책 추가
    @RequestMapping("/dv_insert")
    public String dv_insert(@ModelAttribute DeliveryDTO deliveryDTO, HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        if (deliveryDTO.getDv_how().equals("택배")) {
            deliveryDTO.setDv_exist('Y');
        } else {
            deliveryDTO.setDv_exist('N');
        }
        deliveryDTO.setSl_id(sl_id);
        sellerDAO.dv_insert(deliveryDTO);
        return "redirect:/seller/delivery";
    }

    ///후기관리
    @RequestMapping("/review")
    public ModelAndView review(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String sl_id = (String) session.getAttribute("sl_id");
        mav.addObject("list", sellerDAO.reviewList(sl_id));
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

    //판매자로그인
    @RequestMapping("/loginForm")
    public ModelAndView loginForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/loginForm");
        return mav;
    }//loginForm() end

    @RequestMapping("/reloginForm")
    public ModelAndView reloginForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/reloginForm");
        return mav;
    }

    @RequestMapping("/login")
    public ModelAndView loginProc(@ModelAttribute SellerDTO dto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
        String id = dto.getSl_id();
        //System.out.println("id : "+id);
        String pw = dto.getSl_pw();
        //System.out.println("pw : "+pw);
        ModelAndView mav = new ModelAndView();
        String grade = sellerDAO.login(id, pw);

        if (grade != null) {
            mav.setViewName("redirect:/seller/seller");
            session.setAttribute("sl_id", id);
            session.setAttribute("sl_pw", pw);
        } else {
            mav.setViewName("/seller/loginalert");
            req.setAttribute("msg", "아이디와 비번이 일치하지 않습니다");
        }//if end

        return mav;
    }//loginProc() end

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("sl_id");
        session.removeAttribute("sl_pw");
        return "redirect:/";
    }

    @RequestMapping("/masterLogout")
    public String masterLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    //회원가입
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signProc(@ModelAttribute SellerDTO dto) {
        sellerDAO.sellerInsert(dto);
        return "redirect:/seller";
    }//signProc() end

    //id 중복확인
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String sellersignup() {
        return "seller/sellerSignup";
    }

    @RequestMapping("checkIDselproc")
    @ResponseBody
    public String checkIDselproc(HttpServletRequest req) {
        String sl_id = req.getParameter("sl_id").trim();

        List<SellerDTO> selcheck = sellerDAO.selcheck();
        String cnt = "0";
        for (int i=0; i< selcheck.size(); i++) {
            if(sl_id.equals(selcheck.get(i).getSl_id())) {
                cnt = "1";
                break;
            }
        }
        JSONObject json = new JSONObject();
        json.put("count", cnt);
        return json.toString();
    }

    //카테고리 검색
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

    //상품등록
    @RequestMapping("/insert")
    public String selaseInsert(@RequestParam String gm_code, @RequestParam String ss_name, @RequestParam int ss_price, @RequestParam String ss_speriod, @RequestParam String ss_eperiod, @RequestParam int ss_stock, @RequestParam MultipartFile ss_img, @RequestParam String ss_status, @RequestParam String ss_description, @RequestParam int dv_num, HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        String profile = "";
        SalesDTO salesDTO = new SalesDTO();
        if (ss_img != null && !ss_img.isEmpty()) {
            profile = ss_img.getOriginalFilename();

            try {
                String path = ResourceUtils.getURL("classpath:static/images/product/sales_main").getPath();
                ss_img.transferTo(new File(path + "/" + profile));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        salesDTO.setSl_id(sl_id);
        salesDTO.setGm_code(gm_code);
        salesDTO.setSs_name(ss_name);
        salesDTO.setSs_price(ss_price);
        salesDTO.setSs_speriod(ss_speriod);
        salesDTO.setSs_eperiod(ss_eperiod);
        salesDTO.setSs_stock(ss_stock);
        salesDTO.setSs_img(profile);
        salesDTO.setSs_status(ss_status);
        salesDTO.setSs_description(ss_description);
        salesDTO.setDv_num(dv_num);
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
            path = path + "/product/seller/";

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
            String fileUrl = "/seller/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면
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
        path = path + "/product/seller/";
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

    //판매자 주문조회
//    @RequestMapping("/orderserach")
//    public void

    @RequestMapping(value = "/memLogin", method = RequestMethod.GET)
    public String memLogin() {
        return "/mem/loginForm2";
    }

    @RequestMapping("/sales_Today")
    @ResponseBody
    public List<Integer> sales_today(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Integer> list = sellerDAO.saleAmountDay(sl_id);
        return list;
    }

    @RequestMapping("/sales_Month")
    @ResponseBody
    public List<Integer> sales_month(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Integer> list = sellerDAO.saleAmountMonth(sl_id);
        return list;
    }

    @RequestMapping("/sales_Year")
    @ResponseBody
    public List<Integer> sales_year(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Integer> list = sellerDAO.saleAmountYear(sl_id);
        return list;
    }

    @RequestMapping("/topselling_Today")
    @ResponseBody
    public String topselling_Today(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Map<String, ?>> list = sellerDAO.topSellingDay(sl_id);
//        System.out.println(list);
        String result = "";
        for (int i=0; i<list.size(); i++){
            result += "<tr>";
            result += "     <th scope=\"row\"><a href=\"#\"><img src=\"/images/product/sales_main/" + list.get(i).get("ss_img") + "\"></a></th>";
            result += "     <td><a href=\"#\" class=\"text-primary fw-bold\">" + list.get(i).get("ss_name") + "</a></td>";
            result += "     <td>" + list.get(i).get("ss_price") + "</td>";
            result += "     <td class=\"fw-bold\">" + list.get(i).get("cnt") + "</td>";
            result += "     <td>" + list.get(i).get("sales") + "</td>";
            result += "</tr>";
        }
        return result;
    }

    @RequestMapping("/topselling_Month")
    @ResponseBody
    public String topselling_Month(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Map<String, ?>> list = sellerDAO.topSellingMonth(sl_id);
//        System.out.println(list);
        String result = "";
        for (int i=0; i<list.size(); i++){
            result += "<tr>";
            result += "     <th scope=\"row\"><a href=\"#\"><img src=\"/images/product/sales_main/" + list.get(i).get("ss_img") + "\"></a></th>";
            result += "     <td><a href=\"#\" class=\"text-primary fw-bold\">" + list.get(i).get("ss_name") + "</a></td>";
            result += "     <td>" + list.get(i).get("ss_price") + "</td>";
            result += "     <td class=\"fw-bold\">" + list.get(i).get("cnt") + "</td>";
            result += "     <td>" + list.get(i).get("sales") + "</td>";
            result += "</tr>";
        }
        return result;
    }

    @RequestMapping("/topselling_Year")
    @ResponseBody
    public String topselling_Year(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Map<String, ?>> list = sellerDAO.topSellingYear(sl_id);
//        System.out.println(list);
        String result = "";
        for (int i=0; i<list.size(); i++){
            result += "<tr>";
            result += "     <th scope=\"row\"><a href=\"#\"><img src=\"/images/product/sales_main/" + list.get(i).get("ss_img") + "\"></a></th>";
            result += "     <td><a href=\"#\" class=\"text-primary fw-bold\">" + list.get(i).get("ss_name") + "</a></td>";
            result += "     <td>" + list.get(i).get("ss_price") + "</td>";
            result += "     <td class=\"fw-bold\">" + list.get(i).get("cnt") + "</td>";
            result += "     <td>" + list.get(i).get("sales") + "</td>";
            result += "</tr>";
        }
        return result;
    }

    @RequestMapping("/recentsales_Today")
    @ResponseBody
    public String recentsales_Today(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Map<String, ?>> list = sellerDAO.recentsalesDay(sl_id);
        String result = "";
        for (int i=0; i<list.size(); i++){
            result += "<tr>";
            result += "     <th scope=\"row\"><a href=\"#\">" + list.get(i).get("od_num") + "</a></th>";
            result += "     <td>"+ list.get(i).get("mem_name") +"</td>";
            result += "     <td><a href=\"#\" class=\"text-primary\">" + list.get(i).get("ss_name") + "</a></td>";
            result += "     <td>" + list.get(i).get("ss_price") + "</td>";
            if (list.get(i).get("dt_prog").equals("결제완료") || list.get(i).get("dt_prog").equals("출고준비중") || list.get(i).get("dt_prog").equals("출고완료") || list.get(i).get("dt_prog").equals("배송중") || list.get(i).get("dt_prog").equals("배송완료")) {
                result += "     <td><span class=\"badge bg-warning\">" + list.get(i).get("dt_prog") + "</span></td>";
            } else if (list.get(i).get("dt_prog").equals("구매확정")) {
                result += "     <td><span class=\"badge bg-success\">" + list.get(i).get("dt_prog") + "</span></td>";
            } else {
                result += "     <td><span class=\"badge bg-danger\">" + list.get(i).get("dt_prog") + "</span></td>";
            }
            result += "</tr>";
        }
        return result;
    }

    @RequestMapping("/recentsales_Month")
    @ResponseBody
    public String recentsales_Month(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Map<String, ?>> list = sellerDAO.recentsalesMonth(sl_id);
        String result = "";
        for (int i=0; i<list.size(); i++){
            result += "<tr>";
            result += "     <th scope=\"row\"><a href=\"#\">" + list.get(i).get("od_num") + "</a></th>";
            result += "     <td>"+ list.get(i).get("mem_name") +"</td>";
            result += "     <td><a href=\"#\" class=\"text-primary\">" + list.get(i).get("ss_name") + "</a></td>";
            result += "     <td>" + list.get(i).get("ss_price") + "</td>";
            if (list.get(i).get("dt_prog").equals("결제완료") || list.get(i).get("dt_prog").equals("출고준비중") || list.get(i).get("dt_prog").equals("출고완료") || list.get(i).get("dt_prog").equals("배송중") || list.get(i).get("dt_prog").equals("배송완료")) {
                result += "     <td><span class=\"badge bg-warning\">" + list.get(i).get("dt_prog") + "</span></td>";
            } else if (list.get(i).get("dt_prog").equals("구매확정")) {
                result += "     <td><span class=\"badge bg-success\">" + list.get(i).get("dt_prog") + "</span></td>";
            } else {
                result += "     <td><span class=\"badge bg-danger\">" + list.get(i).get("dt_prog") + "</span></td>";
            }
            result += "</tr>";
        }
        return result;
    }

    @RequestMapping("/recentsales_Year")
    @ResponseBody
    public String recentsales_Year(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Map<String, ?>> list = sellerDAO.recentsalesYear(sl_id);
        String result = "";
        for (int i=0; i<list.size(); i++){
            result += "<tr>";
            result += "     <th scope=\"row\"><a href=\"#\">" + list.get(i).get("od_num") + "</a></th>";
            result += "     <td>"+ list.get(i).get("mem_name") +"</td>";
            result += "     <td><a href=\"#\" class=\"text-primary\">" + list.get(i).get("ss_name") + "</a></td>";
            result += "     <td>" + list.get(i).get("ss_price") + "</td>";
            if (list.get(i).get("dt_prog").equals("결제완료") || list.get(i).get("dt_prog").equals("출고준비중") || list.get(i).get("dt_prog").equals("출고완료") || list.get(i).get("dt_prog").equals("배송중") || list.get(i).get("dt_prog").equals("배송완료")) {
                result += "     <td><span class=\"badge bg-warning\">" + list.get(i).get("dt_prog") + "</span></td>";
            } else if (list.get(i).get("dt_prog").equals("구매확정")) {
                result += "     <td><span class=\"badge bg-success\">" + list.get(i).get("dt_prog") + "</span></td>";
            } else {
                result += "     <td><span class=\"badge bg-danger\">" + list.get(i).get("dt_prog") + "</span></td>";
            }
            result += "</tr>";
        }
        return result;
    }

    @RequestMapping("/budgetreport_Today")
    @ResponseBody
    public Map<String, Object> budgetreport_Today(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Integer> list = sellerDAO.salesreportDay(sl_id);
        List<Integer> list1 = sellerDAO.salesreportYesterday(sl_id);
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("list1", list1);
        return map;
    }

    @RequestMapping("/budgetreport_Month")
    @ResponseBody
    public Map<String, Object> budgetreport_Month(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Integer> list = sellerDAO.salesreportMonth(sl_id);
        List<Integer> list1 = sellerDAO.salesreportLastMonth(sl_id);
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("list1", list1);
        return map;
    }

    @RequestMapping("/budgetreport_Year")
    @ResponseBody
    public Map<String, Object> budgetreport_Year(HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        List<Integer> list = sellerDAO.salesreportYear(sl_id);
        List<Integer> list1 = sellerDAO.salesreportLastYear(sl_id);
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("list1", list1);
        return map;
    }

    @RequestMapping("/orderSearch")
    public ModelAndView orderSearch(@RequestParam String dt_prog, @RequestParam String ss_speriod, @RequestParam String ss_eperiod,
                                    @RequestParam String inputState, @RequestParam String keyword, @RequestParam(required = false) String pageNum,
                                    PagingDTO pagingDTO, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String sl_id = (String) session.getAttribute("sl_id");
        String result = "";

        System.out.println("dt_prog : " + dt_prog);
//        System.out.println("ss_speriod : " + ss_speriod);
//        System.out.println("ss_eperiod : " + ss_eperiod);
//        System.out.println("inputState : " + inputState);
//        System.out.println("keyword : " + keyword);

        if (Objects.equals(inputState, "주문번호")) {
            inputState = "od.od_num";
        } else if (Objects.equals(inputState,"상품명")) {
            inputState = "ss_name";
        } else if (Objects.equals(inputState, "상품가격")) {
            inputState = "ss_price";
        } else if (Objects.equals(inputState, "회원ID")) {
            inputState = "mem_id";
        } else {
            inputState = "";
        }
//        System.out.println("if 후 inputState : " + inputState);

        pagingDTO.setSl_id(sl_id);
        pagingDTO.setDt_prog(dt_prog);
        pagingDTO.setSs_speriod(ss_speriod);
        pagingDTO.setSs_eperiod(ss_eperiod);
        pagingDTO.setInputState(inputState);
        pagingDTO.setKeyword(keyword);
        int totalRowCount = 0;

        if (dt_prog!="" && ss_speriod=="" && ss_eperiod=="" && inputState=="" && keyword=="") { //진행상태
            totalRowCount = sellerDAO.progTotalRowCount(pagingDTO);
            System.out.println("progTotalRowCount");
        } else if (dt_prog=="" && ss_speriod!="" && ss_eperiod=="" && inputState=="" && keyword=="") { //시작일
            totalRowCount = sellerDAO.speriodTotalRowCount(pagingDTO);
            System.out.println("speriodTotalRowCount");
        } else if (dt_prog=="" && ss_speriod=="" && ss_eperiod!="" && inputState=="" && keyword=="") { //종료일
            totalRowCount = sellerDAO.eperiodTotalRowCount(pagingDTO);
            System.out.println("eperiodTotalRowCount");
        } else if (dt_prog=="" && ss_speriod!="" && ss_eperiod!="" && inputState=="" && keyword=="") { //시작&종료일
            totalRowCount = sellerDAO.spepTotalRowCount(pagingDTO);
            System.out.println("spepTotalRowCount");
        } else if (dt_prog=="" && ss_speriod=="" && ss_eperiod=="" && inputState!="" && keyword!="") { //조건
            totalRowCount = sellerDAO.ikTotalRowCount(pagingDTO);
            System.out.println("ikTotalRowCount");
        } else if (dt_prog!="" && ss_speriod!="" && ss_eperiod=="" && inputState=="" && keyword=="") { //진행상태, 시작일
            totalRowCount = sellerDAO.psTotalRowCount(pagingDTO);
            System.out.println("psTotalRowCount");
        } else if (dt_prog!="" && ss_speriod=="" && ss_eperiod!="" && inputState=="" && keyword=="") { //진행상태, 종료일
            totalRowCount = sellerDAO.peTotalRowCount(pagingDTO);
            System.out.println("peTotalRowCount");
        } else if (dt_prog!="" && ss_speriod!="" && ss_eperiod!="" && inputState=="" && keyword=="") { //진행상태, 시작&종료
            totalRowCount = sellerDAO.pseTotalRowCount(pagingDTO);
            System.out.println("pseTotalRowCount");
        } else if (dt_prog!="" && ss_speriod=="" && ss_eperiod=="" && inputState!="" && keyword!="") { //진행상태, 조건
            totalRowCount = sellerDAO.pikTotalRowCount(pagingDTO);
            System.out.println("pikTotalRowCount");
        } else if (dt_prog=="" && ss_speriod!="" && ss_eperiod=="" && inputState!="" && keyword!="") { //시작일, 조건
            totalRowCount = sellerDAO.sikTotalRowCount(pagingDTO);
            System.out.println("sikTotalRowCount");
        } else if (dt_prog=="" && ss_speriod=="" && ss_eperiod!="" && inputState!="" && keyword!="") { //죵료일, 조건
            totalRowCount = sellerDAO.eikTotalRowCount(pagingDTO);
            System.out.println("eikTotalRowCount");
        } else if (dt_prog=="" && ss_speriod!="" && ss_eperiod!="" && inputState!="" && keyword!="") { //시작&종료일 조건
            totalRowCount = sellerDAO.seikTotalRowCount(pagingDTO);
            System.out.println("seikTotalRowCount");
        } else if (dt_prog!="" && ss_speriod!="" && ss_eperiod=="" && inputState!="" && keyword!="") { //진행상태, 시작일, 조건
            totalRowCount = sellerDAO.psikTotalRowCount(pagingDTO);
            System.out.println("psikTotalRowCount");
        } else if (dt_prog!="" && ss_speriod=="" && ss_eperiod!="" && inputState!="" && keyword!="") { //진행상태, 종료일, 조건
            totalRowCount = sellerDAO.peikTotalRowCount(pagingDTO);
            System.out.println("peikTotalRowCount");
        } else if (dt_prog!="" && ss_speriod!="" && ss_eperiod!="" && inputState!="" && keyword!="") { //진행상태, 시작&종료일, 조건
            totalRowCount = sellerDAO.pseikTotalRowCount(pagingDTO);
            System.out.println("pseikTotalRowCount");
        } else { //전체
            totalRowCount = sellerDAO.fullTotalRowCount(pagingDTO);
            System.out.println("fullTotalRowCount");
        }
        System.out.println("totalRowCount : " + totalRowCount);

        //페이징
        int numPerPage = 5; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
//        String pageNum = request.getParameter("pageNum");
        if(pageNum==null) {
            pageNum = "1";
        }//if end
//        System.out.println(pageNum);


        //현재 보고 있는 페이지
        int currentPage = Integer.parseInt(pageNum);

        int startRow = (currentPage-1)*numPerPage+1; //1  | 1
        int endRow = currentPage*numPerPage; //5
        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);

        double totcnt = (double)totalRowCount/numPerPage;
        int totalPage = (int)Math.ceil(totcnt);

        double d_page = (double)currentPage/pagePerBlock; // 1/10 -> 0.1
        //페이지 묶음 번호
        int Pages = (int)Math.ceil(d_page)-1; //0  1~10페이지 : 0, 11~20 : 1
        //페이지 묶음의 시작 페이지 번호
        int startPage = Pages*pagePerBlock; //0*10 -> 0
        //페이지 묶음의 마지막 페이지 번호
        int endPage = startPage + pagePerBlock+1; //0+10+1 = 11


        List<Map<String,?>> progSearch = new ArrayList<>();

        if (totalRowCount>0) {
            if (dt_prog!="" && ss_speriod=="" && ss_eperiod=="" && inputState=="" && keyword=="") { //진행상태
                progSearch = sellerDAO.progList(pagingDTO);
            } else if (dt_prog=="" && ss_speriod!="" && ss_eperiod=="" && inputState=="" && keyword=="") { //시작일
                progSearch = sellerDAO.speriodList(pagingDTO);
            } else if (dt_prog=="" && ss_speriod=="" && ss_eperiod!="" && inputState=="" && keyword=="") { //종료일
                progSearch = sellerDAO.eperiodList(pagingDTO);
            } else if (dt_prog=="" && ss_speriod!="" && ss_eperiod!="" && inputState=="" && keyword=="") { //시작&종료일
                progSearch = sellerDAO.spepList(pagingDTO);
            } else if (dt_prog=="" && ss_speriod=="" && ss_eperiod=="" && inputState!="" && keyword!="") { //조건
                progSearch = sellerDAO.ikList(pagingDTO);
            } else if (dt_prog!="" && ss_speriod!="" && ss_eperiod=="" && inputState=="" && keyword=="") { //진행상태, 시작일
                progSearch = sellerDAO.psList(pagingDTO);
            } else if (dt_prog!="" && ss_speriod=="" && ss_eperiod!="" && inputState=="" && keyword=="") { //진행상태, 종료일
                progSearch = sellerDAO.peLIst(pagingDTO);
            } else if (dt_prog!="" && ss_speriod!="" && ss_eperiod!="" && inputState=="" && keyword=="") { //진행상태, 시작&종료
                progSearch = sellerDAO.pseList(pagingDTO);
            } else if (dt_prog!="" && ss_speriod=="" && ss_eperiod=="" && inputState!="" && keyword!="") { //진행상태, 조건
                progSearch = sellerDAO.pikList(pagingDTO);
            } else if (dt_prog=="" && ss_speriod!="" && ss_eperiod=="" && inputState!="" && keyword!="") { //시작일, 조건
                progSearch = sellerDAO.sikListList(pagingDTO);
            } else if (dt_prog=="" && ss_speriod=="" && ss_eperiod!="" && inputState!="" && keyword!="") { //죵료일, 조건
                progSearch = sellerDAO.eikList(pagingDTO);
            } else if (dt_prog=="" && ss_speriod!="" && ss_eperiod!="" && inputState!="" && keyword!="") { //시작&종료일 조건
                progSearch = sellerDAO.seikList(pagingDTO);
            } else if (dt_prog!="" && ss_speriod!="" && ss_eperiod=="" && inputState!="" && keyword!="") { //진행상태, 시작일, 조건
                progSearch = sellerDAO.psikList(pagingDTO);
            } else if (dt_prog!="" && ss_speriod=="" && ss_eperiod!="" && inputState!="" && keyword!="") { //진행상태, 종료일, 조건
                progSearch = sellerDAO.peikList(pagingDTO);
            } else if (dt_prog!="" && ss_speriod!="" && ss_eperiod!="" && inputState!="" && keyword!="") { //진행상태, 시작&종료일, 조건
                progSearch = sellerDAO.pseikList(pagingDTO);
            } else { //전체
                progSearch = sellerDAO.fullList(pagingDTO);
            }
        } else {
            progSearch = Collections.EMPTY_LIST;
        }

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("progSearch", progSearch);
        mav.addObject("dt_prog", dt_prog);
        mav.addObject("ss_speriod", ss_speriod);
        mav.addObject("ss_eperiod", ss_eperiod);
        mav.addObject("inputState", inputState);
        mav.addObject("keyword", keyword);
        mav.setViewName("seller/orderSearch");
        return mav;
    }

    @RequestMapping("/modify/{ss_num}")
    public ModelAndView modify(@PathVariable int ss_num, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String sl_id = (String) session.getAttribute("sl_id");
        mav.addObject("dv_list", sellerDAO.dv_list(sl_id));
        mav.addObject("info", sellerDAO.productInfo(ss_num));
        mav.setViewName("seller/modify");
        return mav;
    }

    @RequestMapping("/update")
    public String selaseUpdate(@RequestParam int ss_num, @RequestParam String gm_code, @RequestParam String ss_name, @RequestParam int ss_price, @RequestParam String ss_speriod, @RequestParam String ss_eperiod, @RequestParam int ss_stock, @RequestParam MultipartFile ss_img, @RequestParam String ss_status, @RequestParam String ss_description, @RequestParam int dv_num, HttpSession session) {
        String sl_id = (String) session.getAttribute("sl_id");
        String profile = "";
        SalesDTO salesDTO = new SalesDTO();
        if (ss_img != null && !ss_img.isEmpty()) {
            profile = ss_img.getOriginalFilename();

            try {
                String path = ResourceUtils.getURL("classpath:static/images/product/sales_main").getPath();
                ss_img.transferTo(new File(path + "/" + profile));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        salesDTO.setSl_id(sl_id);
        salesDTO.setSs_num(ss_num);
        salesDTO.setGm_code(gm_code);
        salesDTO.setSs_name(ss_name);
        salesDTO.setSs_price(ss_price);
        salesDTO.setSs_speriod(ss_speriod);
        salesDTO.setSs_eperiod(ss_eperiod);
        salesDTO.setSs_stock(ss_stock);
        salesDTO.setSs_img(profile);
        salesDTO.setSs_status(ss_status);
        salesDTO.setSs_description(ss_description);
        salesDTO.setDv_num(dv_num);
        int cnt = sellerDAO.pdtUpdate(salesDTO);
        if (cnt==0) {
            System.out.println("상품 정보 수정 실패");
        } else {
            System.out.println("상품 정보 수정 성공");
        }
        return "redirect:/seller/list";
    } // insert() end


}//class end
