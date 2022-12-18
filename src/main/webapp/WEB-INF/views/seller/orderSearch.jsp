<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/12/01
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="sellerheader.jsp"%>


<main id="main" class="main">

    <div class="pagetitle">
        <h1><i class="bi bi-card-list"></i> 전체주문조회</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/seller">홈</a></li>
                <li class="breadcrumb-item">주문관리</li>
                <li class="breadcrumb-item active">전체주문조회</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">주문조회</h5>

                        <!-- General Form Elements -->
                        <form  id="form1" name="form1" method="post" action="/seller/search">
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">진행상태</label>
                                <div class="col-sm-10">
                                    <select class="form-select" aria-label="Default select example" id="dt_prog" name="dt_prog">
                                        <option value="ALL" selected>전체</option>
                                        <option value="J01">결제완료</option>
                                        <option value="J02">출고준비중</option>
                                        <option value="J03">출고완료</option>
                                        <option value="J04">배송중</option>
                                        <option value="J05">배송완료</option>
                                        <option value="J06">구매확정</option>
                                        <option value="J07">교환</option>
                                        <option value="J08">반품</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="ss_speriod" class="col-sm-2 col-form-label">판매시작일</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" id="ss_speriod" name="ss_speriod">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="ss_eperiod" class="col-sm-2 col-form-label">판매종료일</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" id="ss_eperiod" name="ss_eperiod">
                                </div>
                            </div>


                            <div class="row mb-3">
                                <label  class="col-sm-2 col-form-label">조건검색</label>
                                <div class="col-md-4" style="width: 10%">
                                    <select id="inputState" name="inputState" class="form-select">
                                        <option selected>--------</option>
                                        <option>주문번호</option>
                                        <option>상품명</option>
                                        <option>상품가격</option>
                                        <option>회원ID</option>
                                    </select>
                                </div>

                                <div class="col-sm-10" style="width: 10%;">
                                    <input type="email" class="form-control" id="keyword" name="keyword">
                                </div>

                                <div class="col-sm-10" style="width: 10%">
                                    <button class="btn btn-outline-info">검색</button>
                                </div>
                            </div>

                            <!-- Active Table -->
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">NO.</th>
                                    <th scope="col">주문번호</th>
                                    <th scope="col">상품명</th>
                                    <th scope="col">주문일자</th>
                                    <th scope="col">처리상태</th>
                                </tr>
                                </thead>
                                <tbody>
<%--                                <c:forEach var="row" items="${progSearch}" varStatus="vs">--%>
<%--                                    <tr>--%>
<%--                                        <th scope="row">${row.r}</th>--%>
<%--                                        <td>${row.od_num}</td>--%>
<%--                                        <td>${row.ss_name}</td>--%>
<%--                                        <td>${row.od_date}</td>--%>
<%--                                        <td>${row.dt_prog}</td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>
                                </tbody>
                            </table>
                            <!-- End Active Table -->
                        </form><!-- End General Form Elements -->


                        <nav class="pagination justify-content-center">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>

            </div>
        </div>
    </section>

</main>
<!-- End #main -->


<jsp:include page="sellerfooter.jsp"></jsp:include>