package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CouponDTO {

    private String cp_code;
    private String cp_name;
    private String cp_speriod;
    private String cp_eperiod;
    private int cp_percent;

}
