package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.NoticeDAO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import com.cafe24.nonchrono.dto.PagingDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    NoticeDAO noticeDAO;
    public NoticeController() {
        System.out.println("----NoticeController() 객체 생성");
    }//NoticeController() end


    //회원 리스트 페이지
    @RequestMapping(value = "/noticeList")
    public ModelAndView noticeList() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("noticelist", noticeDAO.noticelist());
        mav.setViewName("/notice/noticeList");
        return mav;
    }//noticeList() end

    //리스트 상세보기
    @RequestMapping(value = "/Detail/{nt_num}")
    public ModelAndView ntdetail(@PathVariable int nt_num, HttpSession session) {
        ModelAndView mav =new ModelAndView();
        String admin_id = (String) session.getAttribute("admin_id");
        mav.addObject("ntUpdate", noticeDAO.ntUpdate(nt_num));
        mav.addObject("ntdetail", noticeDAO.ntdetail(nt_num));
        mav.addObject("admin_id", admin_id);
        mav.setViewName("notice/noticeDetail");
        return mav;
    }//ntdetail() end

    @RequestMapping("/Delete")
    public String ntDelete(@RequestParam int nt_num, HttpSession session) {
        String admin_id = (String) session.getAttribute("admin_id");
        String admin_pw = (String) session.getAttribute("admin_pw");
        System.out.println(admin_id);
        if (admin_id == "admin" && admin_pw == "admin") {
            int cnt = noticeDAO.ntDelete(nt_num);
            if (cnt == 0) {
                System.out.println("삭제에 실패하였습니다!");
            }
            return "redirect:/notice/noticeList";
        } else {
            return "/mem/loginForm";
        }
    } // delete() end



}
