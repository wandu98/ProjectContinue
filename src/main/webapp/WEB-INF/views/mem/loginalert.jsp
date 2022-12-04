<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-02
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginalert</title>
</head>
<body>
<script type="text/javascript">
    let message = "${msg}";
    alert(message);
    location.href = "/mem/login";
</script>

</body>
</html>