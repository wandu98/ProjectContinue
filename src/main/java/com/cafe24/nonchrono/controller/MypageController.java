package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.MypageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    public MypageController () {
        System.out.println("-----MypageController() 객체 생성됨");
    }

    @Autowired
    MypageDAO mypageDAO;

    @RequestMapping("/")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/mypage");
        mav.addObject("list", mypageDAO.list());
        return mav;
  }//list() end

}
