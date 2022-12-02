package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RecruitDTO {

    private int rcrbrd_num; // 게시판 글번호
    private String mem_id; // 회원 id
    private String rcrbrd_subject; // 글제목
    private String rcrbrd_content; // 글내용
    private String rcrbrd_pw; // 게시판 pw
    private int rcrbrd_views; // 조회수
    private String rcrbrd_date; // 작성일
    private String rcrbrd_edate; // 모집 종료일
    private String rcrbrd_ip; // ip
    private String gm_code; // 품목 코드
    private String rcrbrd_status; // 모집 진행상태
    private String rcrbrd_adr; // 모집 지역
    private int rcrbrd_max; // 모집 인원
}
