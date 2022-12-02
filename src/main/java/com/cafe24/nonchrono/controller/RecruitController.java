package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.RecruitDAO;
import com.cafe24.nonchrono.dto.RecruitDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/recruit")
public class RecruitController {


    @Autowired
    private RecruitDAO recruitDAO;


    public RecruitController() {
        System.out.println("-----RecruitController() 객체 생성됨");
    } // RecruitController() end

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView recruitList() {
        RecruitDTO dto = new RecruitDTO();
        ModelAndView mav = new ModelAndView();
        mav.addObject("list", recruitDAO.list());
        mav.addObject("game", recruitDAO.game());
        mav.setViewName("/recruit/recruit");
        return mav;
    } // recruitList() end

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String recruitForm() {
        return "/recruit/recruitForm";
    } // recruitForm() end


} // class end