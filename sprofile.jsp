<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
    // JDBC connection parameters
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String username = "SYSTEM";
    String password = "tiger";

    // Establish the database connection
    Connection connection = null;
    try {
        // Register the JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Create the connection
        connection = DriverManager.getConnection(url, username, password);
        
        // Fetch data from student_profile table
        ResultSet studentProfileResultSet = connection.createStatement().executeQuery("SELECT * FROM register");

        // Fetch data from personal_details table
        //ResultSet personalDetailsResultSet = connection.createStatement().executeQuery("SELECT * FROM personal_details WHERE username = '21CSE01'");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <style>
        <style>
    /* CSS styles for the table */
    .table-container {
        border: 1px solid #ddd;
        padding: 90px;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 2px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
        font-size: 20px;
        font-weight: 400;
    }

    td {
        font-size: 20px;
    }
        h1 {
            margin-top: 20px;
        }
        /* CSS styles for the header section */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            background-color: #150202;
            color:#fff;
        }
        .header h1 {
            font-size: 40px;
            font-size: 800;
        }
        .header img {
            height: 90px;
        }
        .nav-links {
            display: flex;
        }
        .nav-links a {
            margin-right: 10px;
            text-decoration: none;
            color: #f0e9e9;
            font-size: 25px;
        }
    </style>
</head>
<body>
    <!-- Header section with logo and college name -->
    <div class="header">
        <div>
            <img src="logo.jpeg" alt="College Logo">
        </div>
        <div>
            <h1>JM COLLEGE OF ENGINEERING</h1>
        </div>
        <div class="nav-links">
            <a href="home.html">Home</a>
            <a href="discipline.jsp">Discipline</a>
            <a href="payfee.jsp">Pay Fee</a>
            <a href="login.html">Logout</a>
        </div>
    </div>

    <!-- Student Profile -->
<h1>Student Profile</h1>
<div class="table-container">
<table>
    <% while (studentProfileResultSet.next()) { %>
    <tr>
        <td>Date of Admission:</td>
        <td><%= studentProfileResultSet.getString("date_of_admission") %></td>
    </tr>
    <tr>
        <td>Registration Number:</td>
        <td><%= studentProfileResultSet.getString("registration_number") %></td>
    </tr>
    <tr>
        <td>Programme:</td>
        <td><%= studentProfileResultSet.getString("programme") %></td>
    </tr>
    <tr>
        <td>Branch:</td>
        <td><%= studentProfileResultSet.getString("branch") %></td>
    </tr>
    <tr>
        <td>Admitted Year:</td>
        <td><%= studentProfileResultSet.getString("admitted_year") %></td>
    </tr>
    <tr>
        <td>Admitted Semester:</td>
        <td><%= studentProfileResultSet.getString("admitted_semester") %></td>
    </tr>
    <tr>
        <td>Studying Year:</td>
        <td><%= studentProfileResultSet.getString("studying_year") %></td>
    </tr>
    <tr>
        <td>Studying Semester:</td>
        <td><%= studentProfileResultSet.getString("studying_semester") %></td>
    </tr>
    <tr>
        <td>Name:</td>
        <td><%= studentProfileResultSet.getString("name") %></td>
    </tr>
    <tr>
        <td>Date of Birth:</td>
        <td><%= studentProfileResultSet.getString("dob") %></td>
    </tr>
    <tr>
        <td>Caste:</td>
        <td><%= studentProfileResultSet.getString("caste") %></td>
    </tr>
    <tr>
        <td>Sub Caste:</td>
        <td><%= studentProfileResultSet.getString("sub_caste") %></td>
    </tr>
    <tr>
        <td>Gender:</td>
        <td><%= studentProfileResultSet.getString("gender") %></td>
    </tr>
    <tr>
        <td>Nationality:</td>
        <td><%= studentProfileResultSet.getString("nationality") %></td>
    </tr>
    <tr>
        <td>Religion:</td>
        <td><%= studentProfileResultSet.getString("religion") %></td>
    </tr>
    <tr>
        <td>Mode of Admission:</td>
        <td><%= studentProfileResultSet.getString("mode_of_admission") %></td>
    </tr>
    <tr>
        <td>Transport Fee:</td>
        <td><%= studentProfileResultSet.getString("transport_fee") %></td>
    </tr>
    <% } %>
</table>
</div>

<!-- Personal Details -->
<div class="table-container">
<h1>Personal Details</h1>
<table>
    <% while (personalDetailsResultSet.next()) { %>
    <tr>
        <td>Father's Name:</td>
        <td><%= personalDetailsResultSet.getString("father_name") %></td>
    </tr>
    <tr>
        <td>Father's Occupation:</td>
        <td><%= personalDetailsResultSet.getString("father_occupation") %></td>
    </tr>
    <tr>
        <td>Father's Income:</td>
        <td><%= personalDetailsResultSet.getString("father_income") %></td>
    </tr>
    <tr>
        <td>Mother's Name:</td>
        <td><%= personalDetailsResultSet.getString("mother_name") %></td>
    </tr>
    <tr>
        <td>Address:</td>
        <td><%= personalDetailsResultSet.getString("address") %></td>
    </tr>
    <tr>
        <td>Parent's Mobile No.:</td>
        <td><%= personalDetailsResultSet.getString("parent_mobile_no") %></td>
    </tr>
    <tr>
        <td>Student's Mobile No.:</td>
        <td><%= personalDetailsResultSet.getString("student_mobile_no") %></td>
    </tr>
    <tr>
        <td>Aadhar Number:</td>
        <td><%= personalDetailsResultSet.getString("aadhar_number") %></td>
    </tr>
    <% } %>
</table>
</div>


    <%
        // Close the result sets
        studentProfileResultSet.close();
        personalDetailsResultSet.close();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close the database connection
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
