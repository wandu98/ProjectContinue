<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/12/05
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="sellerheader.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
        <h1><i class="bi bi-card-list"></i> 1:1문의</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/seller">홈</a></li>
                <li class="breadcrumb-item">문의관리</li>
                <li class="breadcrumb-item active">1:1문의</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">1:1문의</h5>

                        <!-- General Form Elements -->
                        <form>
                            <div class="row mb-3">
                                <label class="row-cols-auto col-form-label">조건검색</label>
                                <div class="col-md-4" style="width: 10%">
                                    <select id="inputState" class="form-select">
                                        <option selected>--------</option>
                                        <option>상품명</option>
                                        <option>제목</option>
                                        <option>문의자</option>
                                        <option>등록일</option>
                                        <option>답변상태</option>
                                    </select>
                                </div>

                                <div class="col-sm-10" style="width: 15%;">
                                    <input type="email" class="form-control" placeholder="Search...">
                                </div>

                                <div class="col-sm-10" style="width: 10%">
                                    <button type="button" class="btn btn-outline-info">검색</button>
                                </div>
                            </div>
                            <br>
                            <!-- Active Table -->
                            <table class="table" style="vertical-align: middle">
                                <thead>
                                <tr>
                                    <th><input class="form-check-input" id="checkAll" name="checkAll" type="checkbox">
                                    </th>
                                    <th scope="col">NO.</th>
                                    <th scope="col">상품명</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">문의자</th>
                                    <th scope="col">등록일</th>
                                    <th scope="col">답변상태</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th><input class="form-check-input" name="check" type="checkbox"></th>
                                    <th scope="row">1</th>
                                    <td>닌텐도Switch OLED</td>
                                    <td>네고 가능한가요?</td>
                                    <td>nonchrono9797</td>
                                    <td>2022.12.02</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-secondary btn-sm">수정하기</button>
                                    </td>

                                </tr>
                                <tr>
                                    <th><input class="form-check-input" name="check" type="checkbox"></th>
                                    <th scope="row">2</th>
                                    <td>닌텐도Switch OLED</td>
                                    <td>네고 가능한가요?</td>
                                    <td>nonchrono9797</td>
                                    <td>2022.12.02</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-success btn-sm">답변하기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th><input class="form-check-input" name="check" type="checkbox"></th>
                                    <th scope="row">3</th>
                                    <td>닌텐도Switch OLED</td>
                                    <td>네고 가능한가요?</td>
                                    <td>nonchrono9797</td>
                                    <td>2022.12.02</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-secondary btn-sm">수정하기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th><input class="form-check-input" name="check" type="checkbox"></th>
                                    <th scope="row">4</th>
                                    <td>닌텐도Switch OLED</td>
                                    <td>네고 가능한가요?</td>
                                    <td>nonchrono9797</td>
                                    <td>2022.12.02</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-success btn-sm">답변하기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th><input class="form-check-input" name="check" type="checkbox"></th>
                                    <th scope="row">5</th>
                                    <td>닌텐도Switch OLED</td>
                                    <td>네고 가능한가요?</td>
                                    <td>nonchrono9797</td>
                                    <td>2022.12.02</td>
                                    <td>
                                        <button type="button" class="btn btn-outline-secondary btn-sm">수정하기</button>
                                    </td>
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
<!-- checkbox All Select -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //전체박스 클릭
        $("#checkAll").click(function () {
            if ($("#checkAll").prop("checked")) {
                $(".form-check-input").prop("checked", true);
            } else {
                $(".form-check-input").prop("checked", false);
            }
        });
        //전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
        $(".form-check-input").click(function () {
            if ($("input[name='check']:checked").length == 5) {
                $("#checkAll").prop("checked", true);
            } else {
                $("#checkAll").prop("checked", false);
            }
        });
    });
</script>
<!-- checkbox All Select end-->
<%@ include file="sellerfooter.jsp" %>