<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
    <title>User Table</title>
    <style>
        table {
            width: 95%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #1d1219;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color:#fff
        }
        
        th {
            background-color: #1d1219;
            color: white;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 2px;
            background-color: #150202;
            color:#fff;
        }
        .header h1 {
            font-size: 40px;
            font-size: 50;
        }
        .header img {
            height: 50px;
        }
        .nav-links {
            display: flex;
        }
        .nav-links a {
            margin-right: 100px;
            text-decoration: none;
            color: #f0e9e9;
            font-size: 25px;
        }
        .bg{
         background-image:url("https://th.bing.com/th?id=OIP.D4dznvO4PSQyDPFMTmkoOAHaFd&w=291&h=214&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2");
         background-repeat:repeat;
         background-size:1200px;
         
         }
    </style>
</head>
<body class="bg">
    <div class="header">
        <div>
            <img src="https://th.bing.com/th/id/OIP.1F8MEvRyPkaEPL5rBjnSAQHaEy?w=209&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="College Logo">
        </div>
        <div>
            <h1>RADISSAIN HOTEL</h1>
        </div>
        <div class="nav-links">
            <a href="index.html">Home</a>
            
            <a href="adminlog.html">Logout</a>
        </div>
    </div>
    
    <center>
        <table style="width: 90%;" class="">
            <tr style="height: 45px;">
                <th>Name</th>
                <th>Room</th>
                <th>Date</th>
                <th>Gender</th>
                <th>Mail</th>
                <th>Number</th>
            </tr>
            <% 
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
                    Statement stmt = conn.createStatement();
                    String sql = "SELECT * FROM register";
                    ResultSet rs = stmt.executeQuery(sql);

                    while (rs.next()) {
            %>
            <tr style="height: 40px;">
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
            </tr>
            <% 
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </table>
    </center>
</body>
</html>