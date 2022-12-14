package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.BasketDAO;
import com.cafe24.nonchrono.dao.SalesDAO;
import com.cafe24.nonchrono.dto.PagingDTO;
import com.cafe24.nonchrono.dto.RecruitDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
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
    SalesDAO salesDAO;

    @Autowired
    BasketDAO basketDAO;

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
        mav.addObject("list",salesDAO.list());
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("list4", list);
        return mav;
    } // sales() end

    //상품 상세
    @RequestMapping("/detail/{ss_num}")
    public ModelAndView salesDetail(@PathVariable int ss_num)  {
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
    public ModelAndView search(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String ctg = request.getParameter("ctg");
        String keyword = request.getParameter("keyword");
        SalesDTO salesDTO = new SalesDTO();
        salesDTO.setGm_code(ctg);
        salesDTO.setSs_name(keyword);
//        System.out.println(ctg);
//        System.out.println(keyword);
        List<SalesDTO> allList = new ArrayList<>();
        List<SalesDTO> searchList = new ArrayList<>();
        if (ctg == "ALL") {
            allList = salesDAO.searchAll(keyword);
        } else {
            searchList = salesDAO.searchCategory(salesDTO);
        }
        mav.addObject("allList", allList);
        mav.addObject("searchList", searchList);
        mav.setViewName("sales/sales");
        return mav;
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String mem_id = (String) session.getAttribute("mem_id");
        mav.addObject("list", basketDAO.mylist(mem_id));
        mav.addObject("bk_total", basketDAO.bk_total(mem_id));
        mav.addObject("max_fee", basketDAO.max_fee(mem_id));
        mav.addObject("dv_mem_info",salesDAO.dv_mem_info(mem_id));
        mav.addObject("dvmem_info", salesDAO.dvmem_info(mem_id));
        mav.setViewName("sales/checkout");
        return mav;
    }

    @RequestMapping("checkoutdelete")
    public String checkoutdelete(@RequestParam int bk_num) {
        basketDAO.delete(bk_num);
        return "/sales/checkout";
    }


}//class end
