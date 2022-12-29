package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.*;
import com.cafe24.nonchrono.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

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

    @Autowired
    QuestionDAO questionDAO;

    @Autowired
    ReviewDAO reviewDAO;

    @Autowired
    CouponlistDAO couponlistDAO;

    @Autowired
    RecruitDAO recruitDAO;

    @Autowired
    DetailDAO detailDAO;

    @Autowired
    OrderDAO orderDAO;

    @Autowired
    BasketDAO basketDAO;


    @RequestMapping("/mypage")
    public ModelAndView mypage(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        String path = "";
        Boolean yn;
        try {
            path = ResourceUtils.getURL("classpath:static/images/profile").getPath();
        } catch (Exception e) {
            e.printStackTrace();
        }
        File folder = new File(path + "/" + mem_id);
        if (folder.exists()) {
            yn = true;
            mav.addObject("YN", yn);
        } else {
            yn = false;
            mav.addObject("YN", yn);
        }

        double temp = memDAO.temp(mem_id);

        List<Map<String,Object>> list = recruitDAO.rcrbrdlist(mem_id);
        int rcrbrd_num = 0;

        List<Integer> list2 = new ArrayList<>();
        for (int i=0; i<list.size(); i++) {
            rcrbrd_num = (int) list.get(i).get("rcrbrd_num");
            list2.add(recruitDAO.rcrbrdlistCount(rcrbrd_num));
        }


        if (mem_id != null) {
            mav.addObject("meminfo", memDAO.myList(mem_id));
            mav.addObject("temp", temp);
            mav.addObject("qslist", questionDAO.count(mem_id));
            mav.addObject("revlist", reviewDAO.count(mem_id));
            mav.addObject("recruitlist", recruitDAO.rcrbrdlist(mem_id));
            mav.addObject("rcrbrdlistCount", list2);
            mav.addObject("detailcount", detailDAO.detailCount(mem_id));
            mav.addObject("couponcnt", couponlistDAO.couponCount(mem_id));
            mav.setViewName("mypage/mypage");
        } else {
            mav.setViewName("mem/loginForm");
        }
        return mav;
    }//mypage() end

    @RequestMapping("/wishlist")
    public ModelAndView wishlist(HttpServletRequest req, PagingDTO pagingDTO, HttpSession session) {
        ModelAndView mav = new ModelAndView();

        String mem_id = (String) session.getAttribute("mem_id");
        pagingDTO.setMem_id(mem_id);

        int totalRowCount = wishDAO.totalRowCount(mem_id); //총 글갯수  6 |  52개

        //페이징
        int numPerPage = 5; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
        String pageNum = req.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }//if end

        //현재 보고 있는 페이지
        int currentPage = Integer.parseInt(pageNum); //1  | 1

        //한페이지에 보여지는 행 갯수는 5
        //따라서 1페이지 : rnum 1~5, 2페이지 : 6~10, 3페이지 : 11~15
        //1~5 = (0*5+1)~(1*5), 6~10 = (1*5+1)~(2*5), 11~15 = (2*5+1)~(3*5) 와 같은 규칙이 있음.
        int startRow = (currentPage - 1) * numPerPage + 1; //1  | 1
        int endRow = currentPage * numPerPage; //5
        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);

        //페이지 수
        //행을 페이지마다 5개씩 보여주므로 전체 행을 5로 나눔
        double totcnt = (double) totalRowCount / numPerPage; // 6/5 ->1.2 | 52/5 = 10.4
        //나누어 떨어지지 않으면 한페이지를 더 늘려야 모든 행이 나오므로 totcnt를 올림
        //전체 페이지 수
        int totalPage = (int) Math.ceil(totcnt); //2 | 11


        double d_page = (double) currentPage / pagePerBlock; // 1/10 -> 0.1
        //페이지 묶음 번호
        int Pages = (int) Math.ceil(d_page) - 1; //0  1~10페이지 : 0, 11~20 : 1
        //페이지 묶음의 시작 페이지 번호
        int startPage = Pages * pagePerBlock; //0*10 -> 0
        //페이지 묶음의 마지막 페이지 번호
        int endPage = startPage + pagePerBlock + 1; //0+10+1 = 11

        List list = null;
        if (totalRowCount > 0) {
            list = wishDAO.list(pagingDTO); // 1, 5
        } else {
            list = Collections.EMPTY_LIST;
        }//if end

        int wishcnt = 0;
        if (mem_id != null) {
            wishcnt = wishDAO.idxWishCount(mem_id);
            session.setAttribute("idxWishCount", wishcnt);
            mav.addObject("pageNum", currentPage);
            mav.addObject("count", totalRowCount);
            mav.addObject("totalPage", totalPage);
            mav.addObject("startPage", startPage);
            mav.addObject("endPage", endPage);
            mav.addObject("list", list);
            mav.setViewName("mypage/wishlist");
        } else {
            mav.setViewName("mem/loginForm");
        }
        return mav;
    }

    @RequestMapping("/coupon")
    public ModelAndView coupon(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = session.getAttribute("mem_id").toString();
        mav.addObject("couponlist", couponlistDAO.list(mem_id));
        mav.addObject("point", memDAO.myList(mem_id));
        mav.addObject("mileagelist", couponlistDAO.mileageList(mem_id));
        System.out.println(couponlistDAO.mileageList(mem_id));
        mav.setViewName("mypage/coupon");
        return mav;
    }

    @RequestMapping("/review")
    public ModelAndView review(HttpSession session, PagingDTO pagingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        pagingDTO.setMem_id(mem_id);

        int totalRowCount = reviewDAO.totalRowCount(mem_id);

        //페이징
        int numPerPage = 5; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
        String pageNum = request.getParameter("pageNum");
        if(pageNum==null) {
            pageNum = "1";
        }//if end

        //현재 보고 있는 페이지
        int currentPage = Integer.parseInt(pageNum);

        int startRow = (currentPage-1)*numPerPage+1; //1  | 1
        int endRow = currentPage*numPerPage; //5
        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);

        double totcnt = (double)totalRowCount/numPerPage;
        int totalPage = (int)Math.ceil(totcnt);

        double d_page = (double)currentPage/pagePerBlock; // 1/10 -> 0.1
        //페이지 묶음 번호
        int Pages = (int)Math.ceil(d_page)-1; //0  1~10페이지 : 0, 11~20 : 1
        //페이지 묶음의 시작 페이지 번호
        int startPage = Pages*pagePerBlock; //0*10 -> 0
        //페이지 묶음의 마지막 페이지 번호
        int endPage = startPage + pagePerBlock+1; //0+10+1 = 11

        List list = null;
        if(totalRowCount>0) {
            list = reviewDAO.list(pagingDTO); // 1, 5
        } else {
            list = Collections.EMPTY_LIST;
        }//if end

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("rvlist", list);
        System.out.println(list);
        mav.setViewName("mypage/review");
        return mav;
    }

    @RequestMapping("/memdv")
    public ModelAndView memdv(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = session.getAttribute("mem_id").toString();
        mav.setViewName("mypage/memdv");
        mav.addObject("list", memdvDAO.list(mem_id));
        return mav;
    }

    @RequestMapping("/memmodify")
    public ModelAndView memmodify(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        String path = "";
        Boolean yn;
        try {
            path = ResourceUtils.getURL("classpath:static/images/profile").getPath();
        } catch (Exception e) {
            e.printStackTrace();
        }
        File folder = new File(path + "/" + mem_id);
        if (folder.exists()) {
            yn = true;
            mav.addObject("YN", yn);
        } else {
            yn = false;
            mav.addObject("YN", yn);
        }
        mav.setViewName("mypage/memmodify");
        mav.addObject("mem", memDAO.modify_list(mem_id));
        return mav;
    }

    @RequestMapping("/memmodify/update")
    public String memUpdate(@RequestParam String mem_name, @RequestParam MultipartFile mem_pic, @RequestParam String mem_nick, @RequestParam String mem_pw, @RequestParam String mem_zip, @RequestParam String mem_adr1, @RequestParam String mem_adr2, @RequestParam String mem_birth, HttpServletRequest request, HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        // 프로필 사진 등록
        String profile = "";
        MemDTO memDTO = new MemDTO();
        if (mem_pic != null && !mem_pic.isEmpty()) {
            profile = mem_pic.getOriginalFilename();
            profile.toLowerCase();
            String[] img_name = profile.split("\\.");
            profile = "thumb." + img_name[1];

            try {
                String path = ResourceUtils.getURL("classpath:static/images/profile").getPath();
                File folder = new File(path + "/" + mem_id);
                if (!folder.exists()) {
                    folder.mkdirs();
                }
                mem_pic.transferTo(new File(path + "/" + mem_id + "/" + profile));

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MemDTO mem = memDAO.modify_list(mem_id);
            profile = mem.getMem_pic();
        }

        memDTO.setMem_id(mem_id);
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

    @RequestMapping("/purchaseHistory")
    public ModelAndView purchaseHistory(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        List<OrderDTO> list = orderDAO.purchaseHistoryList(mem_id);
        List list1 = new ArrayList<>();
        System.out.println(list.size());
        for (int i=0; i< list.size(); i++) {
            String od_num = list.get(i).getOd_num();
            list1.add(orderDAO.purchaseHistoryProduct(od_num));
        }
        mav.addObject("historylist", list);
        mav.addObject("historyproduct", list1);
        mav.setViewName("mypage/purchaseHistory");
        return mav;
    }

    @RequestMapping("/cart")
    public ModelAndView cart(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");

        int basketcnt = 0;
        if (mem_id != null) {
            basketcnt = basketDAO.count(mem_id);
            session.setAttribute("idxBasketCount", basketcnt);
            mav.addObject("list", basketDAO.mylist(mem_id));
            mav.addObject("basket_cnt",basketDAO.count(mem_id));
            mav.addObject("bk_total", basketDAO.total(mem_id));
            mav.addObject("max_fee", basketDAO.max_fee(mem_id));
            mav.setViewName("mypage/cart");
        } else {
            mav.setViewName("mem/loginForm");
        }
        return mav;
    }

    @RequestMapping("/wishToBasket")
    public String wishToBasket(HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        List<Map<String,Object>> wishList = wishDAO.noPagingList(mem_id);
        List<Map<String,Object>> basketList = basketDAO.mylist(mem_id);

        for (int i=0; i<basketList.size(); i++) {
            for (int j=0; j<wishList.size(); j++) {
                if (wishList.get(j).get("ss_num")==basketList.get(i).get("ss_num")) {
                    wishList.remove(j);
                }
            }
        }
//        System.out.println(wishList);

        BasketDTO basketDTO = new BasketDTO();
        basketDTO.setMem_id(mem_id);
        basketDTO.setBk_amount(1);
        for (int i=0; i<wishList.size(); i++) {
            basketDTO.setSs_num((Integer) wishList.get(i).get("ss_num"));
            basketDAO.insert(basketDTO);
        }

        wishDAO.allRemove(mem_id);

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


        return "redirect:/sales/checkout";
    }

}
