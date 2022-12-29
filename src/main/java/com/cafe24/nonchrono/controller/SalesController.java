package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.BasketDAO;
import com.cafe24.nonchrono.dao.CouponlistDAO;
import com.cafe24.nonchrono.dao.OrderDAO;
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
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/sales")
public class SalesController {

    @Autowired
    private SalesDAO salesDAO;

    @Autowired
    private BasketDAO basketDAO;

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private CouponlistDAO couponlistDAO;

    public SalesController() {
        System.out.println("-----SalesController() 객체 생성");
    }

    //상품 메인
    @RequestMapping("/sales")
    public ModelAndView list(HttpServletRequest req, PagingDTO pagingDTO, String order, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        mav.setViewName("sales/sales");

        int totalRowCount = salesDAO.totalRowCount(); //총 글갯수  6 |  52개
        // System.out.println("총 글갯수 : " + totalRowCount);
        //페이징
        int numPerPage = 6; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        // 선택 안 했을 때 order에 기본값 ss_num
        System.out.println("order : " + order);
        if (order == null || order.equals("null") || order.equals("")) {
            String order2 = "ss_num";
            order = order2;
        }
        // ajax로 값 바꾸고 넘어갔을 때 해당 값을 받아서 order에 넣어줌
        String order3 = req.getParameter("order3");
        if (order3 != null && !order3.equals("")) {
            order = order3;
        }

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
        String pageNum = req.getParameter("pageNum");

        if (pageNum == null) {
            pageNum = "1";
        }//if end

        //현재 보고 있는 페이지
        int currentPage = Integer.parseInt(pageNum); //1  | 1

        //한페이지에 보여지는 행 갯수는 6
        int startRow = (currentPage - 1) * numPerPage + 1; //1  | 1
        int endRow = currentPage * numPerPage; //5

        pagingDTO.setStartRow(startRow);
        pagingDTO.setEndRow(endRow);
        pagingDTO.setOrder(order);

        //페이지 수
        double totcnt = (double) totalRowCount / numPerPage;
        //전체 페이지 수
        int totalPage = (int) Math.ceil(totcnt);

        double d_page = (double) currentPage / pagePerBlock; // 1/10 -> 0.1
        //페이지 묶음 번호
        int Pages = (int) Math.ceil(d_page) - 1; //0  1~10페이지 : 0, 11~20 : 1
        //페이지 묶음의 시작 페이지 번호
        int startPage = Pages * pagePerBlock; //0*10 -> 0
        //페이지 묶음의 마지막 페이지 번호
        int endPage = startPage + pagePerBlock + 1; //0+10+1 = 11


//        System.out.println("시작 row : " + pagingDTO.getStartRow());
//        System.out.println("끝 row : " + pagingDTO.getEndRow());
//        System.out.println("순서 정렬 : " + pagingDTO.getOrder());

        List list = new ArrayList();
        if (totalRowCount > 0) {
            list = salesDAO.list3(pagingDTO); // 1, 5
            mav.addObject("list3", list);
        } //if end

        mav.addObject("totalRowCount", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("list", salesDAO.list());
        mav.addObject("order", order);
        mav.addObject("idxTopProduct", salesDAO.idxTopProduct());
        mav.addObject("sold_out", salesDAO.sold_out());
        mav.addObject("last_search", salesDAO.last_seach());
        mav.addObject("top_keyword", salesDAO.top_keyword());
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
        mav.addObject("idxTopProduct", salesDAO.idxTopProduct());

        mav.setViewName("sales/detail");
        return mav;
    }// detail() end

    @RequestMapping("/search")
    public ModelAndView search(HttpServletRequest request, PagingDTO pagingDTO, SalesDTO salesDTO, SearchDTO searchDTO, String order) {
        ModelAndView mav = new ModelAndView();
        String ctg = request.getParameter("ctg");
        String keyword = request.getParameter("keyword");
        System.out.println("keyword: " + keyword);
        String where = request.getParameter("sc_where");
        String pageNum = request.getParameter("pageNum");
//        System.out.println(ctg);
//        System.out.println(keyword);
        salesDTO.setGm_code(ctg);
        salesDTO.setSs_name(keyword);
        searchDTO.setSc_word(keyword);
        searchDTO.setSc_where(where);
        if (pageNum == null) {
            salesDAO.search(searchDTO);
        }
        pagingDTO.setGm_code(ctg);
        pagingDTO.setSs_name(keyword);


        System.out.println("order : " + order);
        if (order == null || order.equals("null") || order.equals("")) {
            String order2 = "ss_num";
            order = order2;

        String order3 = request.getParameter("order3");
        if (order3 != null && !order3.equals("")) {
            order = order3;
        }

        }
        System.out.println("order :" + order);
        int totalRowCount = 0; //총 글갯수  6 |  52개
        if (ctg.equals("ALL")) {
            totalRowCount = salesDAO.searchAlltotalRowCount(keyword);
        } else {
            totalRowCount = salesDAO.searchCategorytotalRowCount(salesDTO);
        }

//        System.out.println(totalRowCount);

        //페이징
        int numPerPage = 6; //한 페이지당 레코드 갯수
        int pagePerBlock = 10; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌

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
        pagingDTO.setOrder(order);
//        System.out.println(pagingDTO);
//        System.out.println(totalRowCount);
//        System.out.println(ctg);
        List list = null;
        if (totalRowCount > 0) {
            if (ctg.equals("ALL")) {
                list = salesDAO.searchAllList(pagingDTO); // 1, 5
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
        mav.addObject("order", order);
        mav.addObject("list", list);
        mav.addObject("idxTopProduct", salesDAO.idxTopProduct());
        mav.addObject("sold_out", salesDAO.sold_out());
        mav.addObject("last_search", salesDAO.last_seach());
        mav.addObject("top_keyword", salesDAO.top_keyword());
        mav.setViewName("sales/searchSales");
        return mav;
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        mav.addObject("list", basketDAO.mylist(mem_id));
        mav.addObject("bk_total", basketDAO.total(mem_id));

        // 배송비 조회
        int dv_fee = 0;
        List<Map<String, Integer>> delivery = basketDAO.dv_sum(mem_id);
        for (int i = 0; i < delivery.size(); i++) {
            dv_fee += Integer.parseInt(String.valueOf(delivery.get(i).get("dv_sum")));
        }

        mav.addObject("max_fee", dv_fee);
        mav.addObject("dv_mem_info", salesDAO.dv_mem_info(mem_id));
        mav.addObject("dvmem_info", salesDAO.dvmem_info(mem_id));
        mav.addObject("couponList", couponlistDAO.list(mem_id));
        mav.addObject("basket_cnt", basketDAO.count(mem_id));
        mav.addObject("mileage", salesDAO.mileage(mem_id));
        mav.setViewName("sales/checkout");
        return mav;
    }

    @RequestMapping("checkoutdelete")
    public String checkoutdelete(@RequestParam int bk_num) {
        basketDAO.delete(bk_num);
        return "/sales/checkout";
    }

    @RequestMapping("/pay")
    public String pay(HttpSession session, @ModelAttribute MemdvDTO memdvDTO, @ModelAttribute OrderDTO orderDTO, @ModelAttribute BasketDTO basketDTO, @ModelAttribute DetailDTO detailDTO, @RequestParam(required = false) String pay_method, @RequestParam int totalPay) {
        CouponlistDTO couponlistDTO = new CouponlistDTO();
        String mem_id = (String) session.getAttribute("mem_id");
        if (memdvDTO.getMem_dvnum() == 0) {
            // 별칭으로 검색해서 있는지 확인
            int count = salesDAO.memdv_count(memdvDTO);
            System.out.println("count : " + count);

            if (count == 0) {
                // 없으면 구매자 배송정책 추가
                int cnt = salesDAO.memdv_insert(memdvDTO);
                if (cnt == 0) {
                    System.out.println("배송정책 추가 실패");
                } else {
                    System.out.println("배송정책 추가 성공");
                }
                // 추가된 구매자 배송정책의 번호 가져오기
                int max_dvnum = salesDAO.max_dvnum(memdvDTO.getMem_id());
                // 주문서에 구매자 배송정책 번호 추가
                orderDTO.setMem_dvnum(max_dvnum);
                System.out.println("추가된 배송정책 번호 : " + max_dvnum);
            } else {
                // 있으면 구매자 배송정책 번호를 주문서에 추가
                int dvnum = salesDAO.memdv_search(memdvDTO);
                orderDTO.setMem_dvnum(dvnum);
                System.out.println("dv_num : " + orderDTO.getMem_dvnum());
            }
        } else {
            // 구매자 배송정책 번호를 주문서에 추가
            orderDTO.setMem_dvnum(memdvDTO.getMem_dvnum());
            System.out.println("dv_num : " + orderDTO.getMem_dvnum());
        }

        // 배송비 조회
        int dv_fee = 0;
        List<Map<String, Integer>> delivery = basketDAO.dv_sum(mem_id);
        for (int i = 0; i < delivery.size(); i++) {
            dv_fee += Integer.parseInt(String.valueOf(delivery.get(i).get("dv_sum")));
        }
        System.out.println("dv_fee : " + dv_fee);


        // 총액 가져오기
//        int total = basketDAO.total(mem_id);
        int total = totalPay;

        // 장바구니의 상품 총액 조회 (10만원 이상시 배송비 무료)
        if (total > 100000) {
            dv_fee = 0;
        }
        System.out.println("total : " + total);

        // 추가될 마일리지 가져오기 (총액 기준)
        int pmileage = (int) (total * 0.01);

        // 장바구니에 있는 내용 조회
        List<Map<String, Object>> list = basketDAO.mylist(mem_id);
        System.out.println("list : " + list);

        // od_num 로직
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar calendar = Calendar.getInstance();
        String today = sdf.format(calendar.getTime());
        String last = "";
        // System.out.println("today : " + today);
        String od_num = basketDAO.od_num(today);
        if (od_num != null) {
            last = String.format("%03d", Integer.parseInt(od_num.substring(od_num.length() - 3)) + 1);
        } else {
            last = String.format("%03d", 1);
        }
        od_num = today + "-" + last;
        System.out.println("od_num : " + od_num);

        // 쿠폰명 변수화
        String cp_name = orderDTO.getCp_code();

        // 사용한 마일리지 변수화
        int umileage = orderDTO.getUmileage();


        // 주문서 추가
        orderDTO.setOd_num(od_num);
        orderDTO.setMem_id(mem_id);
        orderDTO.setMem_dvnum(orderDTO.getMem_dvnum());
        orderDTO.setCp_code(cp_name);
        orderDTO.setUmileage(umileage);
        orderDTO.setPmileage(pmileage);
        orderDTO.setTotal(total);
        int cnt = salesDAO.order(orderDTO);
        if (cnt == 0) {
            System.out.println("주문서 추가 실패");
        } else {
            System.out.println("주문서 추가 성공");
        }

        // 주소 별칭 중복 안 되게 유효성 검사

        // 주문상세 추가
        for (int i = 0; i < list.size(); i++) {
            int ss_num = Integer.parseInt(String.valueOf(list.get(i).get("ss_num")));
            int amount = Integer.parseInt(String.valueOf(list.get(i).get("bk_amount")));
            detailDTO.setOd_num(od_num); // 주문서 번호
            detailDTO.setDv_num(basketDAO.dv_num(ss_num)); // 배송정책
            detailDTO.setDt_prog("결제완료"); // 진행상태
            detailDTO.setDt_odstts("없음"); // 주문상태
            detailDTO.setDt_refund('Y'); // 환불가능여부
            detailDTO.setSs_num(ss_num); // 판매상품 번호
            detailDTO.setDt_paymnt("card"); // 결제수단
            detailDTO.setDt_amount(amount); // 구매수량

            cnt = basketDAO.order_detail(detailDTO);
            if (cnt == 0) {
                System.out.println("주문상세 추가 실패");
            } else {
                System.out.println("주문상세 추가 성공");
            }
        }

        // 장바구니 비우기
        cnt = basketDAO.basket_delete(mem_id);
        if (cnt == 0) {
            System.out.println("장바구니 비우기 실패");
        } else {
            System.out.println("장바구니 비우기 성공");
        }

        // 쿠폰 딜리트
        // 쿠폰은 1개까지밖에 가질 수 없다.
        couponlistDTO.setCp_code(cp_name);
        couponlistDTO.setMem_id(mem_id);
        if (!cp_name.equals("A0000")) {
            cnt = basketDAO.coupon_delete(couponlistDTO);

            if (cnt == 0) {
                System.out.println("쿠폰 삭제 실패");
            } else {
                System.out.println("쿠폰 삭제 성공");
            }
        }

        // 사용 마일리지 삭감
        if (umileage != 0) {
            cnt = basketDAO.usemileage(mem_id, umileage);
            if (cnt == 0) {
                System.out.println("사용 마일리지 삭감 실패");
            } else {
                System.out.println("사용 마일리지 삭감 성공");
            }
        }

        // 추가 마일리지 적립

        // 재고 삭감
        for (int i = 0; i < list.size(); i++) {
            int ss_num = Integer.parseInt(String.valueOf(list.get(i).get("ss_num")));
            int bk_amount = Integer.parseInt(String.valueOf(list.get(i).get("bk_amount")));
            cnt = basketDAO.stock(ss_num, bk_amount);
            if (cnt == 0) {
                System.out.println("재고 삭감 실패");
            } else {
                System.out.println("재고 삭감 성공");
            }
        }
        int mem_dvnum = orderDTO.getMem_dvnum();
        return "redirect:/sales/salesorder/" + od_num + "&" + mem_dvnum;
    }

    //주문서 상세
    @RequestMapping("/salesorder/{od_num}&{mem_dvnum}")
    public ModelAndView salesorder(@PathVariable String od_num, @PathVariable int mem_dvnum, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = session.getAttribute("mem_id").toString();
        if (mem_id != null && !mem_id.equals("guest")) {
            mav.addObject("orderlist", salesDAO.orderlist(od_num));
            mav.addObject("orderadr", salesDAO.orderadr(mem_dvnum));
            mav.addObject("dvmsg", orderDAO.dvmsg(od_num));
            mav.addObject("total", orderDAO.total(od_num));
            mav.addObject("maxdt_fee", orderDAO.maxdt_fee(od_num));
            mav.addObject("dt_coupon", orderDAO.dt_coupon(od_num));
            mav.addObject("umileage", orderDAO.umileage(od_num));
            mav.setViewName("/sales/salesorder");

        } else {
            mav.setViewName("/mem/loginForm");
        }


        return mav;
    }


    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public List<SalesDTO> ajax_list(PagingDTO pagingDTO, HttpServletRequest req, @RequestParam String order, String keyword) {


        // System.out.println(order);
        String order2 = "ss_num";
        if (order == null || order.equals("null") || order.equals("")) {
            order = order2;
//             System.out.println("order : " + order);
        }
        // System.out.println("ajax order : " + order);
        int totalRowCount = salesDAO.totalRowCount(); //총 글갯수  6 |  52개
        //System.out.println(totalRowCount);
        //페이징
        int numPerPage = 6; //한 페이지당 레코드 갯수
        int pagePerBlock = 12; //페이지 리스트

        //처음 list로 이동 시 pageNum은 null이다. 따라서 if문에 의해 pageNum이 1이 된다.
        //페이지 이동할때 list.do?pageNum= 로 pageNum값을 넘겨줌
//        System.out.println("req.pageNum :" + req.getParameter("pageNum"));
        String pageNum = req.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
//            System.out.println("if pageNum : " + pageNum);
        }//if end
//        System.out.println("pageNum : " + pageNum);
        //현재 보고 있는 페이지
        int currentPage = Integer.parseInt(pageNum); //1  | 1

        //한페이지에 보여지는 행 갯수는 5
        //따라서 1페이지 : rnum 1~5, 2페이지 : 6~10, 3페이지 : 11~15
        //1~5 = (0*5+1)~(1*5), 6~10 = (1*5+1)~(2*5), 11~15 = (2*5+1)~(3*5) 와 같은 규칙이 있음.
        int startRow = (currentPage - 1) * numPerPage + 1; //1  | 1
        int endRow = currentPage * numPerPage; //5

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
        pagingDTO.setOrder(order);
//        System.out.println(order);
        pagingDTO.setKeyword(keyword);
        // System.out.println(keyword);
        // System.out.println(startRow);
        // System.out.println(endRow);
        // System.out.println("pagingDTO : " + pagingDTO);
        List list = null;
        if (totalRowCount > 0) {
            list = salesDAO.list3(pagingDTO); // 1, 6
            System.out.println("list : " + list);
        } else {
            list = Collections.EMPTY_LIST;
            System.out.println("list 없음");
        }//if end

        return list;

    }




}//class end
