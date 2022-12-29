<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/js/10-11.js"></script>

<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>장바구니</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>장바구니</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 장바구니 배너 끝 -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">상품이미지</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>수량</th>
                            <th>배송비</th>
                            <th>적립금</th>
                            <th>합계</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${list}" varStatus="vs">
                            <tr>
                                <td class="shoping__cart__item" style="width: 15%; height: 15%" >
                                    <a href="/sales/detail/${row.ss_num}">
                                        <img src="/images/product/sales_main/${row.ss_img}" alt="">
                                    </a>
                                </td>

                                <td class="shoping__cart__price">
                                    <input type="text" id="ss_name" name="ss_name" readonly value="${row.ss_name}" style="border: none; text-align: center">
                                </td>

                                <td class="shoping__cart__price">
                                    <input type="hidden" id="ss_price${vs.index}" name="ss_price"
                                           value="${row.ss_price}">
                                    <fmt:formatNumber type="currency" value="${row.ss_price}" groupingUsed="true"/>
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty" readonly="">
                                            <input id="bk_amount${vs.index}" name="bk_amount" type="text"
                                                   value="${row.bk_amount}">
                                        </div>
                                    </div>
                                </td>

                                <td class="shoping__cart__price">
                                    <input type="text" id="dv_fee" name="dv_fee" readonly value="${row.dv_fee}원" style="border: none; text-align: center">
                                </td>

                                <td class="shoping__cart__price">
                                    <input type="hidden" id="mileage" name="mileage" readonly value="${row.ss_price * 0.01}" style="border: none; text-align: center">
                                    <fmt:parseNumber value="${row.ss_price * row.bk_amount * 0.01}" integerOnly="true"/>원
                                </td>

                                <td class="shoping__cart__total" id="total${vs.index}">
                                        <%-- <fmt:formatNumber value="${row.total}" type="currency" groupingUsed="true"></fmt:formatNumber>--%>
                                    <input type="hidden" id="total" name="total"
                                           value="${row.bk_amount * row.ss_price}">
                                    <fmt:formatNumber type="currency" value="${row.bk_amount * row.ss_price}"
                                                      groupingUsed="true"/>
                                </td>
                                <td class="shoping__cart__item__close">
                                    <form id="form1" name="form1" method="post" action="/cart/delete">
                                        <input type="hidden" id="bk_num" name="bk_num" value="${row.bk_num}">
                                        <span class="icon_close" onclick="bkDelete()"></span>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="/sales/sales" class="primary-btn cart-btn">쇼핑하기</a>
                    <a href="/cart/allClear" class="primary-btn cart-btn cart-btn-right"></span>
                        장바구니 비우기</a>
                </div>
            </div>
            <div class="col-lg-6">
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                        <span>총 상품금액 :  <fmt:formatNumber type="currency" value="${bk_total}" groupingUsed="true"/></span><br>
                        <span>배송비 :
                            <c:set var="total" value="${bk_total}"/>
                            <c:choose>
                                <c:when test="${total>=100000}">
                                    <a>10만원 이상 구매 시 배송비 무료!</a>
                                </c:when>
                                <c:otherwise>
                                    <a>${max_fee}<a>
                                </c:otherwise>

                            </c:choose>
                        </span>
                    <hr>

                    <ul>
                        <li>Total <span><fmt:formatNumber type="currency" value="${bk_total + max_fee}" groupingUsed="true"/></span></li>
                    </ul>
                    <button onclick="location.href='/sales/checkout'" id="button" class="primary-btn"
                            style="background-color: red; border: none; width: 100%" >주문하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

<script>
    function bkDelete() {
        if (confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")) {
            $("#form1").submit();
        }
    }
/*
   $(document).ready(function () {
         <%--let a = ${list.bk_amount * list.ss_price * 0.01}--%>
        // alert(a);

        //$('input[name=mileage]').attr('value', mileage)
    });
*/
$(document).ready(function (){
    let cnt = ${basket_cnt}

    if(cnt != 0){
        $("#button").attr("disabled", false);
    } else {
        $("#button").attr("disabled", true);
    }


    $('#cacc-or').click(function () {
        if ($('#cacc-or').is(':checked')) {
            $('#csite-btn').css('background-color', 'red');
            $('#csite-btn').attr("disabled", false);
        } else {
            $('#csite-btn').css('background-color', 'skyblue');
            $('#csite-btn').attr("disabled", true);
        }
    });

})




</script>

<jsp:include page="../footer.jsp"></jsp:include>
