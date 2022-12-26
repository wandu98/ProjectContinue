package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.BasketDAO;
import com.cafe24.nonchrono.dao.SalesDAO;
import com.cafe24.nonchrono.dao.WishDAO;
import com.cafe24.nonchrono.dto.BasketDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class BasketController {
    
    public BasketController() {
        System.out.println("-----BasketController() 객체 생성됨");
    }

    @Autowired
    private BasketDAO basketDAO;

    @Autowired
    private WishDAO wishDAO;

    @RequestMapping("/delete")
    public String delete(@RequestParam int bk_num, HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        basketDAO.delete(bk_num);

        int basketcnt = 0;
        if (mem_id != null) {
            basketcnt = basketDAO.count(mem_id);
            session.setAttribute("idxBasketCount", basketcnt);
        } else {
            session.setAttribute("idxBasketCount", basketcnt);
        }

        return "redirect:/mypage/cart";
    }

    @RequestMapping("/allClear")
    public String allClear(HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        basketDAO.allClear(mem_id);

        int basketcnt = 0;
        if (mem_id != null) {
            basketcnt = basketDAO.count(mem_id);
            session.setAttribute("idxBasketCount", basketcnt);
        } else {
            session.setAttribute("idxBasketCount", basketcnt);
        }
        return "redirect:/mypage/cart";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    @ResponseBody
    public void insert(HttpSession session, HttpServletRequest request) {
        String mem_id = (String) session.getAttribute("mem_id");
        int ss_num = Integer.parseInt(request.getParameter("ss_num"));
        int bk_amount = Integer.parseInt(request.getParameter("bk_amount"));
        System.out.println(mem_id);
        System.out.println(ss_num);
        System.out.println(bk_amount);
        BasketDTO basketDTO = new BasketDTO();
        basketDTO.setMem_id(mem_id);
        basketDTO.setBk_amount(bk_amount);
        basketDTO.setSs_num(ss_num);
        basketDAO.insert(basketDTO);

        int basketcnt = 0;
        if (mem_id != null) {
            basketcnt = basketDAO.count(mem_id);
            session.setAttribute("idxBasketCount", basketcnt);
        } else {
            session.setAttribute("idxBasketCount", basketcnt);
        }
    }

    @RequestMapping("/idxinsert")
    @ResponseBody
    public void idxinsert(HttpSession session, HttpServletRequest request, BasketDTO basketDTO) {
        String mem_id = (String) session.getAttribute("mem_id");
        int ss_num = Integer.parseInt(request.getParameter("ss_num"));
        int bk_amount = 1;
        basketDTO.setMem_id(mem_id);
        basketDTO.setSs_num(ss_num);
        basketDTO.setBk_amount(bk_amount);
        basketDAO.insert(basketDTO);
    }


}
