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
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="notice" items="${noticelist}">
                <tr style="cursor: pointer" onclick="location.href='/notice/Detail/${notice.nt_num}'">
                    <td>${notice.nt_num}</td>
                    <td>${notice.nt_title}</td>
                    <td>${notice.nt_regdate}</td>
                    <td>${notice.nt_views}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</div>


<script>

</script>


<%@ include file="../footer.jsp" %>