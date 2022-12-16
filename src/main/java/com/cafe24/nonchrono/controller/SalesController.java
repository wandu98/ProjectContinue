package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.BasketDAO;
import com.cafe24.nonchrono.dao.CouponlistDAO;
import com.cafe24.nonchrono.dao.SalesDAO;
import com.cafe24.nonchrono.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sales")
public class SalesController {

    @Autowired
    private SalesDAO salesDAO;

    @Autowired
    private BasketDAO basketDAO;

    @Autowired
    private CouponlistDAO couponlistDAO;

    public SalesController() {
        System.out.println("-----SalesController() 객체 생성");
    }


    //상품 메인
    @RequestMapping("/sales")
    public ModelAndView list(HttpServletRequest req, PagingDTO pagingDTO) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("sales/sales");

        int totalRowCount = salesDAO.totalRowCount(); //총 글갯수  6 |  52개
        //System.out.println(totalRowCount);
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
        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);

        List list = null;
        if (totalRowCount > 0) {
            list = salesDAO.list3(pagingDTO); // 1, 5
        } else {
            list = Collections.EMPTY_LIST;
        }//if end
        mav.addObject("list", salesDAO.list());
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("list3", list);
        return mav;
    } // sales() end

    //상품 상세
    @RequestMapping("/detail/{ss_num}")
    public ModelAndView salesDetail(@PathVariable int ss_num) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("detail", salesDAO.detail(ss_num)); //상품 상세보기
        mav.addObject("gameDetail", salesDAO.gameDetail(ss_num)); // 게임정보 상세
        mav.addObject("reviewCount", salesDAO.reviewCount(ss_num)); // 리뷰 갯수
        mav.addObject("reviewDetail", salesDAO.reviewDetail(ss_num)); //리뷰 상세
        mav.addObject("deliveryDetail", salesDAO.deliveryDetail(ss_num));// 배송비 가져오기

        mav.setViewName("sales/detail");
        return mav;
    }// detail() end

    @RequestMapping("/search")
    public ModelAndView search(HttpServletRequest request, PagingDTO pagingDTO, SalesDTO salesDTO) {
        ModelAndView mav = new ModelAndView();
        String ctg = request.getParameter("ctg");
        String keyword = request.getParameter("keyword");
//        System.out.println(ctg);
//        System.out.println(keyword);
        salesDTO.setGm_code(ctg);
        salesDTO.setSs_name(keyword);
        pagingDTO.setGm_code(ctg);
        pagingDTO.setSs_name(keyword);

        int totalRowCount = 0; //총 글갯수  6 |  52개
        if (ctg.equals("ALL")) {
            totalRowCount = salesDAO.searchAlltotalRowCount(keyword);
        } else {
            totalRowCount = salesDAO.searchCategorytotalRowCount(salesDTO);
        }

//        System.out.println(totalRowCount);

        //페이징
        int numPerPage = 9; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
        String pageNum = request.getParameter("pageNum");
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
        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);
//        System.out.println(pagingDTO);
        System.out.println(totalRowCount);
        System.out.println(ctg);
        List list = null;
        if (totalRowCount > 0) {
            if (ctg.equals("ALL")) {
                list = salesDAO.searchAlllist(pagingDTO); // 1, 5
            } else {
                list = salesDAO.searchCategorylist(pagingDTO);
            }
        } else {
            list = Collections.EMPTY_LIST;
        }//if end

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("ctg", ctg);
        mav.addObject("keyword", keyword);
        mav.addObject("list", list);
        mav.setViewName("sales/searchSales");
        return mav;
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        mav.addObject("list", basketDAO.mylist(mem_id));
        mav.addObject("bk_total", basketDAO.bk_total(mem_id));
        mav.addObject("max_fee", basketDAO.max_fee(mem_id));
        mav.addObject("dv_mem_info", salesDAO.dv_mem_info(mem_id));
        mav.addObject("dvmem_info", salesDAO.dvmem_info(mem_id));
        mav.addObject("couponList", couponlistDAO.list(mem_id));
        mav.addObject("mileage", salesDAO.mileage(mem_id));
        mav.setViewName("sales/checkout");
        return mav;
    }

    @RequestMapping("checkoutdelete")
    public String checkoutdelete(@RequestParam int bk_num) {
        basketDAO.delete(bk_num);
        return "/sales/checkout";
    }

    //주문인서트
    /*@RequestMapping("/orderinsert")
    public String orderinsert(@RequestParam String od_date, @RequestParam int dv_num, @RequestParam int mem_dvnum, @RequestParam String cp_code, @RequestParam int umileage, @RequestParam int pmileage, @RequestParam int total, HttpSession session) {
    String mem_id = (String) session.getAttribute("mem_id");
    OrderDTO orderDTO = new OrderDTO();
    MemdvDTO memdvDTO = new MemdvDTO();

    if (mem_dvnum == 0) {
        salesDAO.memdv_insert(memdvDTO); // 배송정책 추가
        int max = salesDAO.max_dvnum(mem_dvnum); // 추가된 배송정책의 번호 가져오기
        System.out.println(max);
        orderDTO.setMem_dvnum(max);
    }
    orderDTO.setMem_dvnum(mem_dvnum);
    orderDTO.setMem_id(mem_id);
    orderDTO.setOd_date(od_date);
    orderDTO.setDv_num(dv_num);
    orderDTO.setCp_code(cp_code);
    orderDTO.setUmileage(umileage);
    orderDTO.setPmileage(pmileage);
    orderDTO.setTotal(total);
    salesDAO.order_insert(orderDTO);
    return "redirect:sales/salesorder";
    }//ordercheck() end*/


    //주문서
    /*@RequestMapping("/salesorder")
    public ModelAndView salesorder(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        mav.setViewName("sales/salesorder");
        return mav;
    }*/

    // 천우 작품
    /*@RequestMapping("/pay")
    public void pay(HttpSession session, @ModelAttribute MemdvDTO memdvDTO, @ModelAttribute OrderDTO orderDTO, @ModelAttribute BasketDTO basketDTO) {

        String mem_id = (String) session.getAttribute("mem_id");
        if (memdvDTO.getMem_dvnum() == 0) {
            // 별칭으로 검색해서 있는지 확인
            int count = salesDAO.memdv_count(memdvDTO);
            System.out.println("count : "+ count);

            if (count == 0) {
                // 없으면 배송정책 추가
                int cnt = salesDAO.memdv_insert(memdvDTO);
                if (cnt == 0) {
                    System.out.println("배송정책 추가 실패");
                } else {
                    System.out.println("배송정책 추가 성공");
                }
                // 추가된 배송정책의 번호 가져오기
                int max_dvnum = salesDAO.max_dvnum(memdvDTO.getMem_id());
                // 주문서에 배송정책 번호 추가
                orderDTO.setMem_dvnum(max_dvnum);
                System.out.println("추가된 배송정책 번호 : " + max_dvnum);
            } else {
                // 있으면 배송정책 번호를 주문서에 추가
                int dvnum = salesDAO.memdv_search(memdvDTO);
                orderDTO.setMem_dvnum(dvnum);
                System.out.println("dv_num : " + orderDTO.getMem_dvnum());
            }
        } else {
            // 배송정책 번호를 주문서에 추가
            orderDTO.setMem_dvnum(memdvDTO.getMem_dvnum());
            System.out.println("dv_num : " + orderDTO.getMem_dvnum());
        }

        // 배송비 조회
        int dv_fee = basketDAO.max_fee(mem_id);
        System.out.println("dv_fee : " + dv_fee);

        // 장바구니의 상품 총액 조회 (10만원 이상시 배송비 무료)
        int bk_total = basketDAO.bk_total(mem_id);
        if (bk_total > 100000) {
            dv_fee = 0;
        }
        System.out.println(bk_total);

        // 장바구니에 있는 내용 조회
        List<BasketDTO> list = basketDAO.basketList(mem_id);
        System.out.println("list : " + list);

        // 주문서 추가

        System.out.println("od_num : " + orderDTO.getOd_num()); // null
        System.out.println("od_date : " + orderDTO.getOd_date()); // 현재 날짜 가져옴
        System.out.println("mem_id : " + orderDTO.getMem_id()); // 제대로 가져옴
        System.out.println("dv_num : " + orderDTO.getDv_num()); // 0 제대로 못 가져옴
        System.out.println("mem_dvnum : " + orderDTO.getMem_dvnum()); // 0 제대로 못 가져옴
        System.out.println("cp_code : " + orderDTO.getCp_code()); // A0000 제대로 가져옴
        System.out.println("umileage : " + orderDTO.getUmileage()); // 0 제대로 못 가져옴
        System.out.println("pmileage : " + orderDTO.getPmileage()); // 0 제대로 못 가져옴
        System.out.println("total : " + orderDTO.getTotal()); // 74800 제대로 못 가져옴

        // 닉네임 중복 안 되게 유효성 검사
        
        // 주문상세 추가
        
        // 장바구니 비우기

        // 쿠폰 딜리트

        // 마일리지 삭감

        // 재고 삭감

            *//*int cnt = basketDAO.newAddress(memdvDTO);
            if (cnt != 0) {
                System.out.println("주소 추가 성공");
                // int dv_num = basketDAO.max_dvnum(mem_id);
                if (cnt != 0) {
                    // 쿠폰 delete도 해야함
                    // od_num, od_date, dv_num, mem_dvnum, mem_id, cp_code, umileage, pmileage, total
                    System.out.println("주소 넘버 성공");
//                    orderDTO.getOd_num();
//                    orderDTO.getOd_date();
//                    orderDTO.getDv_num(dv_num);
//                    orderDTO.getMem_dvnum();
//                    orderDTO.getMem_id(mem_id);
//                    orderDTO.getCp_code();
//                    orderDTO.getUmileage();
//                    orderDTO.getPmileage();
//                    orderDTO.getTotal();
//                    cnt = basketDAO.order(orderDTO);
                }
            }*//*

        *//*return "/sales/salesorder";*//*
    }*/


}//class end
