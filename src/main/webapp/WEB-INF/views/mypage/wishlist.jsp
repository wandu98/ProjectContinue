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
                            <th></th>
                            <th class="shoping__product" style="padding-left: 5%; text-align: center">상품</th>
                            <th>가격</th>
                            <th>배송비</th>
                            <th>합계</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${list}" varStatus="vs">
                            <tr>
                                <td class="shoping__cart__price">
                                    ${row.r}
                                </td>
                                <td class="shoping__cart__product">
                                        <img src="/images/${row.ss_img}" alt="" style="max-width: 80px"> <%--상품이미지 경로 수정해야함--%>
                                        <h5>${row.ss_name}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    ${row.ss_price}원
                                </td>
                                <td class="shoping__cart__price">
                                    ${row.dv_fee}원
                                </td>
                                <td class="shoping__cart__total">
                                    ${row.total}원
                                </td>
                                <td class="shoping__cart__item__close">
                                    <form id="form1" name="form1" method="post" action="/wishlist/delete">
                                        <input type="hidden" id="ws_num" name="ws_num" value="${row.ws_num}">
                                        <span class="icon_close" onclick="wsDelete()"></span>
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
                    <a href="/wishlist/allRemove" class="primary-btn cart-btn cart-btn-right">위시리스트 비우기</a>
                    <a href="#" class="primary-btn cart-btn cart-btn-right" style="margin-right: 1%">전체상품주문</a>
                </div>
            </div>
        </div>
        <div class="product__pagination" style="text-align: center">
            <!-- 페이지 리스트 -->
            <c:if test="${requestScope.count>0}">
                <c:set var="pageCount" value="${requestScope.totalPage}"></c:set>
                <c:set var="startPage" value="${requestScope.startPage}"></c:set>
                <c:set var="endPage" value="${requestScope.endPage}"></c:set>

                    <c:if test="${endPage>pageCount}">
                        <c:set var="endPage" value="${pageCount+1}"></c:set>
                    </c:if>

                    <c:if test="${startPage>0}"> <!-- 첫번째 페이지 묶음이 아니라면 -->
                        <a href="/mypage/wishlist?pageNum=${startPage}"><i class="fa fa-long-arrow-left"></i></a>
                    </c:if>

                    <!-- 페이지 표시 -->
                    <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
                        <c:choose>
                            <c:when test="${pageNum==i}"><span style="font-weight: bold">${i}</span></c:when>
                            <c:when test="${pageNum!=i}"><a href="/mypage/wishlist?pageNum=${i}">${i}</a></c:when>
                        </c:choose>
                    </c:forEach>

                    <!-- 현재 페이지 묶음의 마지막 페이지보다 페이지가 더 존재하면 -->
                    <c:if test="${endPage<=pageCount}">
                        <a href="/mypage/wishlist?pageNum=${startPage+11}"><i class="fa fa-long-arrow-right"></i></a>
                    </c:if>
            </c:if>
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

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<script>
    function wsDelete() {
        if (confirm("해당 상품을 위시리스트에서 삭제하시겠습니까?")) {
            $("#form1").submit();
        }
    }
</script>

<jsp:include page="../footer.jsp"></jsp:include>
