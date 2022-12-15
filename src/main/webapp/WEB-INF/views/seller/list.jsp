<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="sellerheader.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>상품목록</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">상품등록/리스트</li>
                <li class="breadcrumb-item active">리스트</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">상품리스트</h5>


                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">My List</h5>
                                <h6><span>${fn:length(list2)}</span> Products</h6>
                                <!-- Table with hoverable rows -->
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">상품이름</th>
                                        <th scope="col">판매가격</th>
                                        <th scope="col">판매상태</th>
                                        <th scope="col">등록날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="row" items="${list2}" varStatus="vs">
                                        <tr>

                                            <th scope="row">${row.ss_num}</th>
                                            <td>${row.ss_name}</td>
                                            <td>${row.ss_price}원</td>
                                            <td>${row.ss_status}</td>
                                            <td>${row.ss_speriod}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- End Table with hoverable rows -->
                                <c:if test="${requestScope.count>0}">
                                    <c:set var="pageCount" value="${requestScope.totalPage}"></c:set>
                                    <c:set var="startPage" value="${requestScope.startPage}"></c:set>
                                    <c:set var="endPage" value="${requestScope.endPage}"></c:set>
                                    <nav class="pagination justify-content-center">
                                        <c:if test="${endPage>pageCount}">
                                            <c:set var="endPage" value="${pageCount+1}"></c:set>
                                        </c:if>
                                        <ul class="pagination">
                                            <c:if test="${startPage>0}">
                                            <li class="page-item">
                                                <a class="page-link" href="/seller/list?pageNum=${startPage}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            </c:if>
                                            <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
                                                <c:choose>
                                                    <c:when test="${pageNum==i}"><li class="page-item page-link">${i}</li></c:when>
                                                    <c:when test="${pageNum!=i}"><li class="page-item"><a class="page-link" href="/seller/list?pageNum=${i}">${i}</a></li></c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${endPage<=pageCount}">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Blog Section Begin -->
<%--    <section class="blog spad">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-lg-8 col-md-7">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="product__pagination blog__pagination wishlist__pagination">--%>
<%--                                <!-- 페이지 리스트 -->--%>
<%--                                <c:if test="${requestScope.count>0}">--%>
<%--                                    <!-- 전체 페이지 수 -->--%>
<%--                                    <c:set var="pageCount" value="${requestScope.totalPage}"></c:set>--%>

<%--                                    <!-- 현재 보고 있는 페이지의 페이지 묶음 시작 페이지 -->--%>
<%--                                    <c:set var="startPage" value="${requestScope.startPage}"></c:set>--%>
<%--                                    <!-- 현재 보고 있는 페이지의 페이지 묶음 마지막 페이지 -->--%>
<%--                                    <c:set var="endPage" value="${requestScope.endPage}"></c:set>--%>

<%--                                    <div class="content" style="text-align: center">--%>
<%--                                        <!-- endPage조정 -->--%>
<%--                                        <!-- 전체 페이지가 22라면 세번째 페이지 묶음은 21, 22만 나오면 됨. -->--%>
<%--                                        <c:if test="${endPage>pageCount}">--%>
<%--                                            <c:set var="endPage" value="${pageCount+1}"></c:set>--%>
<%--                                        </c:if>--%>

<%--                                        <c:if test="${startPage>0}"> <!-- 첫번째 페이지 묶음이 아니라면 -->--%>
<%--                                            <a href="/seller/list?pageNum=${startPage}">[이전]</a>--%>
<%--                                        </c:if>--%>

<%--                                        <!-- 페이지 표시 -->--%>
<%--                                        <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">--%>
<%--                                            <c:choose>--%>
<%--                                                <c:when test="${pageNum==i}"><span style="font-weight: bold">${i}</span></c:when>--%>
<%--                                                <c:when test="${pageNum!=i}"><a href="/seller/list?pageNum=${i}">[${i}]</a></c:when>--%>
<%--                                            </c:choose>--%>
<%--                                        </c:forEach>--%>

<%--                                        <!-- 현재 페이지 묶음의 마지막 페이지보다 페이지가 더 존재하면 -->--%>
<%--                                        <c:if test="${endPage<=pageCount}">--%>
<%--                                            <a href="/seller/list?pageNum=${startPage+11}">[다음]</a>--%>
<%--                                        </c:if>--%>
<%--                                    </div>--%>
<%--                                </c:if>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
    <!-- Blog Section End -->

</main>
<!-- End #main -->

<%@include file="sellerfooter.jsp" %>



