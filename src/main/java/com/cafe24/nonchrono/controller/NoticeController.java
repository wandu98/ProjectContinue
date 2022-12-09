package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.NoticeDAO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    NoticeDAO noticeDAO;
    public NoticeController() {
        System.out.println("----NoticeController() 객체 생성");
    }//NoticeController() end


    @RequestMapping(value = "/noticeList", method = RequestMethod.GET)
    public String noticeList() {
        return "/notice/noticeList";
    }//noticeList() end



}
