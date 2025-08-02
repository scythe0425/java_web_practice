package org.test.hellowebapp_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/nameApp/names")
public class NameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Object obj = session.getAttribute("names");
        List<String> names = null;
        if (obj instanceof List<?>) {
            names = (List<String>) obj;
        }
        if (names == null) {
            names = new ArrayList<>();
        }

        // 포워딩용 request attribute에 리스트 전달
        request.setAttribute("names", names);

        // nameApp/list.jsp로 포워딩
        request.getRequestDispatcher("/nameApp/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        Object obj = session.getAttribute("names");
        List<String> names = null;
        if (obj instanceof List<?>) {
            names = (List<String>) obj;
        }
        if (names == null) {
            names = new ArrayList<>();
        }

        String username = request.getParameter("username");
        String deleteName = request.getParameter("deleteName");

        if (deleteName != null && !deleteName.trim().isEmpty()) {
            names.remove(deleteName.trim());
        } else if (username != null && !username.trim().isEmpty()) {
            names.add(username.trim());
        }

        session.setAttribute("names", names);

        // 이름 추가/삭제 후 목록(GET) 보러가기 리다이렉트
        response.sendRedirect(request.getContextPath() + "/nameApp/names");
    }
}
