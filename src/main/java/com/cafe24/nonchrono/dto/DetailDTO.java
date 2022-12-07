package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DetailDTO {

    private int dt_num;
    private String od_num;
    private int dv_num;
    private String dt_prog;
    private String dt_odstts;
    private char dt_refund;
    private int ss_num;
    private String dt_paymnt;
    private String dt_msg;

}
