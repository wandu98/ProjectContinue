package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BasketDTO {

    private int bk_num;
    private int ss_num;
    private int bk_amount;
    private String mem_id;

}
