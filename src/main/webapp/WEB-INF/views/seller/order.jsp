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
                        <form>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">진행상태</label>
                                <div class="col-sm-10">
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>--------------</option>
                                        <option value="1">전체</option>
                                        <option value="2">결제완료</option>
                                        <option value="3">출고준비중</option>
                                        <option value="4">출고완료</option>
                                        <option value="5">배송중</option>
                                        <option value="6">배송완료</option>
                                        <option value="7">구매확정</option>
                                        <option value="8">교환</option>
                                        <option value="9">반품</option>

                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputDate" class="col-sm-2 col-form-label">기간</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputDate" class="col-sm-2 col-form-label">판매종료</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control">
                                </div>
                            </div>


                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">조건검색</label>
                                <div class="col-md-4" style="width: 10%">
                                    <select id="inputState" class="form-select">
                                        <option selected>--------</option>
                                        <option>주문번호</option>
                                        <option>상품명</option>
                                        <option>상품가격</option>
                                        <option>회원ID</option>
                                    </select>
                                </div>

                                <div class="col-sm-10" style="width: 10%;">
                                    <input type="email" class="form-control">
                                </div>

                                <div class="col-sm-10" style="width: 10%">
                                    <button type="button" class="btn btn-outline-info">검색</button>
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
                                <tr>
                                    <th scope="row">1</th>
                                    <td>202212011451</td>
                                    <td>닌텐도Switch OLED</td>
                                    <td>2022-12-02</td>
                                    <td>결제완료</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>202212011451</td>
                                    <td>닌텐도Switch OLED</td>
                                    <td>2022-12-02</td>
                                    <td>결제완료</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>202212011451</td>
                                    <td>닌텐도Switch OLED</td>
                                    <td>2022-12-02</td>
                                    <td>결제완료</td>
                                </tr>
                                <tr class="table-success">
                                    <th scope="row">4</th>
                                    <td>202212011451</td>
                                    <td>닌텐도Switch OLED</td>
                                    <td>2022-12-02</td>
                                    <td>구매확정</td>
                                </tr>
                                <tr class="table-danger">
                                    <th scope="row">5</th>
                                    <td>202212011451</td>
                                    <td>닌텐도Switch OLED</td>
                                    <td>2022-12-01</td>
                                    <td>반품</td>
                                </tr>
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