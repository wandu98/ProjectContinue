package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RoleSeatDTO {

    private int rs_num; // 역할 배정 일련번호
    private String rl_name; // 역할 이름
    private int rcrbrd_num; // 모집 게시판 글 번호
    private int rs_seat; // 역할 배정 좌석

}
