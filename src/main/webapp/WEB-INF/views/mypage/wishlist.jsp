<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/images/002.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Wish List</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>Wish List</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">상품</th>
                            <th>가격</th>
                            <th>배송비</th>
                            <th>합계</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="shoping__cart__product">
                                <table>
                                    <tr>
                                        <td><img src="/images/1420a6b1f1729de557d0046252e27a5c.jpg" alt="" style="max-width: 80px"></td>
                                        <td><h6>amiibo 잉클링[옐로]/옥토링[블루]/꼬마연어 아미보 3종 세트 [스플래툰 시리즈]</h6></td>
                                    </tr>
                                </table>
                            </td>
                            <td class="shoping__cart__price">
                                60,000원
                            </td>
                            <td class="shoping__cart__price">
                                2,500원
                            </td>
                            <td class="shoping__cart__total">
                                62,500원
                            </td>
                            <td class="shoping__cart__item__close">
                                <span class="icon_close"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="shoping__cart__product">
                                <table>
                                    <tr>
                                        <td><img src="/images/001.jpg" alt="" style="max-width: 80px"></td>
                                        <td><h5>SWITCH 본체 네온블루&네온레드(OLED 모델)</h5></td>
                                    </tr>
                                </table>
                            </td>
                            <td class="shoping__cart__price">
                                415,000원
                            </td>
                            <td class="shoping__cart__price">
                                무료
                            </td>
                            <td class="shoping__cart__total">
                                415,000원
                            </td>
                            <td class="shoping__cart__item__close">
                                <span class="icon_close"></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="#" class="primary-btn cart-btn cart-btn-right">위시리스트 비우기</a>
                    <a href="#" class="primary-btn cart-btn cart-btn-right" style="margin-right: 1%">전체상품주문</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- shoping Cart Section End -->

<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__pagination blog__pagination wishlist__pagination">
                            <a href="#"><i class="fa fa-long-arrow-left"></i></a>
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<jsp:include page="../footer.jsp"></jsp:include>
