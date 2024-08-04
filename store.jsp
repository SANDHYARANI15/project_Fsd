<%@ page import="java.sql.*"%>
<%
String name=request.getParameter("uname");
String room=request.getParameter("room");
String rdate=request.getParameter("date");
String gender=request.getParameter("gender");
String mail=request.getParameter("email");
String contact=request.getParameter("number");
try
{
    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
    PreparedStatement pst=con.prepareStatement("insert into register values(?,?,?,?,?,?)"); 
    pst.setString(1,name);
    pst.setString(2,room);
    pst.setString(3,rdate);
    pst.setString(4,gender);
    pst.setString(5,mail);
    pst.setString(6,contact);
    int x=pst.executeUpdate();
    if(x!=0)
    {%>
        
        <html>
            <head>
                <style>
                .message {
                    background-color: lightblue;
                    padding: 80px;
                    font-size: 28px;
                    text-align: center;
                  }
                 .bg {
                  background-image: url("https://img.freepik.com/premium-photo/abstract-blur-luxury-hotel-lobby-background_1339-98418.jpg")
         background-repeat:repeat;
         background-size:120px;}
         
                 .my-button {
  background-color: #4CAF50; /* Green background color */
  border: none; /* Remove border */
  color: white; /* White text color */
  padding: 10px 20px; /* Add some padding */
  text-align: center; /* Center the text */
  text-decoration: none; /* Remove underline */
  display: inline-block; /* Display as inline-block */
  font-size: 16px; /* Set font size */
  cursor: pointer; /* Add cursor on hover */
  border-radius: 4px; /* Add rounded corners */
}

                    

                  </style>
            </head>
            <body class="bg">
                
                <div class="message" ><h1>Registration successfully</h1>
                 <a href="index.html"> <button class="my-button" >Home</button></a>
                </div>
                

            </body>
        </html>
        
   <%}
    else
    {%>
        <div style="text-align: center; color: white; font-size: 25px;">
            Details are not Correct please provide Details again.
            </div>
            <jsp:include page="register.html"/>
    <%}

}
catch(Exception e)
{
    out.println(e);
}

%>
