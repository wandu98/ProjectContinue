package com.cafe24.nonchrono.crawling;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CrawlingDTO {

    private String gm_code; // 품목 코드
    private String gm_name; // 품목명
    private int gm_price; // 가격
    private String gm_level; // 이용등급
    private String gm_category; // 카테고리

} // class end
