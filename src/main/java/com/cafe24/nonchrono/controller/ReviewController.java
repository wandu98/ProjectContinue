package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.ReviewDAO;
import com.cafe24.nonchrono.dto.ReviewDTO;
import com.cafe24.nonchrono.dto.SalesDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping("/delete/{rv_num}")
    public String delete(@PathVariable int rv_num) {
        int cnt = reviewDAO.delete(rv_num);
        if (cnt==0) {
            System.out.println("리뷰 삭제 실패");
        } else {
            System.out.println("리뷰 삭제 성공");
        }
        return "redirect:/mypage/review";
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

    @RequestMapping("/myrv_list/{rv_num}")
    @ResponseBody
    public String rvModify(@PathVariable int rv_num, ReviewDTO reviewDTO) {
        reviewDTO = reviewDAO.myrv_list(rv_num);
        String result = "";
        result += "    <td>\n" +
                "        <input type=\"file\" id=\"rv_filename\" name=\"rv_filename\">\n" +
                "    </td>\n" +
                "    <td class=\"shoping__cart__item\">\n" +
                "        <div class=\"row\"\">\n" +
                "            <textarea rows=\"10\" style=\"width: 90%; float: right\">" + reviewDTO.getRv_content() + "</textarea>\n" +
                "        </div>\n" +
                "    </td>\n" +
                "    <td class=\"shoping__cart__price\">\n" +
                "        <select name=\"rv_star\">\n" +
                "            <option>별점을 선택해주세요</option>\n";
        if (reviewDTO.getRv_star()==10) {
            result +=                 "            <option class=\"star_5 fa\" value=\"10\" selected><span>★★★★★</span></option>\n" +
                    "            <option class=\"star_4\" value=\"8\"><span>★★★★</span></option>\n" +
                    "            <option class=\"star_3\" value=\"6\"><span>★★★</span></option>\n" +
                    "            <option class=\"star_2\" value=\"4\"><span>★★</span></option>\n" +
                    "            <option class=\"star_1\" value=\"2\"><span>★</span></option>\n";
        } else if (reviewDTO.getRv_star()==8) {
            result +=         "            <option class=\"star_5 fa\" value=\"10\"><span>★★★★★</span></option>\n" +
                    "            <option class=\"star_4\" value=\"8\" selected><span>★★★★</span></option>\n" +
                    "            <option class=\"star_3\" value=\"6\"><span>★★★</span></option>\n" +
                    "            <option class=\"star_2\" value=\"4\"><span>★★</span></option>\n" +
                    "            <option class=\"star_1\" value=\"2\"><span>★</span></option>\n";
        } else if (reviewDTO.getRv_star()==6) {
            result +=         "            <option class=\"star_5 fa\" value=\"10\"><span>★★★★★</span></option>\n" +
                    "            <option class=\"star_4\" value=\"8\"><span>★★★★</span></option>\n" +
                    "            <option class=\"star_3\" value=\"6\" selected><span>★★★</span></option>\n" +
                    "            <option class=\"star_2\" value=\"4\"><span>★★</span></option>\n" +
                    "            <option class=\"star_1\" value=\"2\"><span>★</span></option>\n";
        } else if (reviewDTO.getRv_star()==4) {
            result +=         "            <option class=\"star_5 fa\" value=\"10\"><span>★★★★★</span></option>\n" +
                    "            <option class=\"star_4\" value=\"8\"><span>★★★★</span></option>\n" +
                    "            <option class=\"star_3\" value=\"6\"><span>★★★</span></option>\n" +
                    "            <option class=\"star_2\" value=\"4\" selected><span>★★</span></option>\n" +
                    "            <option class=\"star_1\" value=\"2\"><span>★</span></option>\n";
        } else {
            result +=         "            <option class=\"star_5 fa\" value=\"10\"><span>★★★★★</span></option>\n" +
                    "            <option class=\"star_4\" value=\"8\"><span>★★★★</span></option>\n" +
                    "            <option class=\"star_3\" value=\"6\"><span>★★★</span></option>\n" +
                    "            <option class=\"star_2\" value=\"4\"><span>★★</span></option>\n" +
                    "            <option class=\"star_1\" value=\"2\"><span>★</span></option>\n";
        }

        result +=        "        </select>\n" +
                "    </td>\n" +
                "    <td colspan=\"2\" class=\"shoping__cart__item__close\" style=\"text-align: center\">\n" +
                "        <button class=\"site-btn\" onclick=\"rvDelete(${row.rv_num})\">수정</button>\n" +
                "    </td>\n";
        return result;
    }

    @RequestMapping("/modify")
    public String modify(@RequestParam int rv_num, MultipartFile rv_filename, @RequestParam String rv_content, @RequestParam int rv_star, HttpServletRequest request, HttpServletResponse response) {
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
        reviewDTO.setRv_content(rv_content);
        reviewDTO.setRv_filename(rv_img);
        reviewDTO.setRv_star(rv_star);
        reviewDTO.setRv_num(rv_num);
        int cnt = reviewDAO.modify(reviewDTO);
        if (cnt==0) {
            System.out.println("리뷰 수정 실패");
        } else {
            System.out.println("리뷰 수정 성공");
        }
        return "redirect:/mypage/review";
    }

}
