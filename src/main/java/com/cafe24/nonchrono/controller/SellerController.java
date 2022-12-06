package com.cafe24.nonchrono.controller;


import com.cafe24.nonchrono.dao.RecruitDAO;
import com.cafe24.nonchrono.dao.SellerDAO;
import com.cafe24.nonchrono.dto.RecruitDTO;
import com.cafe24.nonchrono.dto.SellerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;


@Controller
@RequestMapping("/seller")
public class SellerController {

    public SellerController() {
        System.out.println("-----SellerController() 객체 생성됨");
    }

    @Autowired
    SellerDAO sellerDAO;

    //판매자 메인
    @RequestMapping("/seller")
    public ModelAndView seller() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/seller");
        return mav;
    }//seller() end

    //판매자가 판매하는 리스트 현황
    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/list");
        return mav;
    }// list() end

    //상품등록
    @RequestMapping("/write")
    public ModelAndView write() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/write");
        return mav;
    }// write() end

    //전체주문조회
    @RequestMapping("/order")
    public ModelAndView order() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/order");
        return mav;
    }// order() end

    //배송정책
    @RequestMapping("/delivery")
    public ModelAndView delivery() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/delivery");
        return mav;
    }// delivery() end

    ///후기관리
    @RequestMapping("/review")
    public ModelAndView review() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/review");
        return mav;
    }//review() end

    //1:1문의
    @RequestMapping("/one_sentence")
    public ModelAndView one_sentence() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("seller/one_sentence");
        return mav;
    }//one_sentence() end

    @RequestMapping("/searchProc")
    @ResponseBody
    public String search(HttpServletRequest req) {
        String keyword = req.getParameter("gs_keyword").trim();
        String message = ""; // 응답 메세지


        // 검색어가 존재할 때
        if (keyword.length() > 0) {
            ArrayList<String> list = searchList(keyword);
            ArrayList<String> list2 = new ArrayList<String>();

            SellerDTO dto = new SellerDTO();


            int size = list.size();
            if (size > 0) {

                // 타이틀 제목을 message에 담기
                message += size + "|";
                for (int i = 0; i < size; i++) {
                    String title = list.get(i);
                    message += title;
                    // System.out.println(recruitDAO.gm_list2(title));
                    list2.add(sellerDAO.gm_list2(title));
                    System.out.println(list2.get(i));
                    if (i < size - 1) {
                        message += ",";
                    } // if end
                } // for end

                // 구분
                message += "|";

                // 타이틀 코드를 message에 담기
                for (int j = 0; j < size; j++) {
                    String code = list2.get(j);
                    System.out.println("code : " + code);
                    message += code;
                    if (j < size - 1) {
                        message += ",";
                    } // if end
                } // for end

            } // if end
        } // if end

        return message;
    } // searchProc() end

    // 상품등록 검색 리스트
    public ArrayList<String> searchList(String keyword) {
        // 검색하고자 하는 게임 타이틀 목록
        ArrayList<String> list2 = new ArrayList<String>();
        for (int i = 0; i < sellerDAO.gm_list().size(); i++) {
            // 게임 타이틀 목록 중 검색어가 포함된 게임 타이틀을 list2에 추가
            list2.add(sellerDAO.gm_list().get(i).getGm_name());
        } // for end


        String[] keywords = list2.toArray(new String[list2.size()]);

        ArrayList<String> list = new ArrayList<String>();
        for (String word : keywords) {
            word = word.toUpperCase();
            if (word.contains(keyword.toUpperCase())) {
                list.add(word);
            } // if end
        } // for end
        return list;
    } // searchList() end

}//class end
