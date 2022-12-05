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

    @RequestMapping("/mypage") // 마이페이지
    public String Mypage() { return "mypage/mypage"; }

    @RequestMapping("/seller") // 판매자 페이지
    public String Seller() { return "seller/seller"; }

    @RequestMapping("/sales") // 상품 페이지
    public String Sales() { return "sales/sales"; }

    @RequestMapping("/recruit") // 모집페이지
    public String Recruit() { return "recruit/recruit"; }

} // class end
