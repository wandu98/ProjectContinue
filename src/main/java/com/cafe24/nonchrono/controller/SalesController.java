package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.SalesDAO;
import com.cafe24.nonchrono.dto.RecruitDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

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

    @RequestMapping("/search")
    public ModelAndView search(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String ctg = request.getParameter("ctg");
        String keyword = request.getParameter("keyword");
        SalesDTO salesDTO = new SalesDTO();
        salesDTO.setGm_code(ctg);
        salesDTO.setSs_name(keyword);
//        System.out.println(ctg);
//        System.out.println(keyword);
        List<SalesDTO> allList = new ArrayList<>();
        List<SalesDTO> searchList = new ArrayList<>();
        if (ctg == "ALL") {
            allList = salesDAO.searchAll(keyword);
        } else {
            searchList = salesDAO.searchCategory(salesDTO);
        }
        mav.addObject("allList", allList);
        mav.addObject("searchList", searchList);
        mav.setViewName("sales/sales");
        return mav;
    }




}//class end
