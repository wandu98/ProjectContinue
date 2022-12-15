<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-14
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="container">
    <h4>공지사항</h4>
    <p>notice</p>
    <br>
    <div name="NTDetail" id="NTDetail">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>제목&nbsp;&nbsp;&nbsp;&nbsp;${ntdetail.nt_title}</th>
            </tr>

            <tr>
                <td>작성일&nbsp;&nbsp;&nbsp;&nbsp;${ntdetail.nt_regdate}</td>
            </tr>
            <tr>
                <td>조회수&nbsp;&nbsp;&nbsp;&nbsp;${ntdetail.nt_views}</td>
            </tr>
            </thead>
            <tbody>
                <td>
                    ${ntdetail.nt_cmt}
                </td>
            </tbody>
        </table>
        <c:if test="${admin_id eq 'admin'}">
        <form class="modal-footer" method="post">
            <input type="hidden" id="nt_num" name="nt_num" value="${ntdetail.nt_num}">
            <button type="button" class="btn btn-info">수정</button>
            <button type="button" class="btn btn-danger" onclick="ntDeleteConfirm(this.form)">삭제</button>
        </form>
        </c:if>
    </div>
</div>


<script>
    function ntDeleteConfirm(form) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            form.action = "/notice/Delete";
            form.submit();
        } else {
            location.href = "#";
        }
    }
</script>
<%@ include file="../footer.jsp" %>