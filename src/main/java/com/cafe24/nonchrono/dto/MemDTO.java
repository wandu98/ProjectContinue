package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemDTO {

    private String mem_id;  //회원ID
    private String mem_pw;     //회원PW
    private String mem_nick;   //닉네임
    private String mem_name; //이름
    private String mem_zip;    //우편번호
    private String mem_adr1;   //주소1
    private String mem_adr2;   //주소2
    private String mem_phone;   //연락처
    private String mem_birth;  //생년월일
    private String mem_grade; //회원등급
    private int upoint; //가용적립금
    private int apoint; //누적적립금
    private String mem_receive; //수신여부
    private int good; //좋아요
    private int buyer_bad; //누적횟수신고
    private String mem_pic;         // 프로필사진
    private String mem_joindate;    // 가입일

}