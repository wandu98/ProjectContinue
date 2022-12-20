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
        <h1>회원 목록</h1>
        <nav class="col-lg-6">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin">Home</a></li>
                <li class="breadcrumb-item active">회원 목록(등급 수정)</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div>
                            <!-- Table with hoverable rows -->
                            <table class="table table-hover" style="text-align: center; display:table">
                                <thead>
                                <tr>
                                    <th scope="col" style="width: 8%">회원 ID</th>
                                    <th scope="col" style="width: 8%">이름</th>
                                    <th scope="col" style="width: 10%">닉네임</th>
                                    <th scope="col" style="width: 20%">주소</th>
                                    <th scope="col" style="width: 12%">연락처</th>
                                    <th scope="col" style="width: 12%">이메일</th>
                                    <th scope="col" style="width: 10%">생년월일</th>
                                    <th scope="col" style="width: 2%">등급</th>
                                    <th scope="col" style="width: 5%">좋아요</th>
                                    <th scope="col" style="width: 5%">신고</th>
                                    <th scope="col" style="width: 25%">가입일</th>
                                </tr>
                                </thead>
                                <tbody id="listAjax">
                                <c:forEach var="mem" items="${memlist}" varStatus="vs">
                                    <tr id="showMem${mem.mem_id}"  onclick="showMemInfo('${mem.mem_id}')">
                                        <th scope="row">${mem.mem_id}</th>
                                        <td>${mem.mem_name}</td>
                                        <td>${mem.mem_nick}</td>
                                        <td>${mem.mem_adr1} ${mem.mem_adr2}</td>
                                        <td>${mem.mem_phone}</td>
                                        <td>${mem.mem_email}</td>
                                        <td>${mem.mem_birth}</td>
                                        <td>${mem.mem_grade}</td>
                                        <td>${mem.good}</td>
                                        <td>${mem.buyer_bad}</td>
                                        <td>${mem.mem_joindate}</td>
                                    </tr>
                                    <tr id="hideMem${mem.mem_id}" style="display: none">
                                        <th scope="row"><span onclick="showMemInfo('${mem.mem_id}')">${mem.mem_id}</span></th>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.mem_name}</span></td>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.mem_nick}</span></td>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.mem_adr1} ${mem.mem_adr2}</span></td>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.mem_phone}</span></td>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.mem_email}</span></td>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.mem_birth}</span></td>
                                        <td>
                                            <select id="grade${mem.mem_id}">
                                                <option <c:if test="${mem.mem_grade.toLowerCase()=='vip'}">selected</c:if>>VIP</option>
                                                <option <c:if test="${mem.mem_grade.toLowerCase()=='gold'}">selected</c:if>>GOLD</option>
                                                <option <c:if test="${mem.mem_grade.toLowerCase()=='silver'}">selected</c:if>>SILVER</option>
                                                <option <c:if test="${mem.mem_grade.toLowerCase()=='bronze'}">selected</c:if>>BRONZE</option>
                                                <option <c:if test="${mem.mem_grade.toLowerCase()=='new'}">selected</c:if>>NEW</option>
                                            </select>
                                        </td>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.good}</span></td>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.buyer_bad}</span></td>
                                        <td><span onclick="showMemInfo('${mem.mem_id}')">${mem.mem_joindate}</span></td>
                                        <td><button class="btn btn-outline-warning" onclick="modify('${mem.mem_id}')">수정</button></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- End Table with hoverable rows -->
                        </div>
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
                                            <a class="page-link" href="/admin/memList?pageNum=${startPage}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
                                        <c:choose>
                                            <c:when test="${pageNum==i}"><li class="page-item page-link">${i}</li></c:when>
                                            <c:when test="${pageNum!=i}"><li class="page-item"><a class="page-link" href="/admin/memList?pageNum=${i}">${i}</a></li></c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${endPage<=pageCount}">
                                        <li class="page-item">
                                            <a class="page-link" href="/admin/memList?pageNum=${startPage+11}" aria-label="Next">
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

    function showMemInfo(mem_id) {
        let status = $("#hideMem"+mem_id).css("display")
        if (status == "none") {
            $("#hideMem"+mem_id).css("display", "");
            $("#showMem"+mem_id).css("display", "none");
        } else {
            $("#hideMem"+mem_id).css("display", "none");
            $("#showMem"+mem_id).css("display", "");
        }
    }

    function modify(mem_id) {
        console.log(mem_id);
        let mem_grade = $("#grade"+mem_id).val();
        console.log(mem_grade);
        location.replace("/admin/gradeModify/"+mem_id+"&"+mem_grade);
    }


</script>