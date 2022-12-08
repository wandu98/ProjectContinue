package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.NoticeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/notice")
@Controller
public class NoticeController {
    public NoticeController() {
        System.out.println("----NoticeController() 객체 생성");
    }//NoticeController() end

    @Autowired
    private NoticeDAO noticeDAO;

    @RequestMapping(value = "/notice", method = RequestMethod.GET)
    public String notice() {
        return "notice/notice";
    }//notice() end
}
