package com.test_bca.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Delcare and Create Session
        HttpSession session = request.getSession(false);

        // Always reset user
        String user = session.getAttribute("userId") != null ? (String) session.getAttribute("userId") : null;
        // Conditinal if already logged in then reset session
        if (user != null) {
            session.removeAttribute("userId");
        }

        // Get request parameter
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        // Conditional for Login
        if ("007".equals(userId) && "007".equals(password)) {
            // Set session and redirect
            session.setAttribute("userId", userId);
            response.sendRedirect("welcome.jsp");
        } else {
            // Set session and redirect
            session.setAttribute("error", "User ID or Password is incorrect");
            response.sendRedirect("index.jsp");
        }
    }
}
