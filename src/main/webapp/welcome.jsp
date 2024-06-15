<%@ page import="java.util.*" %>
<%@ page import="com.test_bca.entity.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- Protected welcome page --%>
<% if (session.getAttribute("userId") == null) {
    // Set session and reset message
    session.setAttribute("error", "Invalid credentials, please login first !");
    response.sendRedirect("index.jsp");
} %>

<%-- List Students --%>
<%
    List<Student> students = List.of(
            new Student("S1", "Andi", 35, "Dep 1"),
            new Student("S2", "Bandi", 70, "Dep 1"),
            new Student("S3", "Caca", 60, "Dep 1"),
            new Student("S4", "Dara", 90, "Dep 1"),
            new Student("S5", "Emir", 30, "Dep 2"),
            new Student("S6", "Fadhli", 32, "Dep 3"),
            new Student("S7", "Galih", 70, "Dep 3"),
            new Student("S8", "Huto", 20, "Dep 3")
    );

    // Count Pass

    // Declare KKM
    int kkm = 60;

    // Map Data Student
    HashMap<String, Integer> mapStudents = new HashMap<String, Integer>();

    for (Student student : students) {
        // Mapping data Pass student
        if (mapStudents.containsKey(student.getDepartment())) {
            if (student.getMark() >= kkm) {
                mapStudents.put(student.getDepartment(), mapStudents.get(student.getDepartment()) + 1);
            }
        } else {
            mapStudents.put(student.getDepartment(), 0);
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>Welcome <%= (String) session.getAttribute("userId")%>
</h1>

<table border="1">
    <thead>
    <tr>
        <th>Department</th>
        <th>Student ID</th>
        <th>Marks</th>
        <th>Pass %</th>
    </tr>
    </thead>
    <tbody>

    <%
        for (Student student : students) {
    %>

    <%
        long total = students.stream()
                .filter(i -> i.getDepartment().equals(student.getDepartment())).count();
    %>

    <tr>
        <%
            if (total > 1) {
        %>
        <td><%= student.getDepartment() %>
        </td>
        <%
        } else {
        %>
        <td><%= student.getDepartment() %>
        </td>
        <%
            }
        %>

        <td>
            <a href="#" class="student-link" data-name="<%= student.getStudentName() %>">
                <%= student.getStudentId() %>
            </a>
        </td>
        <td><%= student.getMark() %>
        </td>
        <td>
            <%
                Integer passStudent = mapStudents.get(student.getDepartment());
                double pass = (double) passStudent / total * 100;

                // Formatted
                String formattedPass = String.format("%.2f", pass).replaceAll("\\.0+$", "");
            %>

            <%= formattedPass %>
        </td>

    </tr>
    <%
        }
    %>
    </tbody>
</table>

<div style="margin-top: 20px">
    <a href="index.jsp" onclick="logout()">Logout</a>
</div>
</body>


</html>

<script>
    // Logout
    function logout() {
        <% session.removeAttribute("userId"); %>
        // Redirect ke halaman login setelah berhasil logout
        window.location.href = 'index.jsp';
    }

    // Show Student Name
    $(document).ready(function () {
        $('.student-link').click(function (e) {
            e.preventDefault();

            const studentName = $(this).data('name');
            alert('Student Name: ' + studentName);
        });
    });
</script>