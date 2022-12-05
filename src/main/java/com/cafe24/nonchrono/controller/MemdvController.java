package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.MemdvDAO;
import com.cafe24.nonchrono.dto.MemdvDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MemdvController {

    public MemdvController() {
        System.out.println("-----MemdvController() 객체 생성됨");
    }

    @Autowired
    MemdvDAO memdvDAO;

    @RequestMapping("/memdvForm")
    public ModelAndView memdvForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/memdvForm");
        return mav;
    }

    @RequestMapping("/memdvForm/insert")
    public String insert(@RequestParam String mem_dvnick, @RequestParam String mem_dvinfo, @RequestParam String mem_dvzip, @RequestParam String mem_dvadr1, @RequestParam String mem_dvadr2, @RequestParam String mem_dvphone) {
        MemdvDTO memdvDTO = new MemdvDTO();
//        memdvDTO.setMem_id(mem_id);    로그인 작업 완료 후
        memdvDTO.setMem_dvnick(mem_dvnick);
        memdvDTO.setMem_dvinfo(mem_dvinfo);
        memdvDTO.setMem_dvzip(mem_dvzip);
        memdvDTO.setMem_dvadr1(mem_dvadr1);
        memdvDTO.setMem_dvadr2(mem_dvadr2);
        memdvDTO.setMem_dvphone(mem_dvphone);
        memdvDAO.insert(memdvDTO);
        return "redirect:/mypage/memdv";
    }
}
