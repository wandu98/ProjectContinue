package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.SalesDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SalesController {



    @Autowired
    private SalesDAO salesDAO;

    public SalesController() {
        System.out.println("-----SalesController() 객체 생성됨");
    } // SalesController() end

    @RequestMapping(value = "/sales", method = RequestMethod.GET)
    public String sales() {return "/sales/sales";
    } // sales() end

    @RequestMapping(value = "/sales/detail", method = RequestMethod.GET)
    public String detial() {return "/sales/detail";
    }// detail() end

}//class end
