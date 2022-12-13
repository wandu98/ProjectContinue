package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.BasketDAO;
import com.cafe24.nonchrono.dao.SalesDAO;
import com.cafe24.nonchrono.dto.BasketDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class BasketController {
    
    public BasketController() {
        System.out.println("-----BasketController() 객체 생성됨");
    }

    @Autowired
    BasketDAO basketDAO;

    @RequestMapping("/delete")
    public String delete(@RequestParam int bk_num) {
        basketDAO.delete(bk_num);
        return "mypage/cart";
    }

    @RequestMapping("/allClear")
    public void allClear(HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        basketDAO.allClear(mem_id);
    }

    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    public void insert(HttpSession session, HttpServletRequest request) {
        String mem_id = (String) session.getAttribute("mem_id");
        int ss_num = Integer.parseInt(request.getParameter("ss_num"));
        int bk_amount = Integer.parseInt(request.getParameter("bk_amount"));
//        System.out.println(mem_id);
//        System.out.println(ss_num);
//        System.out.println(bk_amount);
        BasketDTO basketDTO = new BasketDTO();
        basketDTO.setMem_id(mem_id);
        basketDTO.setBk_amount(bk_amount);
        basketDTO.setSs_num(ss_num);
        basketDAO.insert(basketDTO);
    }


}
