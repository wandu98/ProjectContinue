package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.NoticeDAO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import com.cafe24.nonchrono.dto.PagingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    public ModelAndView ntdetail(@PathVariable int nt_num) {
        ModelAndView mav =new ModelAndView();
        mav.addObject("ntdetail", noticeDAO.ntdetail(nt_num));
        mav.setViewName("notice/noticeDetail");
        return mav;
    }//ntdetail() end

}
