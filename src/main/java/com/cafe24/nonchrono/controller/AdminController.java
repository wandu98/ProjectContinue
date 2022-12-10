package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.NoticeDAO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/admin")
public class AdminController {
    public AdminController() {
        System.out.println("----AdminController() 객체 생성");
    }//NoticeController() end

    @Autowired
    NoticeDAO noticeDAO;

//    @RequestMapping(value = "/adnotice", method = RequestMethod.GET)
//    public String Adnotice() {
//        return "admin/ad_noticeList";
//    }//adnotice() end

    @RequestMapping("/") // 관리자 메인
    public ModelAndView AdminIndex() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/admin_index");
        return mav;
    }//AdminIndex() end

    @RequestMapping(value = "/noticeWrite", method = RequestMethod.GET) // 이동만
    public String Adnotice() {
        return "/admin/noticeWrite";
    } // Adnotice() end

    @RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
    public ModelAndView noticeProc(@ModelAttribute NoticeDTO noticeDTO) {
        ModelAndView mav = new ModelAndView();
        mav.addObject(noticeDAO.ntInsert(noticeDTO));
        mav.setViewName("admin/admin_index");
        return mav;
    } // noticeProc() end
}