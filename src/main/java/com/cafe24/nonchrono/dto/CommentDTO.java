package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommentDTO {

    private int com_num;
    private int rcrbrd_num;
    private String com_content;
    private String com_date;
    private String mem_id;
    private int com_grpno;
    private int com_indent;
    private int com_ansnum;

}
