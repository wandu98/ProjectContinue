package com.cafe24.nonchrono;

import com.cafe24.nonchrono.dao.*;
import com.cafe24.nonchrono.dto.GameDTO;
import com.cafe24.nonchrono.dto.MemDTO;
import com.cafe24.nonchrono.dto.RecruitDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller

public class HomeController {

    public HomeController() {
        System.out.println("-----HomeController() 객체 생성");
    } // HomeController() end

    @Autowired
    private SalesDAO salesDAO;

    @Autowired
    private RecruitDAO recruitDAO;

    @Autowired
    private WishDAO wishDAO;

    @Autowired
    private BasketDAO basketDAO;

    @Autowired
    private MinigameDAO minigameDAO;

    @Autowired
    private MemDAO memDAO;

    @RequestMapping("/") // 메인
    public ModelAndView Index(HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        String sl_id = (String) session.getAttribute("sl_id");
        String admin_id = (String) session.getAttribute("admin_id");
        ModelAndView mav = new ModelAndView();

        int wishcnt = 0;
        int basketcnt = 0;
        if (mem_id != null) {
            wishcnt = wishDAO.idxWishCount(mem_id);
            basketcnt = basketDAO.count(mem_id);
            session.setAttribute("idxWishCount", wishcnt);
            session.setAttribute("idxBasketCount", basketcnt);
        } else {
            session.setAttribute("idxWishCount", wishcnt);
            session.setAttribute("idxBasketCount", basketcnt);
        }

        List<RecruitDTO> list = recruitDAO.idxrcrbrd();
        List list2 = new ArrayList<>();
        for (int i=0; i< list.size(); i++) {
            int rcrbrd_num = list.get(i).getRcrbrd_num();
            list2.add(recruitDAO.idxrcrbrdCount(rcrbrd_num));
        }

        mav.addObject("idxLatestProduct", salesDAO.idxLatestProduct());
        mav.addObject("idxTopProduct", salesDAO.idxTopProduct());
        mav.addObject("idxReviewProduct", salesDAO.idxReviewProduct());
        mav.addObject("idxFeaturedProduct", salesDAO.idxFeaturedProduct());
        mav.addObject("idxRankingSales", salesDAO.idxRankingSales());
        mav.addObject("idxrcrbrdCount", list2);
        mav.addObject("idxrcrbrd", list);
        mav.setViewName("index");
        return mav;
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
            result += " <li>" + (i+1) + ". " + list.get(i).getGm_name() + "</li>";

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
            result += " <li>" + (i+1) + ". " + list.get(i).getGm_name() + "</li>";

        }
        result += "</ol>";
        return result;
    }

    @RequestMapping("/renewal")
    @ResponseBody
    public List<Integer> renewal(HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        int wishcnt = 0;
        int basketcnt = 0;
        if (mem_id != null) {
            wishcnt = wishDAO.idxWishCount(mem_id);
            basketcnt = basketDAO.count(mem_id);
            session.setAttribute("idxWishCount", wishcnt);
            session.setAttribute("idxBasketCount", basketcnt);
        } else {
            session.setAttribute("idxWishCount", wishcnt);
            session.setAttribute("idxBasketCount", basketcnt);
        }
        List<Integer> list = new ArrayList<>();
        list.add(wishcnt);
        list.add(basketcnt);
        return list;
    }

    @RequestMapping("/minigame")
    @ResponseBody
    public void minigame(HttpSession session, ServletContext context) {
        String mem_id = (String) session.getAttribute("mem_id");
        MemDTO memDTO = memDAO.myList(mem_id);
        int upoint = memDTO.getUpoint();
        int apoint = memDTO.getApoint();
        upoint += 100;
        apoint += 100;
        memDTO.setUpoint(upoint);
        memDTO.setApoint(apoint);
        memDTO.setMem_id(mem_id);

        int cnt = minigameDAO.getPoint(memDTO);
        if (cnt==0) {
            System.out.println("미니게임 포인트 추가 실패");
        } else {
            System.out.println("미니게임 포인트 추가 성공");
        }
    }

} // class end
