package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SellerDTO {

        private String sl_id;     //판매자ID
        private String sl_pw;     //판매자PW
        private String sl_name;   //사업자명
        private String sl_adr1;   //주소1
        private String sl_adr2;   //주소2
        private String sl_phone;  //연락처
        private String sl_brith;  //생년월일
        private String sl_grade;  //회원등급
        private String sl_receive;//수신여부
        private String sl_number; //사업자번호
        private String sl_bank;   //계좌번호
        private int sl_bankcode;  //은행코드

}
