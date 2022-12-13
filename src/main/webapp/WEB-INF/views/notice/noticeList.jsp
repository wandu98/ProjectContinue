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
    <form name="ntlist" id="ntlist" action="noticeList">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="notice" items="${ntlist}">
                <tr>
                    <td>${notice.nt_num}</td>
                    <td>${notice.nt_title}</td>
                    <td>${notice.nt_cmt}</td>
                    <td>${notice.nt_regdate}</td>
                    <td>${notice.nt_views}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </form>
</div>


<%@ include file="../footer.jsp" %>