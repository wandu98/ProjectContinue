package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RoleDTO {

    private int rl_num; // 역할 일련번호
    private String rl_name; // 역할 이름
    private String mem_id; // 회원 id
    private String gm_code; // 품목 코드
    private int rcrbrd_num; // 모집 게시판 글 번호
}
