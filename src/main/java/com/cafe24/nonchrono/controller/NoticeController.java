package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.NoticeDAO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import com.cafe24.nonchrono.dto.PagingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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


    @RequestMapping(value = "/noticeList", method = RequestMethod.GET)
    public String noticeList() {
        return "/notice/noticeList";
    }//noticeList() end

    /*@RequestMapping("/noticeList")
    public ModelAndView ntlist(HttpServletRequest req, NoticeDTO noticeDTO) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/noticeWrite");
        return mav;
    }*/

    @RequestMapping(value = "/noticeList", method = RequestMethod.POST) // 이동만
    public String ntlist() {
        return "notice/noticeList";
    }

    /*@RequestMapping("/noticelist")
    public ModelAndView ntlist(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("notice/noticeList");
        return mav;
    }// list() end*/
}
