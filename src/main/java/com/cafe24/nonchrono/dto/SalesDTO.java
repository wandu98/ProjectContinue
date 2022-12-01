package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SalesDTO {

    private int ss_num;         //판매 상품 번호
    private String gm_code;     //품목코드
    private String sl_id;       //판매자ID
    private String ss_name;     //상품이름
    private int ss_price;       //판매가
    private String ss_speriod;  //판매시작일
    private String ss_eperiod;  //판매종료일
    private int ss_stock;       //재고수량
    private String ss_img;      //대표 이미지명
    private String ss_status;   //판매상태
    private String ss_description; //상세설명
    private int dv_num;         //배송정책번호
}










