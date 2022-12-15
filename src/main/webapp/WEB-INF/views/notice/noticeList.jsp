<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="container">
    <h3>공지사항</h3>
    <br>
    <div class="blog__sidebar__search" >
        <form action="#" style="text-align: center; height: 50px">
            <select name="col">
                <option value="subject_content">제목+내용</option>
                <option value="subject">제목</option>
                <option value="content">내용</option>
                <option value="wname">작성자</option>
            </select>
            <input type="text" name="word" id="word" placeholder="Search...">
            <button type="submit"><span class="icon_search"></span></button>
        </form>
    </div>

    <div name="ntlist" id="ntlist">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">
                    <input class="form-check-input" id="checkAll" name="checkAll" type="checkbox">
                </th>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="notice" items="${noticelist}">
                <tr style="cursor: pointer" onclick="location.href='/notice/Detail/${notice.nt_num}'">
                    <th scope="col">
                        <input class="form-check-input" name="check" type="checkbox">
                    </th>
                    <td>${notice.nt_num}</td>
                    <td>${notice.nt_title}</td>
                    <td>${notice.nt_regdate}</td>
                    <td>${notice.nt_views}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="modal-footer" >
            <input type="hidden" id="nt_num" name="nt_num" value="${ntDelete.nt_num}">
            <button type="button" class="btn btn-info">수정</button>
            <button type="button" class="btn btn-danger" onclick="deleteConfirm(this.form)">삭제</button>
        </div>

    </div>


</div>

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
<!-- checkbox All Select end -->



<%@ include file="../footer.jsp" %>