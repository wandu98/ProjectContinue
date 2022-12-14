<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-12-14
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="admin_header.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>General Tables</h1>
        <nav class="col-lg-6">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin">Home</a></li>
                <li class="breadcrumb-item active">품목 목록</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div style="padding: 2%">
                            <input type="hidden" id="gm_category" name="gm_category" value="mn">
                            <select class="form-select" aria-label="Default select example"
                                    style="width: 15%; float: right" onchange="categorySelect(this.value)">
                                <option value="mn" selected>본체</option>
                                <option value="pt">타이틀 (패키지)</option>
                                <option value="dt">타이틀 (다운로드)</option>
                                <option value="dl">다운로드 추가 컨텐츠</option>
                                <option value="ol">온라인 이용권</option>
                                <option value="pn">선불 번호</option>
                                <option value="fc">무료 컨텐츠</option>
                                <option value="am">아미보</option>
                                <option value="pc">프로컨트롤러</option>
                                <option value="jc">조이콘</option>
                                <option value="ac">주변기기</option>
                            </select>
                        </div>
                        <br>
                        <div>
                            <!-- Table with hoverable rows -->
                            <table class="table table-hover" style="text-align: center; display:table">
                                <thead>
                                <tr>
                                    <th scope="col" style="width: 12%">품목 코드</th>
                                    <th scope="col" style="width: 25%">품목명</th>
                                    <th scope="col" style="width: 10%">가격</th>
                                    <th scope="col" style="width: 10%">이용 등급</th>
                                    <th scope="col" style="width: 18%">카테고리</th>
                                    <th scope="col">이미지</th>
                                    <th scope="col">수정</th>
                                </tr>
                                </thead>
                                <tbody id="listAjax">
                                <c:forEach var="game" items="${gameList}" varStatus="vs">
                                    <tr>
                                        <th scope="row">${game.gm_code}</th>
                                        <td>${game.gm_name}</td>
                                        <td>${game.gm_price}</td>
                                        <td>${game.gm_level}</td>
                                        <td>${game.gm_category}</td>
                                        <td><img src="/images/thumb/${game.gm_code}/thumb.jpg" style="width: 100px"></td>
                                        <td><button class="btn btn-outline-warning">수정</button></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- End Table with hoverable rows -->
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </section>

</main>
<%@ include file="admin_footer.jsp" %>

<script>

    function categorySelect(type) {

        $.ajax({
            type: "post",
            url: "/admin/gameList",
            data: {
                "type": type
            },
            success: function (result) {

                let message = "";

                $.each(result, function (index, value) {

                    message += "<tr>";
                    message += "<th scope='row' style='display: table-cell; vertical-align: middle'>" + value.gm_code + "</th>";
                    message += "<td style='display: table-cell; vertical-align: middle'>" + value.gm_name + "</td>";
                    message += "<td style='display: table-cell; vertical-align: middle'>" + value.gm_price + "</td>";
                    message += "<td style='display: table-cell; vertical-align: middle'>" + value.gm_level + "</td>";
                    message += "<td style='display: table-cell; vertical-align: middle'>" + value.gm_category + "</td>";
                    message += "<td style='display: table-cell; vertical-align: middle'>" + "<img src='/images/thumb/" + value.gm_code + "/thumb.jpg' style='width: 100px'>" + "</td>";
                    message += "<td><button type='button' class='btn btn-outline-warning' onclick='location.href=\"redirect:/admin/gameModify\"'>수정</button></td>";
                    message += "</tr>";
                })

                $('#listAjax').html(message);
            }
        })
    }

</script>