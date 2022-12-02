package com.cafe24.nonchrono.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MemdvController {

    public MemdvController() {
        System.out.println("-----MemdvController() 객체 생성됨");
    }

    @RequestMapping("/memdvForm")
    public ModelAndView memdvForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/memdvForm");
        return mav;
    }
}
