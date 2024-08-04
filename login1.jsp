<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Process</title>
</head>
<body>
    <%-- Retrieve form input values --%>
    <% String username = request.getParameter("Uname");
       String password = request.getParameter("Pass");
    %>
    
    <%-- Establish a connection to the Oracle database --%>
    <% Class.forName("oracle.jdbc.driver.OracleDriver");
       String url = "jdbc:oracle:thin:@localhost:1521:XE";  // Replace with your Oracle connection URL
       String dbUsername = "system";  // Replace with your Oracle database username
       String dbPassword = "tiger";  // Replace with your Oracle database password
       Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
    %>
    
    <%-- Perform database operations --%>
    <% Statement stmt = con.createStatement();
       ResultSet rs = stmt.executeQuery("SELECT * FROM register");
       if (rs.next()) {
           // Successful login
           // Add your desired logic here, such as redirecting to another page
           response.sendRedirect("success.jsp");
       } else {
           // Failed login
           // Add your desired logic here, such as displaying an error message
           response.sendRedirect("error.jsp");
       }
       
       // Close resources
       rs.close();
       stmt.close();
       con.close();
    %>
</body>
</html>
