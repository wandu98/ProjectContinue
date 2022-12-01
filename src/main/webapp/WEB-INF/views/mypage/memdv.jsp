<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">배송지명</th>
                            <th>수령인</th>
                            <th>연락처</th>
                            <th>주소</th>
                            <th>수정</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="shoping__cart__item">
                                <img src="img/cart/cart-1.jpg" alt="">
                                <h5>집</h5>
                            </td>
                            <td class="shoping__cart__price">
                                구천우
                            </td>
                            <td class="shoping__cart__quantity">
                                010-4893-7777
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
                                <h5>회사</h5>
                            </td>
                            <td class="shoping__cart__price">
                                김주완
                            </td>
                            <td class="shoping__cart__quantity">
                                010-4363-5464
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
                                <h5>Organic Bananas</h5>
                            </td>
                            <td class="shoping__cart__price">
                                최다은
                            </td>
                            <td class="shoping__cart__quantity">
                                010-1234-5678
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
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="#" class="primary-btn cart-btn cart-btn-right">
                        배송지 등록</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->


<jsp:include page="../footer.jsp"></jsp:include>
