package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.EventDAO;
import com.cafe24.nonchrono.dto.EventDTO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/event")
public class EventController {

    @Autowired
    private EventDAO eventDAO;

    public EventController() {
        System.out.println("-------EventController() 객체 생성");
    }//EventController() end

    //이벤트 게시판
    @RequestMapping(value = "/event")
    public ModelAndView eventlist() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("eventlist", eventDAO.eventlist());
        mav.setViewName("/event/event");
        return mav;
    }//eventlist() end

    //리스트 상세보기 및 조회수
    @RequestMapping(value = "/Detail/{evt_num}")
    public ModelAndView evtdetail(@PathVariable int evt_num, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String admin_id = (String) session.getAttribute("admin_id");
        mav.addObject("evtviews", eventDAO.evtviews(evt_num));
        mav.addObject("evtdetail", eventDAO.evtdetail(evt_num));
        mav.addObject("admin_id", admin_id);
        mav.setViewName("event/eventDetail");
        return mav;
    }//evtdetail() end

    //삭제
    @RequestMapping("/Delete")
    public String evtdelete(@RequestParam int evt_num, HttpSession session) {
        String admin_id = (String) session.getAttribute("admin_id");
        String admin_pw = (String) session.getAttribute("admin_pw");
        if (admin_id == "admin" && admin_pw == "admin") {
            int cnt = eventDAO.evtdelete(evt_num);
            if (cnt == 0) {
                System.out.println("삭제에 실패하였습니다!");
            }
            return "redirect:/event/event";
        } else {
            return "redirect:/";
        }
    } //evtdelete() end

    @RequestMapping("/Update")
    public ModelAndView evtUpdate(@RequestParam int evt_num, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String admin_id = (String) session.getAttribute("admin_id");
        mav.addObject("evtdetail", eventDAO.evtdetail(evt_num));
        mav.addObject("admin_id", admin_id);
        mav.setViewName("/event/eventUpdate");
        return mav;
    } // update() end

    @RequestMapping("/evtUpdateProc")
    public String evtUpdateProc(@ModelAttribute EventDTO eventDTO){
     // System.out.println(eventDTO.getEvt_desc());
        int cnt = eventDAO.evtUpdate(eventDTO);
        return "redirect:/event/event";
    }
}
