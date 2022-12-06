package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RecruitInfoDTO {

    private int ri_num; // 모집상세 일련번호
    private String mem_id; // 회원 id
    private int rcrbrd_num; // 게시판 글번호 (부모글)
    private int ri_seat; // 좌석 번호
}
