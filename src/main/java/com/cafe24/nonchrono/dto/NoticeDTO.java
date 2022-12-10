package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NoticeDTO {
    private int nt_num; //공지사항일련번호
    private String nt_title; //제목
    private String nt_cmt; //내용
    private String nt_regdate; //작성일
    private int nt_views; //조회수
}
