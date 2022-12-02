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

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">주소</th>
                            <th>수령인</th>
                            <th>연락처</th>
                            <th>별칭</th>
                            <th>수정</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${list}">
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="img/cart/cart-1.jpg" alt="">
                                    <h5>${row.mem_dvadr1} ${row.mem_dvadr2}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    ${row.mem_dvinfo}
                                </td>
                                <td class="shoping__cart__quantity">
                                    ${row.mem_dvphone}
                                </td>
                                <td class="shoping__cart__total">
                                    ${row.mem_dvnick}
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
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="memdvForm" class="primary-btn cart-btn cart-btn-right">
                        배송지 등록</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->


<jsp:include page="../footer.jsp"></jsp:include>
