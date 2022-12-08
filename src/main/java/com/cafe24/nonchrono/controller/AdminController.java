package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.NoticeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/admin")
@Controller
public class AdminController {
    public AdminController() {
        System.out.println("----AdminController() 객체 생성");
    }//NoticeController() end

    @Autowired
    private NoticeDAO noticeDAO;

    @RequestMapping(value = "/adnotice", method = RequestMethod.GET)
    public String adnotice() {
        return "admin/ad_noticeList";
    }//notice() end
}