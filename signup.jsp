<%@ page import="java.sql.*"%>
<%
String fname=request.getParameter("firstName");
String sname=request.getParameter("secondName");
String phn=request.getParameter("phoneNo");
String mail=request.getParameter("email");
String pass=request.getParameter("password");
String cpass=request.getParameter("confrompassword");
String gender=request.getParameter("Gender");
if(pass.equals(cpass))
{
try
{
    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
    PreparedStatement pst=con.prepareStatement("insert into signup values(?,?,?,?,?,?,?)"); 
    pst.setString(1,fname);
    pst.setString(2,sname);
    pst.setString(3,phn);
    pst.setString(4,mail);
    pst.setString(5,pass);
    pst.setString(6,cpass);
    pst.setString(7,gender);
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
                  .bg{
         background-image:url("https://images8.alphacoders.com/428/thumb-1920-428582.jpg")
         background-repeat:repeat;
         background-size:1200px;}
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
  border-radius: 4px; /* Add rounded corners */}
                  </style>
            </head>
            <body class="bg">
                <div class="message"><h1>Signup successfully</h1>
                  <a href="index.html"> <button class="my-button">Home</button></a>
                </div>

            </body>
        </html>
        
   <% }
    else
    {%>
        <div style="text-align: center; color: white; font-size: 25px;">
            Details are not Correct please provide Details again.
            </div>
            <jsp:include page="signup.html"/>
    <%}

}
catch(Exception e)
{
    out.println(e);
}
}
else
{
    out.print("Password is not Macthing....");
}

%>
