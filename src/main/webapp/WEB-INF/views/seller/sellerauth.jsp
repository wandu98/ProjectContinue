<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- sellerauth.jsp -->
<!-- 로그인 상태 정보 확인 -->
<%
  String sl_id = "";
  String sl_pw = "";
  String sl_grade = "";

  if (session.getAttribute("sl_id") == null || session.getAttribute("sl_pw") == null || session.getAttribute("sl_grade") == null) {
    // 로그인 하지 않았다면
    sl_id = "guest";
    sl_pw = "guest";
    sl_grade = "guest";
  } else {
    // 로그인 성공했다면
    sl_id = (String) session.getAttribute("sl_id");
    sl_pw = (String) session.getAttribute("sl_pw");
    sl_grade = (String) session.getAttribute("sl_grade");
  } // if end

%>