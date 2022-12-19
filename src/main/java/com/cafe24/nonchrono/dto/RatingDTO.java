package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RatingDTO {

    private int rt_num; // 평점 일련번호
    private String rt_goodbad; // 좋아요/싫어요
    private String rt_content; // 평점 내용
    private String give_id; //  추천한 회원 아이디
    private String receive_id; //  추천 받은 회원 아이디
    private int rcrbrd_num; // 추천한 모집 게시판 글 번호

}
