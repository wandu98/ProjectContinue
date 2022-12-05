package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.*;
import com.cafe24.nonchrono.dto.MemDTO;
import com.cafe24.nonchrono.dto.PagingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    public MypageController() {
        System.out.println("-----MypageController() 객체 생성됨");
    }

    @Autowired
    MemDAO memDAO;

    @Autowired
    WishDAO wishDAO;

    @Autowired
    MemdvDAO memdvDAO;

    @Autowired
    QuestionDAO questionDAO;

    @Autowired
    ReviewDAO reviewDAO;


    @RequestMapping("/mypage")
    public ModelAndView mypage() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("meminfo", memDAO.list());
        mav.addObject("qslist", questionDAO.count());
        mav.addObject("revlist", reviewDAO.list());
        mav.setViewName("mypage/mypage");
        return mav;
    }//mypage() end

    @RequestMapping("/wishlist")
    public ModelAndView wishlist(HttpServletRequest req, PagingDTO pagingDTO) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/wishlist");

        int totalRowCount = wishDAO.totalRowCount(); //총 글갯수  6 |  52개

        //페이징
        int numPerPage = 5; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
        String pageNum = req.getParameter("pageNum");
        if(pageNum==null) {
            pageNum = "1";
        }//if end

        //현재 보고 있는 페이지
        int currentPage = Integer.parseInt(pageNum); //1  | 1

        //한페이지에 보여지는 행 갯수는 5
        //따라서 1페이지 : rnum 1~5, 2페이지 : 6~10, 3페이지 : 11~15
        //1~5 = (0*5+1)~(1*5), 6~10 = (1*5+1)~(2*5), 11~15 = (2*5+1)~(3*5) 와 같은 규칙이 있음.
        int startRow = (currentPage-1)*numPerPage+1; //1  | 1
        int endRow = currentPage*numPerPage; //5
        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);

        //페이지 수
        //행을 페이지마다 5개씩 보여주므로 전체 행을 5로 나눔
        double totcnt = (double)totalRowCount/numPerPage; // 6/5 ->1.2 | 52/5 = 10.4
        //나누어 떨어지지 않으면 한페이지를 더 늘려야 모든 행이 나오므로 totcnt를 올림
        //전체 페이지 수
        int totalPage = (int)Math.ceil(totcnt); //2 | 11


        double d_page = (double)currentPage/pagePerBlock; // 1/10 -> 0.1
        //페이지 묶음 번호
        int Pages = (int)Math.ceil(d_page)-1; //0  1~10페이지 : 0, 11~20 : 1
        //페이지 묶음의 시작 페이지 번호
        int startPage = Pages*pagePerBlock; //0*10 -> 0
        //페이지 묶음의 마지막 페이지 번호
        int endPage = startPage + pagePerBlock+1; //0+10+1 = 11

        List list = null;
        if(totalRowCount>0) {
            list = wishDAO.list(pagingDTO); // 1, 5
        } else {
            list = Collections.EMPTY_LIST;
        }//if end

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("list", list);
        return mav;
    }

    @RequestMapping("/coupon")
    public ModelAndView coupon() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/coupon");
        return mav;
    }

    @RequestMapping("/review")
    public ModelAndView review() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/review");
        return mav;
    }

    @RequestMapping("/memdv")
    public ModelAndView memdv() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/memdv");
        mav.addObject("list", memdvDAO.list());
        return mav;
    }

    @RequestMapping("/memmodify")
    public ModelAndView memmodify() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/memmodify");
        mav.addObject("mem", memDAO.modify_list());
        return mav;
    }

    @RequestMapping("/memmodify/update")
    public String memUpdate(@RequestParam String mem_name, @RequestParam MultipartFile mem_pic, @RequestParam String mem_nick, @RequestParam String mem_pw, @RequestParam String mem_zip, @RequestParam String mem_adr1, @RequestParam String mem_adr2, @RequestParam String mem_birth, HttpServletRequest request) {

        // 프로필 사진 등록
        String profile = "";
        MemDTO memDTO = new MemDTO();
        if (mem_pic != null && !mem_pic.isEmpty()) {
            profile = mem_pic.getOriginalFilename();

            try {
                String path = ResourceUtils.getURL("classpath:static/images/profile").getPath();
                mem_pic.transferTo(new File(path + "/" + profile));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MemDTO mem = memDAO.modify_list();
            profile = mem.getMem_pic();
        }

        memDTO.setMem_name(mem_name);
        memDTO.setMem_pic(profile);
        memDTO.setMem_nick(mem_nick);
        memDTO.setMem_pw(mem_pw);
        memDTO.setMem_zip(mem_zip);
        memDTO.setMem_adr1(mem_adr1);
        memDTO.setMem_adr2(mem_adr2);
        memDTO.setMem_birth(mem_birth);
        memDAO.modify_update(memDTO);

        return "redirect:/mypage/memmodify";
    }






}
