package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.SellerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/seller")
public class SellerController {

    public SellerController() {System.out.println("-----SellerController() 객체 생성됨"); }

    @Autowired
    SellerDAO sellerDAO;

    @RequestMapping("/seller")
    public ModelAndView seller() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/seller");
        return mav;
    }//seller() end

    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/list");
        return mav;
    }// list() end

    @RequestMapping("/write")
    public ModelAndView write() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/write");
        return mav;
    }// write() end

    @RequestMapping("/order")
    public ModelAndView order() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/order");
        return mav;
    }// order() end

    @RequestMapping("/delivery")
    public ModelAndView delivery() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/delivery");
        return mav;
    }// delivery() end

    @RequestMapping("/review")
    public ModelAndView review() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/review");
        return mav;
    }//review() end

    @RequestMapping("/one_sentence")
    public ModelAndView one_sentence() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/one_sentence");
        return mav;
    }//one_sentence() end

}//class end
