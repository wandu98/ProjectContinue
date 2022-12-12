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


            </div>
        </div>

        </div>
        </div>
    </section>

</main>
<!-- End #main -->

<%@include file="sellerfooter.jsp" %>



