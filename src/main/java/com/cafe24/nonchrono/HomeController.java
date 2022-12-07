package com.cafe24.nonchrono;

import com.cafe24.nonchrono.dao.RecruitDAO;
import com.cafe24.nonchrono.dao.SalesDAO;
import com.cafe24.nonchrono.dto.GameDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class HomeController {

    public HomeController() {
        System.out.println("-----HomeController() 객체 생성");
    } // HomeController() end

    @Autowired
    SalesDAO salesDAO;

    @Autowired
    RecruitDAO recruitDAO;

    @RequestMapping("/") // 메인
    public ModelAndView Index() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("idxLatestProduct", salesDAO.idxLatestProduct());
        mav.addObject("idxTopProduct", salesDAO.idxTopProduct());
        mav.addObject("idxReviewProduct", salesDAO.idxReviewProduct());
        mav.addObject("idxFeaturedProduct", salesDAO.idxFeaturedProduct());
        mav.addObject("idxRankingSales", salesDAO.idxRankingSales());
        mav.setViewName("index");
        return mav;
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


    @ResponseBody
    @RequestMapping(value = "rankingSales.do", method = RequestMethod.GET)
    public String rankingSales(HttpServletRequest request, HttpServletResponse response) {
        List<GameDTO> list = salesDAO.idxRankingSales();
//        System.out.println(list.get(0).getGm_name());
        String result = "";
        result += "<ol>";
        for (int i=0; i<list.size(); i++) {
            result += " <li>" + list.get(i).getGm_name() + "</li>";

        }
        result += "</ol>";
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "rankingRecruit.do", method = RequestMethod.GET)
    public String rankingRecruit() {
        List<GameDTO> list = recruitDAO.idxRankingRecruit();
        String result = "";
        result += "<ol>";
        for (int i=0; i<list.size(); i++) {
            result += " <li>" + list.get(i).getGm_name() + "</li>";

        }
        result += "</ol>";
        return result;
    }

} // class end
