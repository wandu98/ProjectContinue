<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="sellerheader.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>리뷰목록</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">문의관리</li>
                <li class="breadcrumb-item active">Review</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">List</h5>


                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"></h5>
                                <h6><span>${fn:length(list)}</span> Reviews</h6>
                                <!-- Table with hoverable rows -->
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">회원ID</th>
                                        <th scope="col">리뷰내용</th>
                                        <th scope="col">리뷰이미지</th>
                                        <th scope="col">별점</th>
                                        <th scope="col">등록날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="row" items="${list}" varStatus="vs">
                                        <tr>

                                            <th scope="row">${row.rv_num}</th>
                                            <td>${row.mem_id}</td>
                                            <td style="width: 40%">${row.rv_content}</td>
                                            <td style="width: 20%"><img src="/images/reviews/${row.rv_filename}" style="max-width: 60%"></td>
                                            <td>${row.rv_star}</td>
                                            <td>${row.rv_date}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
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



