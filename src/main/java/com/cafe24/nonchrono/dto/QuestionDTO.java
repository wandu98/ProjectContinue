package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class QuestionDTO {

    private int qs_num;
    private String mem_id;
    private String qs_content;
    private String qs_date;
    private String qs_category;

}
