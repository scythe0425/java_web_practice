<%--
  Created by IntelliJ IDEA.
  User: scyth
  Date: 8/2/2025
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>이름 입력</title></head>
<body>
<h2>이름을 입력하세요</h2>
<form action="names" method="post">
  이름: <input type="text" name="username" />
  <input type="submit" value="추가" />
</form>

<a href="names">게시판 보기</a>
</body>
</html>

