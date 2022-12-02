package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class WishlistDTO {

    private int ss_price;
    private String ss_img;
    private String ss_name;
    private int dv_fee;
    private int total;

}


//WishlistDTO는 tb_wish의 컬럼을 멤버변수로 가지고 있지 않습니다.
//wishlist 페이지에 값을 출력해주기 위해 테이블을 조인하여 필요한 칼럼들을 멤버변수로 선언했습니다.
//wishlist.jsp 페이지만을 위한 DTO 입니다.
