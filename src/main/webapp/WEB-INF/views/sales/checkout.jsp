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
                            <th class="shoping__product">상품이미지</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>수량</th>
                            <th>배송비</th>
                            <th>적립금</th>
                            <th>합계</th>
                        </tr>
                        </thead>
                        <form action="/sales/orderinsert" method="post">
                            <tbody>
                            <c:forEach var="row" items="${list}" varStatus="vs">
                                <tr>
                                    <td class="shoping__cart__item" style="width: 15%; height: 15%">
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
                                               value="${row.bk_amount}개">
                                    </td>
                                    <td class="shoping__cart__price">
                                        <input type="text" id="dv_fee" name="dv_fee" readonly value="${row.dv_fee}원"
                                               style="border: none; text-align: center">
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
                                    <td class="shoping__cart__item__close">
                                        <form id="form1" name="form1" method="post" action="/cart/delete">
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
            <h4>받으시는 분</h4>

            <input type="hidden" id="cp_code" name="cp_code" value="A0000">
            <input type="hidden" name="umileage" value=0>
            <input type="hidden" name="dv_num" value=1>
            <input type="hidden" name="od_date" value="2022-12-15">
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
                                    <input type="checkbox" id="sameinfo" name="box1" onclick="boxClick2()">
                                    회원 정보와 동일
                                </div>
                                <div class="checkout__input__checkbox col-lg-6">
                                    <input type="checkbox" id="sameinfo2" name="box2" onclick="boxClick()"
                                           value="2">
                                    새로운 배송지
                                    <input type="button" class="btn-outline-primary" id="game_search"
                                           name="game_search" value="주소록 더보기" readonly>&nbsp;
                                </div>

                            </div>

                            <div class="modal fade" id="gs_modal">
                                <div class="modal-dialog">
                                    <div class="modal-content" style="width:800px; position:absolute">


                                        <!-- 모달 헤더 -->
                                        <div class="modal-header" style="border-bottom: none">
                                            <h4 class="modal-title">배송 주소록 관리</h4>
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                        </div>

                                        <!-- 모달 본문 -->
                                        <div class="card-body" style="margin-top: -30px">
                                            <table class="table table-hover">
                                                <tr>
                                                    <th scope="col">별칭</th>
                                                    <th scope="col">받는사람</th>
                                                    <th scope="col">우편번호</th>
                                                    <th scope="col">주소</th>
                                                    <th scope="col">나머지주소</th>
                                                    <th scope="col">핸드폰</th>

                                                </tr>
                                                <c:forEach var="row" items="${dvmem_info}">
                                                    <tbody>
                                                    <div>
                                                        <tr onclick="panelClick()">
                                                            <td>${row.mem_dvnum},${row.mem_dvnick},${row.mem_dvinfo}, ${row.mem_dvzip}, ${row.mem_dvadr1}, ${row.mem_dvadr2}, ${row.mem_dvphone}
                                                            </td>
                                                        </tr>
                                                    </div>
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
                    <div id="newDV" style="display: none">
                        <div class="row">
                            <div class="col-lg-6">

                                <div class="checkout__input">
                                    <p>받으시는분<span>*</span></p>
                                    <input type="text" id="mem_dvinfo" name="mem_dvinfo" value="">

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
                                    <p>Phone<span>*</span></p>
                                    <input type="text" name="mem_dvphone" id="mem_dvphone">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>별칭<span>*</span></p>
                                    <input type="text" name="mem_dvnick" id="mem_dvnick">
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- 회원정보와 동일 칸 --%>
                    <div id="userDV" style="display: none">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>받으시는분<span>*</span></p>
                                    <input type="text" id="mem_name" name="mem_name" value="${dv_mem_info.mem_name}"
                                           readonly>

                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="checkout__input" style="width: 30%">
                            <p>주소<span>*</span></p>
                            <input type="text" id="mem_zip" name="mem_zip" value="${dv_mem_info.mem_zip}"
                                   style="margin-left: auto; width: 50%"
                                   readonly>&nbsp;
                            <button type="button" class="btn btn-danger">검색</button>
                        </div>
                        <div id="wrap2"
                             style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
                            <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
                                 id="btnFoldWrap2"
                                 style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                 onclick="foldDaumPostcode()" alt="접기 버튼">
                        </div>
                        <div class="checkout__input" id="mem_adr3" style="width: 50%">
                            <input type="text" id="mem_adr1" name="mem_adr1" value="${dv_mem_info.mem_adr1}"
                                   readonly>
                        </div>
                        <div class="checkout__input" id="mem_adr4" style="width: 50%">
                            <input type="text" id="mem_adr2" name="mem_adr2" value="${dv_mem_info.mem_adr2}"
                                   readonly>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Phone<span>*</span></p>
                                    <input type="text" name="mem_phone" id="mem_phone"
                                           value="${dv_mem_info.mem_phone}" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="checkout__order" style="width: 120%">
                        <h4>Your Order</h4>
                        <div class="checkout__order__products">Products <span>Total</span></div>
                        <ul>
                            <c:forEach var="row" items="${list}" varStatus="vs">
                                <li>${row.ss_name}<span><fmt:formatNumber type="currency" value="${row.ss_price}"
                                                                          groupingUsed="true"/></span></li>
                            </c:forEach>
                        </ul>
                        <div class="checkout__order__subtotal">배송비<span>
                                <c:set var="total" value="${bk_total}"/>
                            <c:choose>
                                <c:when test="${total>=100000}">
                                    <a>10만원 이상 구매 시 배송비 무료!</a>
                                </c:when>
                                <c:otherwise>
                                    <a>${max_fee}<a>
                                </c:otherwise>
                            </c:choose>
                            </span></div>
                        <div class="checkout__order__total">Total <span><fmt:formatNumber type="currency"
                                                                                          value="${bk_total + max_fee}"
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
                        <button type="submit" class="site-btn" id="csite-btn" onclick="requestPay()" disabled
                                style="background-color: skyblue">결제하기
                        </button>
                    </div>
                </div>
            </div>
            </form>
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

    $('#cacc-or').click(function () {
        if ($('#cacc-or').is(':checked')) {
            $('#csite-btn').css('background-color', 'red');
            $('#csite-btn').attr("disabled", false);
        } else {
            $('#csite-btn').css('background-color', 'skyblue');
            $('#csite-btn').attr("disabled", true);
        }
    });

    <%-- 결제 API  --%>

    function requestPay() {
        IMP.init('imp62827174')
        //IMP.reqeust_pay(param, callback) 결제창 호출
        IMP.request_pay({
            pg: "kakaopay.TC0ONETIME",     //"html5_inicis.INIpayTest",
            pay_method: "card",
            merchant_uid: "merchant_continue_id" + new Date().getTime(),
            name: "포켓몬스터 골드",
            amount: 1000,
            buyer_email: "",
            buyer_name: "",
            buyer_tel: "",
            buyer_addr: "",
            buyer_postcode: "",
        }, function (rsp) {
            if (rsp.success) {
                alert("결제가 완료되었습니다. -> imp_uid :" + rsp.merchant_uid + " / merchant_uid(orderKey) : " + rsp.merchant_uid);

            } else {
                alert("결제에 실패하였습니다. : 코드(" + rsp.error_code + ") / 메세지(" + rsp.error_msg + ")");


            }
        });
    }


</script>

<script>
    /* 클릭하면 모달창 보이기 */
    $(document).ready(function () {
        $("#game_search").click(function () {
            // 모달창의 검색창 초기화
            $("#gs_keyword").val("");
            // 모달창 보이기
            $("#gs_modal").modal({backdrop: 'static', keyboard: false});
        });
    });

    function panelClick() {
        // 타겟의 내부 텍스트 추출
        let title = event.target.innerText;
        //alert(title);

        let str = title;

        let arr = str.split(',');


        // 추출한 텍스트를 모달창의 검색창에 입력
        $("#mem_dvnum").val(arr[0]);
        $("#mem_dvnick").val(arr[1]);
        $("#mem_dvinfo").val(arr[2]);
        $("#mem_dvzip").val(arr[3]);
        $("#mem_dvadr1").val(arr[4]);
        $("#mem_dvadr2").val(arr[5]);
        $("#mem_dvphone").val(arr[6]);
        $("#gs_modal").modal("hide");

    }

    // 새로운 배송지 누르면 입력 칸 출력
    function boxClick() {
        let box = $('#sameinfo2').click(function () {
            $("#newDV").toggle();

        });
    };

    function boxClick2() {
        let box = $('#sameinfo').click(function () {
            $("#userDV").toggle();

        });
    };

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


</script>


<jsp:include page="../footer.jsp"></jsp:include>
