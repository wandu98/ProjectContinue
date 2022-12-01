package com.cafe24.nonchrono;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    public HomeController() {
        System.out.println("-----HomeController() 객체 생성");
    } // HomeController() end


    @RequestMapping("/") // 메인
    public String Index() {
        return "index";
    }

    @RequestMapping("/admin") // 관리자 메인
    public String AdminIndex() {
        return "admin/admin_index";
    }

    @RequestMapping("/seller") //마켓 메인
    public String Seller() {return "sales/seller";}

    @RequestMapping("/write") // 마켓 등록
    public String Write() {return "sales/write";}

    @RequestMapping("/list") // 마켓 목록
    public String List() {return "sales/list";}
    
    @RequestMapping("/mypage") // 마이페이지
    public String Mypage() { return "mypage/mypage"; }

} // class end
