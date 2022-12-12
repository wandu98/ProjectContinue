package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.ReviewDAO;
import com.cafe24.nonchrono.dto.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/review")
public class ReviewController {
    
    public ReviewController() {
        System.out.println("-----ReviewController() 객체 생성됨");
    }

    @Autowired
    ReviewDAO reviewDAO;

    @RequestMapping("/delete")
    public void delete(@RequestParam int rv_num) {
        reviewDAO.delete(rv_num);
    }

}
