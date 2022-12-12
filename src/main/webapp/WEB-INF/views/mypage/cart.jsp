<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/images/002.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
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
                                    <input type="hidden" id="ss_price${vs.index}" name="ss_price" value="${row.ss_price}">
                                    <fmt:formatNumber type="currency" value="${row.ss_price}" groupingUsed="true"></fmt:formatNumber>
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input id="bk_amount${vs.index}" name="bk_amount" type="text" value="${row.bk_amount}">
                                        </div>
                                    </div>
                                </td>
                                <td class="shoping__cart__total" id="total${vs.index}">
<%--                                    <fmt:formatNumber value="${row.total}" type="currency" groupingUsed="true"></fmt:formatNumber>--%>
                                </td>
                                <td class="shoping__cart__item__close">
                                    <form id="form1" name="form1" method="post" action="/cart/delete">
                                        <input type="hidden" id="bk_num" name="bk_num" value="${row.bk_num}">
                                        <span class="icon_close" onclick="bkDelete()"></span>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="/sales" class="primary-btn cart-btn">쇼핑하기</a>
                    <a href="/cart/allClear" class="primary-btn cart-btn cart-btn-right"></span>
                        장바구니 비우기</a>
                </div>
            </div>
            <div class="col-lg-6">
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                    <ul>
                        <li>Total <span><fmt:formatNumber value="${total}" groupingUsed="true" type="currency"></fmt:formatNumber></span></li>
                    </ul>
                    <a href="/sales/checkout" class="primary-btn" style="background-color: red">주문하기</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

<script>
    function bkDelete() {
        if (confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")) {
            $("#form1").submit();
        }
    }



</script>

<jsp:include page="../footer.jsp"></jsp:include>
