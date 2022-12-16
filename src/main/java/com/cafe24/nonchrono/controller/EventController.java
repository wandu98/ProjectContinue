package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.EventDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/event")
public class EventController {

    @Autowired
    private EventDAO eventDAO;

    public EventController() {
        System.out.println("-------EventController() 객체 생성");
    }//EventController() end

    //이벤트 게시판
    @RequestMapping(value = "/event", method = RequestMethod.GET)// 어떤 값으로 어떻게 받을지
    public String event() {
        return "event/event";
    }//event() end
}
