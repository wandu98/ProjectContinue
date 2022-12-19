package com.cafe24.nonchrono.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class OrderdetailDTO {

    private String ss_name;
    private String ss_img;
    private int dt_num;
    private String od_num;
    private int dv_num;
    private String dt_prog;
    private String dt_odstts;
    private char dt_refund;
    private int ss_num;
    private String dt_paymnt;
    private String dt_msg;
    private String od_date;
    private String mem_id;
    private int mem_dvnum;
    private String cp_code;
    private int umileage;
    private int pmileage;
    private int total;
    private int ss_price;
    private int dt_amount;
}
