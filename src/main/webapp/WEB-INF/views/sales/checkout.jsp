<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

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
                    <h2>주문서</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>주문서</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<form action="/sales/pay" id="checkout" method="post">
    <input type="hidden" id="mem_id" name="mem_id" value="<%=session.getAttribute("mem_id")%>">
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th class="shoping__product" style="width: 30%; height: auto">상품이미지</th>
                                <th style="width: 25%; height: 15%">상품명</th>
                                <th style="width: 7%; height: 15%">가격</th>
                                <th style="width: 7%; height: 15%">수량</th>
                                <th style="width: 10%; height: 15%">배송비</th>
                                <th style="width: 10%; height: 15%">적립금</th>
                                <th style="width: 11%; height: 15%">합계</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${list}" varStatus="vs">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <a href="/sales/detail/${row.ss_num}">
                                            <img src="/images/product/sales_main/${row.ss_img}" alt="">
                                        </a>
                                    </td>

                                    <td class="shoping__cart__price">
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
                                               value="${row.bk_amount}">
                                    </td>
                                    <td class="shoping__cart__price">
                                        <input type="text" id="dv_fee" name="dv_fee" readonly value="${row.dv_fee}원"
                                               style="border: none; text-align: center">
                                            <%--<c:set var="dv_fee${vs.count}" value="${row.dv_fee}"/>--%>
                                    </td>

                                    <td class="shoping__cart__price">
                                        <input type="hidden" id="pileage" name="pileage" readonly
                                               value="${row.ss_price * 0.01}" style="border: none; text-align: center">
                                        <fmt:parseNumber value="${row.ss_price * row.bk_amount * 0.01}"
                                                         integerOnly="true"/>원
                                    </td>

                                    <td class="shoping__cart__total" id="total${vs.index}">
                                            <%-- <fmt:formatNumber value="${row.total}" type="currency" groupingUsed="true"></fmt:formatNumber>--%>
                                        <input type="hidden" id="total" name="total"
                                               value="${row.bk_amount * row.ss_price}">
                                        <fmt:formatNumber type="currency" value="${row.bk_amount * row.ss_price}"
                                                          groupingUsed="true"/>
                                    </td>
                                        <%--<td class="shoping__cart__item__close">
                                            <div id="delete" name="delete">
                                                <input type="hidden" id="bk_num" name="bk_num" value="${row.bk_num}">
                                                <span class="icon_close" onclick="checkoutDelete(${row.bk_num})"></span>
                                            </div>
                                        </td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>받으시는 분</h4>

                <%-- 만들어야함 --%>
                <input type="hidden" id="cp_code" name="cp_code" value="A0000">
                <input type="hidden" id="mem_dvnum" name="mem_dvnum" value=0>
                <input type="hidden" id="od_date" name="od_date" value="">

                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="checkout__input">
                                    <p>배송지 선택</p>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row" style="text-align: right">
                                    <div class="checkout__input__checkbox col-lg-4">
                                        <input type="radio" id="sameDelivery" name="radio">
                                        회원 정보와 동일
                                    </div>
                                    <div class="checkout__input__checkbox col-lg-4">
                                        <input type="radio" id="newDelivery" name="radio" value="2" checked>
                                        새로운 배송지
                                    </div>
                                    <div class="col-lg-4">
                                        <input type="button" class="btn btn-outline-primary" id="game_search"
                                               name="game_search" value="주소록" readonly>&nbsp;
                                    </div>
                                </div>

                                <div class="modal fade" id="gs_modal">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="width:800px; position:absolute">


                                            <!-- 모달 헤더 -->
                                            <div class="modal-header" style="border-bottom: none">
                                                <h4 class="modal-title" style="border-bottom: none; margin: auto 0">배송
                                                    주소록
                                                    관리</h4>
                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                            </div>

                                            <!-- 모달 본문 -->
                                            <div class="card-body" style="margin-top: -30px">
                                                <table class="table table-hover">
                                                    <tr style="text-align: center">
                                                        <th scope="col">번호</th>
                                                        <th scope="col">별칭</th>
                                                        <th scope="col">받는사람</th>
                                                        <th scope="col">우편번호</th>
                                                        <th scope="col">주소</th>
                                                        <th scope="col">나머지 주소</th>
                                                        <th scope="col">핸드폰</th>

                                                    </tr>
                                                    <c:forEach var="row" items="${dvmem_info}">
                                                        <tbody>
                                                        <tr style="text-align: center;" onclick="panelClick()">
                                                            <td id="td0">${row.mem_dvnum}</td>
                                                            <td id="td1">${row.mem_dvnick}</td>
                                                            <td id="td2">${row.mem_dvinfo}</td>
                                                            <td id="td3">${row.mem_dvzip}</td>
                                                            <td id="td4">${row.mem_dvadr1}</td>
                                                            <td id="td5">${row.mem_dvadr2}</td>
                                                            <td id="td6">${row.mem_dvphone}</td>
                                                        </tr>
                                                        </tbody>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div id="newDV">
                            <div class="row">
                                <div class="col-lg-6">

                                    <div class="checkout__input">
                                        <p>받으시는분<span>*</span></p>
                                        <input type="text" id="mem_dvinfo" name="mem_dvinfo" value="" required>

                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="checkout__input" style="width: 30%">
                                <p>주소<span>*</span></p>
                                <input type="text" id="mem_dvzip" name="mem_dvzip"
                                       style="margin-left: auto; width: 50%"
                                       readonly>&nbsp;
                                <button type="button" onclick="DaumPostcode()" class="btn btn-danger">검색</button>
                            </div>
                            <div id="wrap"
                                 style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
                                <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
                                     id="btnFoldWrap"
                                     style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                     onclick="foldDaumPostcode()" alt="접기 버튼">
                            </div>
                            <div class="checkout__input" id="rcrbrd_adr0" style="width: 50%">
                                <input type="text" id="mem_dvadr1" name="mem_dvadr1" readonly>
                            </div>
                            <div class="checkout__input" id="rcrbrd_adr1" style="width: 50%">
                                <input type="text" id="mem_dvadr2" name="mem_dvadr2">
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>휴대폰 번호<span>*</span></p>
                                        <input type="text" name="mem_dvphone" id="mem_dvphone">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>별칭<span>*</span></p>
                                        <input type="text" name="mem_dvnick" id="mem_dvnick">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>배송 메세지</p>
                                        <textarea id="dt_msg" name="dt_msg" placeholder="배송 메세지를 입력해주세요."></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order" style="width: 120%">
                            <h4>주문서</h4>
                            <div class="checkout__order__products">Products <span>Total</span></div>
                            <ul>
                                <c:forEach var="row" items="${list}" varStatus="vs">
                                    <li>${row.ss_name}<span><fmt:formatNumber type="currency" value="${row.ss_price}"
                                                                              groupingUsed="true"/></span></li>
                                </c:forEach>
                            </ul>
                            <hr>
                            <div class="checkout__order__products">
                                <ul>
                                    <li style="color: black; font-weight: bold">마일리지 사용<br>남은 마일리지 : ${mileage}<input
                                            type="text" id="umileage" name="umileage" value="0" style="float: right">
                                    </li>
                                </ul>
                            </div>
                            <hr>
                            <div class="checkout__order__products">
                                <button type="button" class="btn btn-dark" data-toggle="modal"
                                        data-target="#couponModal" style="width: 40%">쿠폰
                                    선택 <%--// onclick="couponList()"--%>
                                </button>
                                <input type="text" id="couponDiscount" value="0" style="float: right" readonly>
                            </div>
                            <hr>
                            <div class="checkout__order__products">할인 금액
                                <span id="discount">
                                <c:choose>
                                    <c:when test="${bk_total > 100000}">
                                        ${max_fee}
                                    </c:when>
                                    <c:otherwise>
                                        0
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            </div>
                            <div class="checkout__order__subtotal">배송비<span>
                                <c:set var="bk_total" value="${bk_total}"/>
                            <c:choose>
                                <c:when test="${bk_total>=100000}">
                                    <a style="font-size: 13px; font-weight: bold">10만원 이상 구매 시 배송비 무료!</a>
                                </c:when>
                                <c:otherwise>
                                    <a>${max_fee}<a>
                                </c:otherwise>
                            </c:choose>
                            </span>
                            </div>
                            <input type="hidden" id="totalPay" name="totalPay" value="">
                            <div class="checkout__order__total">Total <span id="payment"
                                                                            name="payment"><fmt:formatNumber
                                    type="currency"
                                    value=""
                                    groupingUsed="true"/></span>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="cacc-or">
                                    상품과 수량을 확인하셨습니까?
                                    <input type="checkbox" id="cacc-or">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>결제 당일 취소가 아닌 경우에는 결제사에 따라 영업일 기준으로 3~5일 정도 소요됩니다. (카드사마다 취소 승인 소요 시일이 다를 수 있습니다)</p>
                            <button type="button" class="site-btn" id="csite-btn" onclick="requestPay()"
                                    disabled
                                    style="background-color: skyblue">결제하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</form>

<!-- The Modal -->
<div class="modal fade" id="couponModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="text-align: center">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">쿠폰 리스트</h4>
                <button type="button" class="close" data-dismiss="modal">×</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" id="coupon">
                <table class="table table-hover">
                    <tr>
                        <th>쿠폰명</th>
                        <th>발행일</th>
                        <th>만료일</th>
                        <th>할인율</th>
                    </tr>
                    <tr onclick="couponCheck(0, ${bk_total}, 'A0000')">
                        <td>쿠폰 사용 안 함</td>
                        <td></td>
                        <td></td>
                        <td>0%</td>
                    </tr>
                    <c:forEach var="cp" items="${couponList}" varStatus="vs2">
                        <tr onclick="couponCheck(${cp.cp_percent}, ${bk_total}, '${cp.cp_code}')">
                            <td>${cp.cp_name}</td>
                            <td>${cp.cp_speriod}</td>
                            <td>${cp.cp_eperiod}</td>
                            <td>${cp.cp_percent}%</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>
    </div>
</div>


<%--결제 API--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>

    $(document).ready(function () {

        // 회원 정보와 동일한 배송정보 사용
        $("#sameDelivery").change(function () {
            $("#mem_dvinfo").val("${dv_mem_info.mem_name}");
            $("#mem_dvzip").val("${dv_mem_info.mem_zip}");
            $("#mem_dvadr1").val("${dv_mem_info.mem_adr1}");
            $("#mem_dvadr2").val("${dv_mem_info.mem_adr2}");
            $("#mem_dvphone").val("${dv_mem_info.mem_phone}");
            $("#mem_dvphone").val("${dv_mem_info.mem_phone}");
            $("#mem_dvnick").val("${dv_mem_info.mem_nick}");
        });

        // 새로운 배송정보 클릭시 빈칸으로 만들기
        $("#newDelivery").change(function () {
            $("#mem_dvinfo").val("");
            $("#mem_dvzip").val("");
            $("#mem_dvadr1").val("");
            $("#mem_dvadr2").val("");
            $("#mem_dvphone").val("");
            $("#mem_dvphone").val("");
            $("#mem_dvnick").val("");
        });

        // 로딩되자마자 할인 금액과 총액 계산
        if (parseInt(${bk_total}) < 100000) {
            if (parseInt($("#umileage").val()) != 0) {
                $('#discount').text(parseInt($("#umileage").val().replace(/(^0+)/, "")) + parseInt($("#couponDiscount").val()));
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val().replace(/(^0+)/, "")) - parseInt($("#couponDiscount").val()) + parseInt(${max_fee}));
            } else {
                $('#discount').text(parseInt($("#umileage").val()) + parseInt($("#couponDiscount").val()));
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val()) - parseInt($("#couponDiscount").val()) + parseInt(${max_fee}));
            }
        } else {
            if (parseInt($("#umileage").val()) != 0) {
                $('#discount').text(parseInt($("#umileage").val().replace(/(^0+)/, "")) + parseInt($("#couponDiscount").val()) + ${max_fee});
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val().replace(/(^0+)/, "")) - parseInt($("#couponDiscount").val()));
            } else {
                $('#discount').text(parseInt($("#umileage").val()) + parseInt($("#couponDiscount").val()) + ${max_fee});
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val()) - parseInt($("#couponDiscount").val()));
            }
        }

        // 현재 날짜 구하기
        let today = new Date();
        let year = today.getFullYear();
        let month = ('0' + (today.getMonth() + 1)).slice(-2);
        let day = ('0' + today.getDate()).slice(-2);
        let hours = ('0' + today.getHours()).slice(-2);
        let minutes = ('0' + today.getMinutes()).slice(-2);
        let seconds = ('0' + today.getSeconds()).slice(-2);

        let time = year + '-' + month + '-' + day + " " + hours + ':' + minutes + ':' + seconds;
        $('#od_date').val(time);

    });

    // 클릭한 배송 정보 가져오기
    function panelClick() {
        let keyword = [];

        for (let i = 0; i <= 6; i++) {
            keyword[i] = $("#td" + i).text();
        }

        // 추출한 텍스트를 모달창의 검색창에 입력
        $("#mem_dvnum").val(keyword[0]);
        $("#mem_dvnick").val(keyword[1]);
        $("#mem_dvinfo").val(keyword[2]);
        $("#mem_dvzip").val(keyword[3]);
        $("#mem_dvadr1").val(keyword[4]);
        $("#mem_dvadr2").val(keyword[5]);
        $("#mem_dvphone").val(keyword[6]);
        $("#gs_modal").modal("hide");
    }

    <%-- 결제 API  --%>

    function requestPay() {
        let total = $('#payment').text();
        $("#totalPay").val(total);
        // alert("결제 성공");
        IMP.init('imp62827174')
        //IMP.reqeust_pay(param, callback) 결제창 호출
        IMP.request_pay({
            pg: "kakaopay.TC0ONETIME",     //"html5_inicis.INIpayTest",
            pay_method: "card",
            merchant_uid: "merchant_continue_id" + new Date().getTime(),
            name:"Continue : 테스트결제",
            amount: total,
            buyer_email: "",
            buyer_name: "",
            buyer_tel: "",
            buyer_addr: "",
            buyer_postcode: "",
        }, function (rsp) {
            if (rsp.success) {
                alert("결제가 완료되었습니다. -> imp_uid :" + rsp.merchant_uid + " / merchant_uid(orderKey) : " + rsp.merchant_uid);
                $('#checkout').submit();
            } else {
                alert("결제에 실패하였습니다. : 코드(" + rsp.error_code + ") / 메세지(" + rsp.error_msg + ")");
            }
        });
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

    /* 클릭하면 모달창 보이기 */
    $(document).ready(function () {
        $("#game_search").click(function () {
            // 모달창의 검색창 초기화
            $("#gs_keyword").val("");
            // 모달창 보이기
            $("#gs_modal").modal({backdrop: 'static', keyboard: false});
        });
    });

    // 쿠폰 클릭하면 해당 할인률 계산해서 적용
    function couponCheck(percent, total, code) {

        let discount = total * percent / 100;

        $("#couponDiscount").val(discount);
        $("#cp_code").val(code);
        $("#couponModal").modal("hide");

        if (parseInt(${bk_total}) < 100000) {
            if (parseInt($("#umileage").val()) != 0) {
                $('#discount').text(parseInt($("#umileage").val().replace(/(^0+)/, "")) + parseInt($("#couponDiscount").val()));
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val().replace(/(^0+)/, "")) - parseInt($("#couponDiscount").val()) + parseInt(${max_fee}));
            } else {
                $('#discount').text(parseInt($("#umileage").val()) + parseInt($("#couponDiscount").val()));
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val()) - parseInt($("#couponDiscount").val()) + parseInt(${max_fee}));
            }
        } else {
            if (parseInt($("#umileage").val()) != 0) {
                $('#discount').text(parseInt($("#umileage").val().replace(/(^0+)/, "")) + parseInt($("#couponDiscount").val()) + ${max_fee});
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val().replace(/(^0+)/, "")) - parseInt($("#couponDiscount").val()));
            } else {
                $('#discount').text(parseInt($("#umileage").val()) + parseInt($("#couponDiscount").val()) + ${max_fee});
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val()) - parseInt($("#couponDiscount").val()));
            }
        }

    }

    // 마일리지 제한
    $("#umileage").keyup(function () {
        // 맨왼쪽 0 제거하기
        $("#umileage").val(parseInt($("#umileage").val().replace(/(^0+)/, "")));

        let mileage = parseInt($("#umileage").val());
        // alert(mileage);
        let total = $("#payment").text();
        let total2 = total.replace(/[^0-9]/g, "");
        let payment = parseInt(total2);

        // 숫자만 입력하게 제한
        $(this).val($(this).val().replace(/[^0-9]/g, ""));

        // 마일리지가 빈칸이면 0 생성
        if ($("#umileage").val() == "") {
            $("#umileage").val(0);
        }

        // 마일리지에 00을 작성하면 0으로 교체
        if ($("#umileage").val() == "00") {
            $("#umileage").val(0);
        }

        if (mileage > payment) {
            alert("마일리지는 총 결제금액보다 많을 수 없습니다.");
            $("#umileage").val(${mileage});
        }

        if (mileage > ${mileage}) {
            alert("보유 마일리지보다 많을 수 없습니다.");
            $("#umileage").val(${mileage});
        }

        if (parseInt(${bk_total}) < 100000) {
            if (parseInt($("#umileage").val()) != 0) {
                $('#discount').text(parseInt($("#umileage").val().replace(/(^0+)/, "")) + parseInt($("#couponDiscount").val()));
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val().replace(/(^0+)/, "")) - parseInt($("#couponDiscount").val()) + parseInt(${max_fee}));
            } else {
                $('#discount').text(parseInt($("#umileage").val()) + parseInt($("#couponDiscount").val()));
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val()) - parseInt($("#couponDiscount").val()) + parseInt(${max_fee}));
            }
        } else {
            if (parseInt($("#umileage").val()) != 0) {
                $('#discount').text(parseInt($("#umileage").val().replace(/(^0+)/, "")) + parseInt($("#couponDiscount").val()) + ${max_fee});
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val().replace(/(^0+)/, "")) - parseInt($("#couponDiscount").val()));
            } else {
                $('#discount').text(parseInt($("#umileage").val()) + parseInt($("#couponDiscount").val()) + ${max_fee});
                $('#payment').text(parseInt(${bk_total}) - parseInt($("#umileage").val()) - parseInt($("#couponDiscount").val()));
            }
        }

        //
        if (parseInt($("#umileage").val()) + parseInt($("#couponDiscount").val()) > parseInt(${bk_total})) {
            alert("총 결제금액보다 할인금액이 많을 수 없습니다.");
            $("#umileage").val(0);
            $("#couponDiscount").val(0);
            if (parseInt(${bk_total}) > 100000) {
                $('#discount').text(${max_fee});
            } else {
                $('#discount').text(0);
            }
        }
    });

    <!-- ----- DAUM 우편번호 API 시작 ----- -->
    // 우편번호 찾기 화면을 넣을 element
    let element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        let currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function (data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if (data.addressType === 'R') {
                    //법정동명이 있을 경우 추가한다.
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_dvzip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_dvadr1').value = fullAddr;
                $('#rcrbrd_adr2').text(fullAddr);

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;


            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize: function (size) {
                element_wrap.style.height = size.height + 'px';
            },
            width: '100%',
            height: '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }

    <!-- ----- DAUM 우편번호 API 종료 ----- -->

    // 선택한 상품 삭제
    /*function checkoutDelete(bk_num) {
        if (confirm("선택한 상품을 삭제하시겠습니까?")) {
            location.href = "/sales/checkoutdelete?bk_num=" + bk_num;
        }
    }*/

</script>


<jsp:include page="../footer.jsp"></jsp:include>
