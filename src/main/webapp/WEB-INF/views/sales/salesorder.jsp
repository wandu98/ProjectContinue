<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../header.jsp" %>

<style>
    #umileage {
        width: 50%;
        height: 46px;
        border: 1px solid #ebebeb;
        padding-right: 20px;
        font-size: 16px;
        color: #505050;
        border-radius: 4px;
        text-align: right;
        font-weight: 700
    }

    #couponDiscount {
        width: 50%;
        height: 46px;
        border: 1px solid #ebebeb;
        padding-right: 20px;
        font-size: 16px;
        color: #505050;
        border-radius: 4px;
        text-align: right;
        font-weight: 700
    }

    #dt_msg {
        width: 100%;
        height: 150px;
        font-size: 16px;
        color: #6f6f6f;
        padding-left: 20px;
        margin-bottom: 24px;
        border: 1px solid #ebebeb;
        border-radius: 4px;
        padding-top: 12px;
        resize: none;
    }
</style>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>구매 내역</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>구매 내역</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th>주문서 번호</th>
                            <th>상품이미지</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>수량</th>
                            <th>적립금</th>
                            <th>주문일자</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${orderlist}" varStatus="vs">
                            <tr>
                                <td class="shoping__cart__price">
                                        ${row.od_num}
                                </td>
                                <td class="shoping__cart__item" style="width: 15%; height: 15%; ">
                                    <a href="/sales/detail/${row.ss_num}">
                                        <img src="/images/product/sales_main/${row.ss_img}" alt=""
                                             style="padding-left: 15%">
                                    </a>
                                </td>
                                <td class="shoping__cart__product">
                                    <input type="text" id="ss_name" name="ss_name" readonly value="${row.ss_name}"
                                           style="border: none; text-align: center">
                                </td>
                                <td class="shoping__cart__price">
                                    <input type="hidden" id="ss_price${vs.index}" name="ss_price"
                                           value="${row.ss_price}">
                                    <fmt:formatNumber type="currency" value="${row.ss_price}" groupingUsed="true"/>
                                </td>
                                <td class="shoping__cart__amount">
                                    <input id="bk_amount" name="bk_amount" type="text"
                                           style="border: none; text-align: center"
                                           value="${row.dt_amount}">
                                </td>
                                <td class="shoping__cart__amount">
                                    <input id="pmileage" name="pmileage" type="text"
                                           style="border: none; text-align: center"
                                           value="${row.pmileage}">
                                </td>
                                <td class="shoping__cart__amount">
                                        ${row.od_date}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <section class="checkout spad">
                        <div class="container">
                            <div class="checkout__form">
                                <h4>배송지 정보</h4>

                                <div class="row">
                                    <div class="col-lg-8 col-md-8">
                                        <div id="newDV">
                                            <div class="row">
                                                <div class="col-lg-6">

                                                    <div class="checkout__input">
                                                        <p>받으시는분<span>*</span></p>
                                                        <input type="text" id="mem_dvinfo" name="mem_dvinfo"
                                                               value="${orderadr.mem_dvinfo}"
                                                               required readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="checkout__input" style="width: 30%">
                                                <p>주소<span>*</span></p>
                                                <input type="text" id="mem_dvzip" name="mem_dvzip"
                                                       style="margin-left: auto; width: 50%"
                                                       value="${orderadr.mem_dvzip}" readonly>&nbsp;
                                            </div>
                                            <div id="wrap"
                                                 style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
                                            </div>
                                            <div class="checkout__input" id="rcrbrd_adr0" style="width: 50%">
                                                <input type="text" id="mem_dvadr1" name="mem_dvadr1"
                                                       value="${orderadr.mem_dvadr1}" readonly>
                                            </div>
                                            <div class="checkout__input" id="rcrbrd_adr1" style="width: 50%">
                                                <input type="text" id="mem_dvadr2" name="mem_dvadr2"
                                                       value="${orderadr.mem_dvadr2}" readonly>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="checkout__input">
                                                        <p>휴대폰 번호<span>*</span></p>
                                                        <input type="text" name="mem_dvphone" id="mem_dvphone"
                                                               value="${orderadr.mem_dvphone}" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="checkout__input">
                                                        <p>별칭<span>*</span></p>
                                                        <input type="text" name="mem_dvnick" id="mem_dvnick"
                                                               value="${orderadr.mem_dvnick}" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="checkout__input">
                                                        <p>배송 메세지</p>
                                                        <textarea id="dt_msg" name="dt_msg" readonly>${dvmsg}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="checkout__order" style="width: 120%">
                                            <h4>주문내역</h4>
                                            <div class="checkout__order__products">Products <span>Total</span></div>
                                            <ul>
                                                <c:forEach var="row" items="${orderlist}" varStatus="vs">
                                                    <li>${row.ss_name}<span><fmt:formatNumber type="currency"
                                                                                              value="${row.ss_price}"
                                                                                              groupingUsed="true"/></span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <hr>
                                            <div class="checkout__order__products">
                                                <ul>
                                                    <li style="color: black; font-weight: bold">마일리지 사용
                                                        <input type="text" id="umileage" name="umileage" value="${umileage}"
                                                               style="float: right" readonly>
                                                    </li>
                                                </ul>
                                            </div>
                                            <hr>
                                            <div class="checkout__order__products">
                                                <ul>
                                                    <li style="color: black; font-weight: bold">${dt_coupon.cp_name}
                                                        <input type="text" id="couponDiscount" name="umileage" value="${dt_coupon.cp_percent}%"
                                                               style="float: right" readonly>
                                                    </li>
                                                </ul>
                                                <hr>
                                                <div class="checkout__order__subtotal">배송비<span>
                                <c:set var="bk_total" value="${total}"/>
                            <c:choose>
                                <c:when test="${total>=100000}">
                                    <a style="font-size: 13px; font-weight: bold">10만원 이상 구매 시 배송비 무료!</a>
                                </c:when>
                                <c:otherwise>
                                    <a>${maxdt_fee}<a>
                                </c:otherwise>
                            </c:choose>
                            </span>
                                                </div>
                                                <div class="checkout__order__total">Total
                                                    <span id="payment" name="payment"><fmt:formatNumber
                                                        type="currency"
                                                        value="${total}"
                                                        groupingUsed="true"/>
                                                    </span>
                                                </div>
                                                <button type="button" class="site-btn" style="background-color: red"
                                                        onclick="location.href='/'">HOME
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- shoping Cart Section End -->


<%@include file="../footer.jsp" %>
