<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h2>구매 내역</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>구매 내역</span>
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
                            <th>주문서 번호</th>
                            <th class="shoping__product" style="text-align: center">상품</th>
                            <th>합계</th>
                            <th>주문일자</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${historylist}" varStatus="vs">
                            <tr>
                                <td class="shoping__cart__price" onclick="location.href='/sales/salesorder/${row.od_num}'" style="cursor:pointer;">
                                        ${row.od_num}
                                </td>
                                <td class="shoping__cart__product">
                                        ${historyproduct[vs.index]}
                                </td>
                                <td class="shoping__cart__price">
                                        ${row.total}원
                                </td>
                                <td class="shoping__cart__total">
                                        ${row.od_date}
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
<!-- shoping Cart Section End -->

<jsp:include page="../footer.jsp"></jsp:include>
