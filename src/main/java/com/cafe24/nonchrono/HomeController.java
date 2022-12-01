package com.cafe24.nonchrono;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    public HomeController() {
        System.out.println("-----HomeController() 객체 생성");
    } // HomeController() end


    @RequestMapping("/")
    public String Index() {
        return "index";
    }

    @RequestMapping("/admin")
    public String AdminIndex() {
        return "admin/admin_index";
    }

    @RequestMapping("/mypage")
    public String Mypage() { return "mypage/mypage"; }

} // class end
