package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.SalesDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sales")
public class SalesController {

    public SalesController() {System.out.println("-----SalesController() 객체 생성"); }

    @Autowired
    SalesDAO salesDAO;

    //상품 메인
    @RequestMapping("/sales")
    public ModelAndView sales() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("sales/sales");
        return mav;
    } // sales() end

    //상품 상세
    @RequestMapping("/detail")
    public ModelAndView detail() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("sales/detail");
        return mav;
    }// detail() end




}//class end
