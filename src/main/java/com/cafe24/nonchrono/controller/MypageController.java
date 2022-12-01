package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.MemDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    public MypageController() {
        System.out.println("-----MypageController() 객체 생성됨");
    }

    @Autowired
    MemDAO memDAO;

    @RequestMapping("/mypage")
    public ModelAndView mypage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/mypage");
        return mav;
    }//mypage() end

    @RequestMapping("/wishlist")
    public ModelAndView wishlist() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/wishlist");
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
        return mav;
    }

}
