package com.cafe24.nonchrono.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchDTO {
    private int sc_num;
    private String sc_word;
    private String sc_date;
    private String sc_where;
}
