package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.MemDAO;
import com.cafe24.nonchrono.dto.MemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RequestMapping("/mem")
@Controller
public class MemController {

    public MemController() {
        System.out.println("-----memController() 객체 생성");
    } // memController() end

    @Autowired //dao 의 데이터를 자동으로 연결, 주입
    private MemDAO memDAO;

    @RequestMapping(value = "/login", method = RequestMethod.GET)// 어떤 값으로 어떻게 받을지
    public String loginForm() {
        return "mem/loginForm";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)//정보를 가지고 로그인폼
    public ModelAndView loginProc(@ModelAttribute MemDTO dto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
        String id = dto.getMem_id();
        // System.out.println(id);
        String pw = dto.getMem_pw();
        // System.out.println(pw);
        ModelAndView mav = new ModelAndView();
        String grade = memDAO.login(id, pw);

        if (grade != null) {
            mav.setViewName("redirect:/");
            session.setAttribute("mem_id", id);//세션에 값 저장. "" 내용에 id를 저장
            session.setAttribute("mem_pw", pw);
            System.out.println("세션에 저장된 아이디 : " + session.getAttribute("mem_id"));
            System.out.println("세션에 저장된 비밀번호 : " + session.getAttribute("mem_pw"));
        } else {
            mav.setViewName("/mem/loginalert");
            req.setAttribute("msg", "아이디와 비번이 일치하지 않습니다");
        }//if end

        return mav;
    }//loginProc() end

    //회원가입 폼 -> db -> sql ->

//    @RequestMapping(value = "/signup", method = RequestMethod.POST)
//    public ModelAndView memList(@ModelAttribute MemDTO dto) {
//        ModelAndView mav =new ModelAndView();
//        mav.addObject("insert", memDAO.meminsert(dto));
//        mav.setViewName("/mem");
//        return mav;
//    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String memsignup() {
        return "mem/signupForm";
    }

} // class end
