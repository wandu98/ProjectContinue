package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PagingDTO {

    private int startRow;
    private int endRow;
    private String mem_id;
    private String ss_name;
    private String gm_code;

}
