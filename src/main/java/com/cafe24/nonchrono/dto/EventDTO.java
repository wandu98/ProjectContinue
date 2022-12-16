package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class EventDTO {
    private int evt_num; //게시번호
    private String evt_title;  //제목
    private String evt_start; //이벤트시작일
    private String evt_end;     //이벤트종료일
    private int evt_views;   //조회수
    private String evt_desc;     //이벤트설명
    private String evt_regdate; //작성일
}
