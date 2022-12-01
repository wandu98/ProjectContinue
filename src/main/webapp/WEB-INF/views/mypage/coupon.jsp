<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>

<!-- 쿠폰 관리 Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">쿠폰명</th>
                            <th>쿠폰명</th>
                            <th>할인율</th>
                            <th>사용기간</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="shoping__cart__item">
                                <img src="img/cart/cart-1.jpg" alt="">
                                <h5>회원가입 축하 쿠폰</h5>
                            </td>
                            <td class="shoping__cart__price">
                                $55.00
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="shoping__cart__total">
                                $110.00
                            </td>
                            <td class="shoping__cart__item__close">
                                <span class="icon_close"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="shoping__cart__item">
                                <img src="img/cart/cart-2.jpg" alt="">
                                <h5>생일 쿠폰</h5>
                            </td>
                            <td class="shoping__cart__price">
                                $39.00
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="shoping__cart__total">
                                $39.99
                            </td>
                            <td class="shoping__cart__item__close">
                                <span class="icon_close"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="shoping__cart__item">
                                <img src="img/cart/cart-3.jpg" alt="">
                                <h5>첫 결제 이벤트 쿠폰</h5>
                            </td>
                            <td class="shoping__cart__price">
                                $69.00
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="shoping__cart__total">
                                $69.99
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
        <div class="product__pagination blog__pagination wishlist__pagination">
            <a href="#"><i class="fa fa-long-arrow-left"></i></a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
        </div>


        <br><br><br><br><hr><br><br><br><br>

        <div class="blog__sidebar__item">
            <h4>적립금</h4>
        </div>

        <%--    적립금    --%>
        <div class="shoping__checkout">
            <ul>
                <li>누적 적립금 <span>10,000</span></li>
                <li>가용 적립금 <span>2,000</span></li>
            </ul>
        </div>

        <br><br><br>

        <div class="blog__sidebar__item">
            <h4>적립 내역(만들까 말까?)</h4>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">쿠폰명</th>
                            <th>쿠폰명</th>
                            <th>할인율</th>
                            <th>사용기간</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="shoping__cart__item">
                                <img src="img/cart/cart-1.jpg" alt="">
                                <h5>회원가입 축하 쿠폰</h5>
                            </td>
                            <td class="shoping__cart__price">
                                $55.00
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="shoping__cart__total">
                                $110.00
                            </td>
                            <td class="shoping__cart__item__close">
                                <span class="icon_close"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="shoping__cart__item">
                                <img src="img/cart/cart-2.jpg" alt="">
                                <h5>생일 쿠폰</h5>
                            </td>
                            <td class="shoping__cart__price">
                                $39.00
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="shoping__cart__total">
                                $39.99
                            </td>
                            <td class="shoping__cart__item__close">
                                <span class="icon_close"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="shoping__cart__item">
                                <img src="img/cart/cart-3.jpg" alt="">
                                <h5>첫 결제 이벤트 쿠폰</h5>
                            </td>
                            <td class="shoping__cart__price">
                                $69.00
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="shoping__cart__total">
                                $69.99
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
    </div>

</section>
<!-- 쿠폰 관리 Section End -->


<jsp:include page="../footer.jsp"></jsp:include>
