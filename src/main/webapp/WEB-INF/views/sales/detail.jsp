<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/11/29
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>



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
                             src="/images/001.jpg">
                    </div>
                    <div class="product__details__pic__slider owl-carousel">
                        <img data-imgbigurl="/images/002.jpg"
                             src="/images/002.jpg">
                        <img data-imgbigurl="/images/003.jpg"
                             src="/images/003.jpg">
                        <img data-imgbigurl="/images/004.jpg"
                             src="/images/004.jpg">
                        <img data-imgbigurl="/images/001.jpg"
                             src="/images/001.jpg">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>닌텐도 스위치 OLED</h3>
                    <div class="product__details__rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <span>(1 reviews)</span>
                    </div>
                    <div class="product__details__price">판매가  ₩50,000</div>
                        <ul>
                            <li><b>배송비</b> <span>무료</span></li>
                            <li><b>플랫폼</b> <span>SWITCH</span></li>
                            <li><b>퍼블리셔</b> <span>닌텐도</span></li>
                            <li><b>언어</b> <span>제조국-중국</span></li>
                            <li><b>이용등급</b> <span>청소년 이용불가</span></li>
                            <li><b>상품코드</b> <span>P00000CYO</span></li>
                        </ul><hr>



                    <!-- 스크롤2 영역시작 -->
                    <div class="scrollbar_box op_view_h">
                        <!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
                        <div id="totalProducts" class="">
                            <table border="1" summary="" class="op_h">
                                <colgroup>
                                    <col style="width:500px;"/>
                                    <col style="width:68px;"/>
                                </colgroup>
                                <thead><tr>
                                    <th scope="col">상품명</th>
                                    <th scope="col">가격</th>
                                </tr></thead>
                                <tbody class="product__details__text"><tr>
                                    <td>SWITCH 본체 스플래툰3 에디션(OLED 모델)</td>
                                    <td class="">
                                        <span class="quantity_price">50,000</span> <span class="mileage ">&nbsp;&nbsp;&nbsp;(<img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif"/> <span class="mileage_price">500</span>)</span>
                                    </td>
                                </tr></tbody>

                                </tbody>
                            </table>
                            <!-- //참고 -->
                        </div>
                        <!-- //참고 -->
                    </div><br>
                    <!-- //스크롤2 영역끝 -->


                    <div id="totalPrice" class="top_total_box">
                        <strong>총 상품금액</strong>(수량) : <span class="total"><strong><em>50,000</em></strong> (1개)</span>
                    </div><br>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty">
                                <input type="text" value="1">
                            </div>
                        </div>
                    </div>
                    <a href="#" class="primary-btn">바로구매</a>
                    <a href="#" class="primary-btn">장바구니 추가</a>
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
                               aria-selected="false">상품리뷰 <span>(1)</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>상품상세정보</h6>
                                <p>정보는 나무위키에서 보세요</p>

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
                                <p>노잼이었다.</p>
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




<!-- End #main -->

<jsp:include page="../footer.jsp"></jsp:include>