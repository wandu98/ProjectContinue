package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.AdminDAO;
import com.cafe24.nonchrono.dao.NoticeDAO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    public AdminController() {
        System.out.println("----AdminController() 객체 생성");
    }//NoticeController() end

    @Autowired
    private NoticeDAO noticeDAO;

    @Autowired
    private AdminDAO adminDAO;

    @RequestMapping("") // 관리자 메인
    public ModelAndView AdminIndex() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("sales", adminDAO.sales_day());
        mav.setViewName("/admin/admin_index");
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/admin/loginForm";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginProc(HttpSession session) {
        session.setAttribute("admin_id", "admin");
        session.setAttribute("admin_pw", "admin");
        return "/admin/admin_index";
    }

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

    @RequestMapping("/sales_day")
    @ResponseBody
    public int sales_day() {
        return adminDAO.sales_day();
    }

    @RequestMapping("/sales_month")
    @ResponseBody
    public int sales_month() {
        return adminDAO.sales_month();
    }

    @RequestMapping("/sales_year")
    @ResponseBody
    public int sales_year() {
        return adminDAO.sales_year();
    }

}