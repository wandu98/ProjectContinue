<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../header.jsp"></jsp:include>


<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>Profile</h4>
            <form action="#">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="row">
                            <div class="col-lg-4">
                                <img src="/images/profile/${meminfo.mem_pic}">
                            </div>
                            <div class="col-lg-8">
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td>닉네임(회원 ID)</td>
                                        <td>${meminfo.mem_nick}(${meminfo.mem_id})<a style="float: right" href="/mypage/memmodify">회원 정보 수정</a></td>
                                    </tr>
                                    <tr>
                                        <td>회원등급</td>
                                        <td>${meminfo.mem_grade}</td>
                                    </tr>
                                    <tr>
                                        <td>가입일</td>
                                        <td>${meminfo.mem_joindate}</td>
                                    </tr>
                                    <tr>
                                        <td>1:1 문의 수</td>
                                        <td>${qslist}</td>
                                    </tr>
                                    <tr>
                                        <td>구매평 수</td>
                                        <td>${revlist}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <br><br>


                        <div class="checkout__input">
                            <p>온도</p>
                            <div class="progress">
                                <div class="progress-bar" style="width:70%">70%</div>
                            </div>
                        </div>

                        <!-- 주문처리현황 Section Begin -->
                        <section class="contact spad">
                            <div class="checkout__input">
                                <h5>주문 처리 현황</h5>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/card-approve-icon.png" style="width: 25%">
                                            <h5>결제완료</h5>
                                            <p>${detailcount[0]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/goods-contents-icon.png" style="width: 20%">
                                            <h5>출고준비중</h5>
                                            <p>${detailcount[1]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/product-package-delivered-icon.png" style="width: 25%">
                                            <h5>출고완료</h5>
                                            <p>${detailcount[2]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/logistic-truck-icon.png" style="width: 45%">
                                            <h5>배송중</h5>
                                            <p>${detailcount[3]}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/door-service-icon.png" style="width: 25%">
                                            <h5>배송완료</h5>
                                            <p>${detailcount[4]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/purchase2.png" style="width:25%">
                                            <h5>구매확정</h5>
                                            <p>${detailcount[5]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/product-replacement-icon.png" style="width: 25%">
                                            <h5>교환</h5>
                                            <p>${detailcount[6]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/return.png" style="width: 25%">
                                            <h5>반품</h5>
                                            <p>${detailcount[7]}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- 주문처리현황 Section End -->

                        <!-- 모집현황 Section Begin -->
                        <section class="shoping-cart spad">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="shoping__cart__table">
                                            <table>
                                                <thead>
                                                <tr>
                                                    <th class="shoping__product">방 제목</th>
                                                    <th>게임명</th>
                                                    <th>참여인원수</th>
                                                    <th>종료일</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="row" items="${recruitlist}" varStatus="vs">
                                                <tr>
                                                    <td class="shoping__cart__item">
                                                        <img src="/images/001.jpg" alt="">
                                                        <h5>${rcrlist[vs.index].rcrbrd_subject}</h5>
                                                    </td>
                                                    <td class="shoping__cart__price">
                                                        ${row.gm_name}
                                                    </td>
                                                    <td class="shoping__cart__quantity">
                                                        <h5>${rcrcount[vs.index]}</h5>
                                                    </td>
                                                    <td class="shoping__cart__total">
                                                        ${rcrlist[vs.index].rcrbrd_edate}
                                                    </td>
                                                    <td class="shoping__cart__item__close">
                                                        <span class="icon_close"></span>
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
                        <!-- 모집현황 Section End -->

                        <!-- Featured Section Begin -->
                        <section class="featured spad">
                            <div class="container">
                                <div class="row featured__filter">
                                    <div class="col-lg-12 mix oranges fresh-meat">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="#">구매 기록<p>고객님께서 구매하신 상품의 내역을 확인하실 수 있습니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix vegetables fastfood">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="/mypage/wishlist">위시리스트<p>관심상품으로 등록하신 상품의 목록을 보여드립니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix vegetables fresh-meat">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="/mypage/coupon">쿠폰 및 적립금 내역<p>고객님이 보유하고 계신 쿠폰내역 및 적립금을 보여드립니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix fastfood oranges">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="/mypage/review">후기 관리<p>고객님께서 작성하신 상품 후기를 관리하는 공간입니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix fresh-meat vegetables">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="/mypage/memdv">배송 주소록<p>자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- Featured Section End -->
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<jsp:include page="../footer.jsp"></jsp:include>
