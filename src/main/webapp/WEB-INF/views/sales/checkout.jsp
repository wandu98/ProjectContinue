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

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/images/002.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Order</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>Order</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${list}" varStatus="vs">
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="img/cart/cart-1.jpg" alt="">
                                    <h5>${row.ss_name}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    <fmt:formatNumber type="currency" value="${row.ss_price}"
                                                      groupingUsed="true"></fmt:formatNumber>
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="${row.bk_amount}">
                                        </div>
                                    </div>
                                </td>
                                <td class="shoping__cart__total" id="total">
                                    <fmt:formatNumber value="${row.total}" type="currency"
                                                      groupingUsed="true"></fmt:formatNumber>
                                </td>
                                <td class="shoping__cart__item__close">
                                    <form id="form1" name="form1" method="post" action="/sales/checkoutdelete">
                                        <input type="hidden" id="bk_num" name="bk_num" value="${row.bk_num}">
                                        <span class="icon_close" onclick="checkoutDelete()"></span>
                                    </form>
                                </td>
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
            <h4>Billing Details</h4>
            <form action="#">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="checkout__input">
                                    <p>배송지 선택</p>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="checkout__input__checkbox col-lg-6">
                                        <label for="sameinfo">
                                            회원 정보와 동일
                                            <input type="checkbox" id="sameinfo">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="checkout__input__checkbox col-lg-6">
                                        <label for="acc">
                                            새로운 배송지
                                            <input type="checkbox" id="acc">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>이름<span>*</span></p>
                                    <input type="text">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>주소<span>*</span></p>
                            <input type="text" id="zipcode" style="margin-left: auto; width: 50%" readonly>&nbsp;
                            <button type="button" onclick="DaumPostcode()" class="btn btn-danger">검색</button>
                        </div>
                        <div id="wrap"
                             style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
                            <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap"
                                 style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                 onclick="foldDaumPostcode()" alt="접기 버튼">
                        </div>
                        <div class="checkout__input" id="rcrbrd_adr0" style="display: none">
                            <input type="text" id="rcrbrd_adr" name="rcrbrd_adr" readonly>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Phone<span>*</span></p>
                                    <input type="text">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input type="text">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input__checkbox">
                            <label for="diff-acc">
                                Ship to a different address?
                                <input type="checkbox" id="diff-acc">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="checkout__input">
                            <p>Order notes<span>*</span></p>
                            <input type="text"
                                   placeholder="Notes about your order, e.g. special notes for delivery.">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Your Order</h4>
                            <div class="checkout__order__products">Products <span>Total</span></div>
                            <ul>
                                <li>Vegetable’s Package <span>$75.99</span></li>
                                <li>Fresh Vegetable <span>$151.99</span></li>
                                <li>Organic Bananas <span>$53.99</span></li>
                            </ul>
                            <div class="checkout__order__subtotal">Subtotal <span>$750.99</span></div>
                            <div class="checkout__order__total">Total <span>$750.99</span></div>
                            <div class="checkout__input__checkbox">
                                <label for="acc-or">
                                    Create an account?
                                    <input type="checkbox" id="acc-or">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua.</p>
                            <div class="checkout__input__checkbox">
                                <label for="payment">
                                    Check Payment
                                    <input type="checkbox" id="payment">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="paypal">
                                    Paypal
                                    <input type="checkbox" id="paypal">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <button type="submit" class="site-btn" onclick="requestPay()">결제하기</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<%--결제 API--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
    <%-- 결제 API  --%>
    function requestPay() {
        IMP.init('imp62827174')
        //IMP.reqeust_pay(param, callback) 결제창 호출
        IMP.request_pay({
            pg:"html5_inicis.INIpayTest",
            pay_method: "card",
            merchant_uid: "merchant_continue_id" + new Date().getTime(),
            name: "포켓몬스터 골드",
            amount: 1000,
            buyer_email: "",
            buyer_name: "",
            buyer_tel: "",
            buyer_addr: "",
            buyer_postcode: "",
        },  function(rsp) {
            if (rsp.success) {
                alert("결제가 완료되었습니다. -> imp_uid :" + rsp.merchant_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
                location.href = '/';
            } else {
                alert("결제에 실패하였습니다. : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");


            }
        });
    }


</script>

<script>
    function checkoutDelete() {
        if (confirm("선택한 상품을 삭제하시겠습니까?")) {
            $("#form1").submit();
        }
    }

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
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('rcrbrd_adr').value = fullAddr;
                $('#rcrbrd_adr2').text(fullAddr);

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;


                $('#rcrbrd_adr0').show();
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
</script>


<jsp:include page="../footer.jsp"></jsp:include>
