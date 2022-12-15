package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.DeliveryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

    public DeliveryController() {
        System.out.println("-----DeliveryController() 객체 생성됨");
    }

    @Autowired
    DeliveryDAO deliveryDAO;

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(HttpServletRequest request) {
        String[] dv_num = request.getParameter("dv_num").split(",");
        for (String i : dv_num) {
            int dvnum = Integer.parseInt(i);
            deliveryDAO.delete(dvnum);
        }
        return "redirect:/seller/delivery";
    }
}
