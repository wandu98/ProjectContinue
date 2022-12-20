package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PagingDTO {

    private int startRow;
    private int endRow;
    private String mem_id;
    private String ss_name;
    private String gm_code;
    private String sl_id;
    private String dt_prog;
    private String ss_speriod;
    private String ss_eperiod;
    private String inputState;
    private String keyword;
    private String order;
}
