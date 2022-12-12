package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderDTO {

    private String od_num;
    private String od_date;
    private String mem_id;
    private int dv_num;
    private int mem_dvnum;
    private String cp_code;
    private int umileage;
    private int pmileage;
    private int total;

}
