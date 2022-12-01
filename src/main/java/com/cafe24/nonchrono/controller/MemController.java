package com.cafe24.nonchrono.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/mem")
@Controller
public class MemController {

    public MemController() {
        System.out.println("-----memController() 객체 생성");
    } // memController() end

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm() {
        return "mem/loginForm";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginProc() {
        ModelAndView mav = new ModelAndView();

        return mav;
    }



    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String memsignup() {
        return "mem/signupForm";
    }

} // class end
