package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class WishDTO {

    private int ws_num;         // 위시리시트번호
    private String mem_id;      // 회원ID
    private String gm_code;     // 품목코드

}
