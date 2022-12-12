package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.BasketDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public void delete(@RequestParam int bk_num) {
        basketDAO.delete(bk_num);
    }

    @RequestMapping("/allClear")
    public void allClear(HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        basketDAO.allClear(mem_id);
    }
}
