package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.AdminDAO;
import com.cafe24.nonchrono.dao.NoticeDAO;
import com.cafe24.nonchrono.dto.GameDTO;
import com.cafe24.nonchrono.dto.MemDTO;
import com.cafe24.nonchrono.dto.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    public AdminController() {
        System.out.println("----AdminController() 객체 생성");
    }//NoticeController() end

    @Autowired
    private NoticeDAO noticeDAO;

    @Autowired
    private AdminDAO adminDAO;

    @RequestMapping("") // 관리자 메인
    public ModelAndView AdminIndex() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("sales", adminDAO.sales_day());
        mav.setViewName("/admin/admin_index");
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/admin/loginForm";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginProc(HttpSession session) {
        session.setAttribute("admin_id", "admin");
        session.setAttribute("admin_pw", "admin");
        return "/admin/admin_index";
    }

    @RequestMapping(value = "/noticeWrite", method = RequestMethod.GET) // 이동만
    public String Adnotice() {
        return "/admin/noticeWrite";
    } // Adnotice() end

    @RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
    public ModelAndView noticeProc(@ModelAttribute NoticeDTO noticeDTO) {
        ModelAndView mav = new ModelAndView();
        mav.addObject(noticeDAO.ntInsert(noticeDTO));
        mav.setViewName("redirect:/notice/noticeList");
        return mav;
    } // noticeProc() end

    @RequestMapping("/sales_day")
    @ResponseBody
    public int sales_day() {
        return adminDAO.sales_day();
    }

    @RequestMapping("/sales_month")
    @ResponseBody
    public int sales_month() {
        return adminDAO.sales_month();
    }

    @RequestMapping("/sales_year")
    @ResponseBody
    public int sales_year() {
        return adminDAO.sales_year();
    }

    @RequestMapping(value = "/gameWrite", method = RequestMethod.GET)
    public String gameWriteForm() {
        return "/admin/gameWrite";
    }

    @RequestMapping(value = "/gameWrite", method = RequestMethod.POST)
    public String gameWrite(@RequestParam String gm_code, @RequestParam String gm_name, @RequestParam int gm_price, @RequestParam String gm_level, @RequestParam String gm_category, @RequestParam MultipartFile gm_img, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext application = req.getSession().getServletContext();
        // 저장할 경로
        String path = ResourceUtils.getURL("classpath:static/images/thumb/").getPath();
        String fileName = "thumb.jpg";
        GameDTO gameDTO = new GameDTO();
        String gameCode = "";


        if (gm_img != null && !gm_img.isEmpty()) {
            // 코드 값을 통해 해당 코드의 번호가 가장 최신(높은) 값 가져오기
            String typeName = adminDAO.typeName(gm_code);
            // 앞 2자리 코드 번호를 제거
            typeName = typeName.substring(2, typeName.length());
            // 문자열을 숫자화하고 다음 번호를 만들어줘야하니 +1
            int typeNum = Integer.parseInt(typeName) + 1;
            // 숫자를 가져와서 4자리가 되도록 왼쪽에 0을 채움
            String typeNum2 = String.format("%04d", typeNum);
            // gm_code와 typeNum2를 합치면 진짜 게임 코드가 된다 ex) dt0001
            gameCode = gm_code + typeNum2;
            path += gameCode + "/";
            // 파일명 가져오기 + 소문자화
            // fileName = gm_img.getOriginalFilename();
            // fileName = fileName.toLowerCase();

            String sDirPath = path + fileName;
            File folder = new File(path);
            if (!folder.exists()) {
                try {
                    folder.mkdirs();// 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
            gm_img.transferTo(new File(sDirPath));

            // System.out.println("sDirPath : " + sDirPath);
            // System.out.println("path : " + path);
        } else {
            fileName = "";
        }

        gameDTO.setGm_name(gm_name);
        gameDTO.setGm_code(gameCode);
        gameDTO.setGm_category(gm_category);
        gameDTO.setGm_img(fileName);
        gameDTO.setGm_level(gm_level);
        gameDTO.setGm_price(gm_price);
        int cnt = adminDAO.gameInsert(gameDTO);
        if (cnt == 0) {
            System.out.println("품목 등록 실패하였습니다");
        }
        return "redirect:/admin";
    } // gameWrite() end

    @RequestMapping(value = "/gameList", method = RequestMethod.GET)
    public ModelAndView gameList() {
        ModelAndView mav = new ModelAndView();
        String type = "mn";
        mav.addObject("gameList", adminDAO.gameList(type));
        mav.setViewName("/admin/gameList");
        return mav;
    }

    @RequestMapping(value = "/gameList", method = RequestMethod.POST)
    @ResponseBody
    public List<GameDTO> gameListAjax(String type) {
        List<GameDTO> list = new ArrayList<>();
        list = adminDAO.gameList(type);
        return list;
    }

}