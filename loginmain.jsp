<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Action</title>
</head>
<body>
    <%
        String aid = request.getParameter("t1");
        String password = request.getParameter("t2");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Database connection
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbUser = "SYSTEM";
            String dbPassword = "tiger";

            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query
            String query = "SELECT * FROM signup WHERE adminid = ? AND passwd = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, aid);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                %>
                <jsp:forward page="login.html"/>
                <%
            } else {%>
                <script>alert("Invalid Email or Password");</script>
                <jsp:include page="index.html"/>
            <%
            }
        } catch (Exception e) {
            out.println("<h2>An error occurred: " + e.getMessage() + "</h2>");
        } finally {
            // Close database resources
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    %>
</body>
</html>
