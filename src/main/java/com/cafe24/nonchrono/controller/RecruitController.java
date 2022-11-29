package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.RecruitDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RecruitController {

    /*
    @Autowired
    private RecruitDAO recruitDAO;
*/

    public RecruitController() {
        System.out.println("-----RecruitController() 객체 생성됨");
    } // RecruitController() end

    @RequestMapping(value = "/recruit", method = RequestMethod.GET)
    public String recruit() {
        return "/recruit/recruit";
    } // recruit() end


} // class end
