<%--
  Created by IntelliJ IDEA.
  User: scyth
  Date: 8/2/2025
  Time: 10:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List" %>


<html>
<head><title>이름 게시판</title></head>
<body>
<h2>입력된 이름 게시판</h2>

<ul>
    <%
        List<String> names = (List<String>) request.getAttribute("names");
        if (names != null) {
            for (String name : names) {
    %>
    <li>
        <%= name %>
        <form action="names" method="post" style="display:inline;">
            <input type="hidden" name="deleteName" value="<%= name %>" />
            <input type="submit" value="삭제" onclick="return confirm('정말 이 이름을 삭제할까요?');" />
        </form>
    </li>
    <%
            }
        }
    %>
</ul>

<a href="input.jsp">이름 추가하기</a>
</body>
</html>

