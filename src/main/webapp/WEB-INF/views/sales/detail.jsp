<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/11/29
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../header.jsp" %>
<style>

    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 20%;
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>마켓 상세보기</h2>
                    <div class="breadcrumb__option">
                        <a href="/l">Home</a>
                        <a href="/sales">Sales</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="/images/product/sales_main/${detail.ss_img}">
                    </div>
                    <div class="product__details__pic__slider owl-carousel">
                        <img data-imgbigurl="/images/002.jpg"
                             src="">
                        <img data-imgbigurl="/images/003.jpg"
                             src="">
                        <img data-imgbigurl="/images/004.jpg"
                             src="">
                        <img data-imgbigurl="/images/001.jpg"
                             src="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${detail.ss_name}</h3>
                    <div class="product__details__rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <span>(${reviewCount} reviews)</span>
                    </div>
                    <div class="product__details__price">판매가 ₩<fmt:formatNumber value="${detail.ss_price}"
                                                                                pattern="#,###"/></div>
                    <ul>
                        <li><b>배송비</b> <span>${deliveryDetail.dv_fee}</span></li>
                        <li><b>재고</b> <span>${detail.ss_stock}개</span></li>
                        <li><b>플랫폼</b> <span>SWITCH</span></li>
                        <li><b>퍼블리셔</b> <span>닌텐도</span></li>
                        <li><b>언어</b> <span>제조국-중국</span></li>
                        <li><b>이용등급</b> <span>${gameDetail.gm_level}</span></li>
                        <li><b>상품코드</b> <span>${gameDetail.gm_code}</span></li>
                    </ul>
                    <hr>


                    <!-- 스크롤2 영역시작 -->
                    <div class="scrollbar_box op_view_h">
                        <!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
                        <div id="totalProducts" class="">
                            <table border="1" summary="" class="op_h">
                                <colgroup>
                                    <col style="width:300px"/>
                                    <col style="width:300px"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">상품명</th>
                                    <th scope="col">가격</th>
                                </tr>
                                </thead>
                                <tbody class="product__details__text">
                                <tr>
                                    <td>${gameDetail.gm_name}</td>
                                    <td>
                                        <span class="quantity_price">₩<fmt:formatNumber value="${detail.ss_price}"
                                                                                        pattern="#,###"/></span>
                                        <span class="mileage ">&nbsp;&nbsp;&nbsp;
                                        <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif"/>
                                        <span class="mileage_price">(<fmt:parseNumber value="${detail.ss_price * 0.01}" integerOnly="true"/>원)</span></span>
                                    </td>
                                </tr>
                                </tbody>

                                </tbody>
                            </table>
                            <!-- //참고 -->
                        </div>
                        <!-- //참고 -->
                    </div>
                    <br>
                    <!-- //스크롤2 영역끝 -->


                    <div id="totalPrice" class="top_total_box">
                        <strong>총 상품금액</strong>(수량) :
                        <span class="total" id="il">
                            <strong>
                               <input type="text" value="0" name="inputValue" style="border: none; text-align: center" readonly/>
                                <input type="text" value="0" id="inputCount" name="inputCount" style="border: none; text-align: left" readonly/>
                            </strong>
                        </span>
                    </div>
                    <br>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty" id="count2">
                                <input type="text" id="count" value=1>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="primary-btn btn-outline-danger">바로구매</a>
                    <a onclick="cartModal(${detail.ss_num})" class="primary-btn btn-outline-danger">장바구니 추가</a>
                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                </div>

            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">상품상세</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">배송/환불/반품 정책</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                               aria-selected="false">상품리뷰 <span>(${reviewCount})</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>상품상세정보</h6>
                                <p>${detail.ss_description}</p>

                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>환불/반품안내</h6>
                                <p>환불 안 된다 ㅅㄱ</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>리뷰</h6>
                                <p>별점 : ${reviewDetail.rv_star}<br>회원ID : ${reviewDetail.mem_id}
                                    <br> ${reviewDetail.rv_content}<br> ${reviewDetail.rv_filename}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>이 아이템만 있으면 나도 인기쟁이</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="/images/002.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">엄마 몰래 팜 급쳐</a></h6>
                        <h5>30,000원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="/images/soft1.jpeg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">여자친구랑 헤어져서 팜</a></h6>
                        <h5>150,000</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="/images/switch2.jpeg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">동생 몰래 팜 ㅍㅍ</a></h6>
                        <h5>₩130.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="/images/003.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">짝퉁 판매</a></h6>
                        <h5>25,000</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- The Modal -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <span class="close" onclick="modalClose()">&times;</span>
        <p>선택하신 상품을 장바구니에 담았습니다.<br>지금 장바구니를 확인하시겠습니까?</p>
        <div>
            <a onclick="modalClose()" style="margin: 8px;">쇼핑 계속하기</a><a onclick="goCart()">장바구니 확인</a>
        </div>

    </div>

</div>

<script>
    $(document).ready(function () {
        $('#count2 span').on('click', function () {
            let count = $('#count').val();
            let tot2 = (parseInt(count) *${detail.ss_price});

            if(count <= ${detail.ss_stock}){
                $('input[name=inputCount]').attr('value', count)
                $('input[name=inputValue]').attr('value', tot2)
            } else{
              alert("재고가 부족합니다")
            };
        });
    });


    // Get the modal
    var modal = document.getElementById("myModal");

    function cartModal(ss_num) {
        let mem_id = '<%= session.getAttribute("mem_id")%>';
        let bk_amount = $("#inputCount").val();
        console.log(mem_id);
        console.log(bk_amount);
        if (mem_id != 'null' && bk_amount > 0) {
            $.ajax({
                url : "/cart/insert"
                ,data : {"ss_num":ss_num, "bk_amount":bk_amount}
                ,type : "get"
                ,success : openModal()
            });
        } else if (mem_id != 'null' && bk_amount == 0) {
            alert("수량을 선택해주세요")
        } else {
            alert("로그인 후 이용해주세요")
        }


    }

    function modalClose() {
        modal.style.display = "none";
    }

    function openModal() {
        modal.style.display = "block";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    function goCart() {
        location.href = "/mypage/cart";
    }

</script>

<!-- End #main -->

<%@include file="../footer.jsp" %>