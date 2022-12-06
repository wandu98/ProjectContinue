<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- auth.jsp -->
<!-- 로그인 상태 정보 확인 -->
<%
    String mem_id = "";
    String mem_pw = "";
    String mem_grade = "";

    if (session.getAttribute("mem_id") == null || session.getAttribute("mem_pw") == null || session.getAttribute("mem_grade") == null) {
        // 로그인 하지 않았다면
        mem_id = "guest";
        mem_pw = "guest";
        mem_grade = "guest";
    } else {
        // 로그인 성공했다면
        mem_id = (String) session.getAttribute("mem_id");
        mem_pw = (String) session.getAttribute("mem_pw");
        mem_grade = (String) session.getAttribute("mem_grade");
    } // if end

%>