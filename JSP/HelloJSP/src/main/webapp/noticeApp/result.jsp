<%--
  Created by IntelliJ IDEA.
  User: scyth
  Date: 8/2/2025
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List" %>

<%
  // 세션에서 이름 리스트 가져오기 (타입 안전하게)
  Object obj = session.getAttribute("names");
  List<String> names = null;
  if (obj instanceof List<?>) {
    names = (List<String>) obj;
  }
  if (names == null) {
    names = new ArrayList<>();
  }

  // 삭제 요청 처리: 파라미터 "deleteName"이 있으면 해당 이름 삭제
  String deleteName = request.getParameter("deleteName");
  if (deleteName != null && !deleteName.trim().isEmpty()) {
    names.remove(deleteName.trim());
  }

  // 새 이름 추가 처리
  String username = request.getParameter("username");
  if (username != null && !username.trim().isEmpty()) {
    names.add(username.trim());
  }

  // 세션에 저장
  session.setAttribute("names", names);
%>

<html>
<head>
  <title>이름 게시판</title>
</head>
<body>
<h2>입력된 이름 게시판</h2>

<!-- 이름 입력 폼 -->
<form action="result.jsp" method="post">
  이름: <input type="text" name="username" />
  <input type="submit" value="추가" />
</form>

<ul>
  <% for (String name : names) { %>
  <li>
    <%= name %>
    <!-- 삭제를 위한 링크 + 버튼 -->
    <form action="result.jsp" method="post" style="display:inline;">
      <input type="hidden" name="deleteName" value="<%= name %>" />
      <input type="submit" value="삭제" onclick="return confirm('정말 이 이름을 삭제할까요?');" />
    </form>
  </li>
  <% } %>
</ul>

<a href="input.jsp">처음 화면으로 돌아가기</a>

</body>
</html>
