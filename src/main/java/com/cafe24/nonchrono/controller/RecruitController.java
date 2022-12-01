package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.RecruitDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/recruit")
public class RecruitController {


    @Autowired
    private RecruitDAO recruitDAO;


    public RecruitController() {
        System.out.println("-----RecruitController() 객체 생성됨");
    } // RecruitController() end

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String recruit() {
        return "recruit/recruit";
    } // recruit() end

    @RequestMapping("/list")
    @ResponseBody
    public ModelAndView recruitList() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("list", recruitDAO.list());
        mav.setViewName("recruit/recruit");
        return mav;
    } // recruitList() end

} // class end
