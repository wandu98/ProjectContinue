package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.MemDAO;
import com.cafe24.nonchrono.dao.MemdvDAO;
import com.cafe24.nonchrono.dao.WishDAO;
import com.cafe24.nonchrono.dto.MemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    public MypageController() {
        System.out.println("-----MypageController() 객체 생성됨");
    }

    @Autowired
    MemDAO memDAO;

    @Autowired
    WishDAO wishDAO;

    @Autowired
    MemdvDAO memdvDAO;

    @RequestMapping("/mypage")
    public ModelAndView mypage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/mypage");
        return mav;
    }//mypage() end

    @RequestMapping("/wishlist")
    public ModelAndView wishlist() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/wishlist");
        mav.addObject("list", wishDAO.list());
        return mav;
    }

    @RequestMapping("/coupon")
    public ModelAndView coupon() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/coupon");
        return mav;
    }

    @RequestMapping("/review")
    public ModelAndView review() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/review");
        return mav;
    }

    @RequestMapping("/memdv")
    public ModelAndView memdv() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/memdv");
        mav.addObject("list", memdvDAO.list());
        return mav;
    }

    @RequestMapping("/memmodify")
    public ModelAndView memmodify() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/memmodify");
        mav.addObject("mem", memDAO.modify_list());
        return mav;
    }

    @RequestMapping("/memmodify/update")
    public String memUpdate(@RequestParam String mem_name, @RequestParam MultipartFile mem_pic, @RequestParam String mem_nick, @RequestParam String mem_pw, @RequestParam String mem_zip, @RequestParam String mem_adr1, @RequestParam String mem_adr2, @RequestParam String mem_birth, HttpServletRequest request) {

        // 프로필 사진 등록
        String profile = "";
        MemDTO memDTO = new MemDTO();
        if (mem_pic != null && !mem_pic.isEmpty()) {
            profile = mem_pic.getOriginalFilename();

            try {
                String path = ResourceUtils.getURL("classpath:static/images/profile").getPath();
                mem_pic.transferTo(new File(path + "/" + profile));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MemDTO mem = memDAO.modify_list();
            profile = mem.getMem_pic();
        }

        memDTO.setMem_name(mem_name);
        memDTO.setMem_pic(profile);
        memDTO.setMem_nick(mem_nick);
        memDTO.setMem_pw(mem_pw);
        memDTO.setMem_zip(mem_zip);
        memDTO.setMem_adr1(mem_adr1);
        memDTO.setMem_adr2(mem_adr2);
        memDTO.setMem_birth(mem_birth);
        memDAO.modify_update(memDTO);

        return "redirect:/mypage/memmodify";
    }



}
