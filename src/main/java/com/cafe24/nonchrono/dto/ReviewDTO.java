package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReviewDTO {

    private int rv_num;
    private String mem_id;
    private String rv_content;
    private int rv_star;
    private String rv_filename;
    private int ss_num;
    private String rv_date;
    private int rnum;
    private String ss_name;
}
