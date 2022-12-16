package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.ReviewDAO;
import com.cafe24.nonchrono.dto.ReviewDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

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

    @RequestMapping("/rv_list")
    private List<ReviewDTO> rv_list(@RequestParam int ss_num) {
    return reviewDAO.rv_list(ss_num);
    }

    @RequestMapping("/rv_insert")
    private String rv_insert(@RequestParam String rv_content, @RequestParam int rv_star, @RequestParam int ss_num, @RequestParam MultipartFile rv_filename, @RequestParam String rv_date, HttpSession session){
        String mem_id = (String) session.getAttribute("mem_id");
        ReviewDTO reviewDTO = new ReviewDTO();
        String rv_img = "";
        if (rv_filename != null && !rv_filename.isEmpty()) {
            rv_img = rv_filename.getOriginalFilename();

            try {
                String path = ResourceUtils.getURL("classpath:static/images/review").getPath();
                rv_filename.transferTo(new File(path + "/" + rv_img));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        reviewDTO.setMem_id(mem_id);
        reviewDTO.setRv_content(rv_content);
        reviewDTO.setRv_filename(rv_img);
        reviewDTO.setRv_date(rv_date);
        reviewDTO.setSs_num(ss_num);
        reviewDTO.setRv_star(rv_star);
        reviewDAO.rv_insert(reviewDTO);
        return "redirect:/sales/sales";

    }

}
