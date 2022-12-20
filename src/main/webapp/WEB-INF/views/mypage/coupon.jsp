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


<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>쿠폰 및 적립금</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>My Page</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 쿠폰 관리 Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table checkout__form">
                    <h4>쿠폰</h4>
                    <table>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>쿠폰명</th>
                            <th colspan="2">사용기간</th>
                            <th>할인율</th>
                        </tr>

                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${couponlist}" varStatus="vs">
                        <tr>
                            <td style="width: 8%">
                                ${vs.index+1}
                            </td>
                            <td class="shoping__cart__product" style="width: 30%">
                                <h5>${row.cp_name}</h5>
                            </td>
                            <td colspan="2" class="shoping__cart__price" style="font-weight: 400;">
                                ${row.cp_speriod} ~ ${row.cp_eperiod}
                            </td>
                            <td class="shoping__cart__total" style="font-weight: 400">
                                ${row.cp_percent}%
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <section class="shoping-cart spad">
            <div class="checkout__form">
                <h4>적립금</h4>
            </div>
            <%--    적립금    --%>
            <div class="shoping__checkout" style="width: 70%; margin: auto">
                <ul>
                    <li>누적 적립금 <span>${point.apoint}</span></li>
                    <li>가용 적립금 <span>${point.upoint}</span></li>
                </ul>
            </div>
        </section>

        <section class="checkout spad">
            <div class="container">
                <div class="checkout__form">
                    <h4>적립 내역</h4>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__table">
                                <table>
                                    <thead>
                                    <tr>
                                        <th>주문번호</th>
                                        <th>상품명</th>
                                        <th>적립 마일리지</th>
                                        <th>주문일자</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="row" items="${mileagelist}" varStatus="vs">
                                        <tr>
                                            <td class="shoping__cart__price" style="font-weight: 400">
                                                ${row.od_num}
                                            </td>
                                            <td class="shoping__cart__product">
                                                ${row.ss_name}
                                            </td>
                                            <td class="shoping__cart__price" style="font-weight: 400; width: 20%">
                                                ${row.pmileage}
                                            </td>
                                            <td class="shoping__cart__quantity">
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
            </div>
        </section>
    </div>
</section>
<!-- 쿠폰 관리 Section End -->


<jsp:include page="../footer.jsp"></jsp:include>
