package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GameDTO {

    private String gm_code; // 품목 코드
    private String gm_name; // 품목명
    private String gm_level; // 이용 등급
    private String gm_category; // 카테고리
}
