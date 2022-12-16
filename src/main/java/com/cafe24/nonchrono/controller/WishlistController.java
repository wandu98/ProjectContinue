package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.WishDAO;
import com.cafe24.nonchrono.dto.WishDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {
    
    public WishlistController() {
        System.out.println("-----WishlistController() 객체 생성됨");
    }

    @Autowired
    WishDAO wishDAO;

    @RequestMapping("/allRemove")
    public String allRemove(HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        wishDAO.allRemove(mem_id);
        int wishcnt = 0;
        if (mem_id != null) {
            wishcnt = wishDAO.idxWishCount(mem_id);
            session.setAttribute("idxBasketCount", wishcnt);
        } else {
            session.setAttribute("idxBasketCount", wishcnt);
        }
        return "redirect:/mypage/wishlist";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam int ws_num, HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        wishDAO.delete(ws_num);
        int wishcnt = 0;
        if (mem_id != null) {
            wishcnt = wishDAO.idxWishCount(mem_id);
            session.setAttribute("idxBasketCount", wishcnt);
        } else {
            session.setAttribute("idxBasketCount", wishcnt);
        }
        return "redirect:/mypage/wishlist";
    }

    @RequestMapping("/insert")
    public void insert(HttpServletRequest request, HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        int ss_num = Integer.parseInt(request.getParameter("ss_num"));
        WishDTO wishDTO = new WishDTO();
        wishDTO.setMem_id(mem_id);
        wishDTO.setSs_num(ss_num);
        wishDAO.insert(wishDTO);
    }




}
