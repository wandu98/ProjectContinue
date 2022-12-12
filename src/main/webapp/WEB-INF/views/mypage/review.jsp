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
                    <h2>Review</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>Review</span>
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
                            <th></th>
                            <th class="shoping__product" style="padding-left: 5%">내용</th>
                            <th>별점</th>
                            <th style="width: 10%">삭제</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${rvlist}" varStatus="vs">
                            <tr>
                                <td class="shoping__cart__price">
                                    1
                                </td>
                                <td class="shoping__cart__item">
                                    <img src="img/cart/cart-1.jpg" alt="">
                                    <h5 onclick="rvDetail(${row.rv_num})">${row.rv_content}</h5>
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="${row.rv_star}">
                                        </div>
                                    </div>
                                </td>
                                <td colspan="2" class="shoping__cart__item__close" style="text-align: center">
                                    <form id="form1" name="form1" method="post" action="/review/delete">
                                        <input type="hidden" id="rv_num" name="rv_num" value="${row.rv_num}">
                                        <span class="icon_close" onclick="rvDelete()"></span>
                                    </form>
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
<!-- Shoping Cart Section End -->

<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__pagination blog__pagination wishlist__pagination">
                            <!-- 페이지 리스트 -->
                            <c:if test="${requestScope.count>0}">
                                <!-- 전체 페이지 수 -->
                                <c:set var="pageCount" value="${requestScope.totalPage}"></c:set>

                                <!-- 현재 보고 있는 페이지의 페이지 묶음 시작 페이지 -->
                                <c:set var="startPage" value="${requestScope.startPage}"></c:set>
                                <!-- 현재 보고 있는 페이지의 페이지 묶음 마지막 페이지 -->
                                <c:set var="endPage" value="${requestScope.endPage}"></c:set>

                                <div class="content" style="text-align: center">
                                    <!-- endPage조정 -->
                                    <!-- 전체 페이지가 22라면 세번째 페이지 묶음은 21, 22만 나오면 됨. -->
                                    <c:if test="${endPage>pageCount}">
                                        <c:set var="endPage" value="${pageCount+1}"></c:set>
                                    </c:if>

                                    <c:if test="${startPage>0}"> <!-- 첫번째 페이지 묶음이 아니라면 -->
                                        <a href="/mypage/review?pageNum=${startPage}">[이전]</a>
                                    </c:if>

                                    <!-- 페이지 표시 -->
                                    <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
                                        <c:choose>
                                            <c:when test="${pageNum==i}"><span style="font-weight: bold">${i}</span></c:when>
                                            <c:when test="${pageNum!=i}"><a href="/mypage/review?pageNum=${i}">[${i}]</a></c:when>
                                        </c:choose>
                                    </c:forEach>

                                    <!-- 현재 페이지 묶음의 마지막 페이지보다 페이지가 더 존재하면 -->
                                    <c:if test="${endPage<=pageCount}">
                                        <a href="/mypage/review?pageNum=${startPage+11}">[다음]</a>
                                    </c:if>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<script type="text/javascript">
    function rvDelete() {
        if (confirm("해당 리뷰를 삭제하시겠습니까?")) {
            $("form1").submit();
        }
    }
</script>

<jsp:include page="../footer.jsp"></jsp:include>
