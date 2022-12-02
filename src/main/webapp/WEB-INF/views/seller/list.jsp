<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/12/01
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="sellerheader.jsp"></jsp:include>

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
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">상품리스트</h5>


                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">My List</h5>

                                <!-- Table with hoverable rows -->
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">글제목</th>
                                        <th scope="col">상품이름</th>
                                        <th scope="col">판매상태</th>
                                        <th scope="col">등록날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>급쳐 스위치 ㅍㅍ</td>
                                        <td>닌텐도Switch OLED</td>
                                        <td>판매중</td>
                                        <td>2022-12-02</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>급쳐 스위치 ㅍㅍ</td>
                                        <td>닌텐도Switch OLED</td>
                                        <td>판매중</td>
                                        <td>2022-12-02</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>급쳐 스위치 ㅍㅍ</td>
                                        <td>닌텐도Switch OLED</td>
                                        <td>판매중</td>
                                        <td>2022-12-02</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>급쳐 스위치 ㅍㅍ</td>
                                        <td>닌텐도Switch OLED</td>
                                        <td>판매중</td>
                                        <td>2022-12-02</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>급쳐 스위치 ㅍㅍ</td>
                                        <td>닌텐도Switch OLED</td>
                                        <td>판매종료</td>
                                        <td>2022-11-02</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <!-- End Table with hoverable rows -->

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

<jsp:include page="sellerfooter.jsp"></jsp:include>



