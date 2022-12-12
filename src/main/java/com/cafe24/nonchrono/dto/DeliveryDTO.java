package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class DeliveryDTO {
    private int dv_num;
    private String sl_id;
    private String dv_how;
    private String  dv_courier;
    private int dv_fee;
    private int dv_extrafee;
    private String dv_adr1;
    private String dv_adr2;
    private int dv_rffee;
    private int dv_exfee;
    private String dv_exadr1;
    private String dv_exadr2;
}
