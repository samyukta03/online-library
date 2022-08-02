<jsp:include page="navbarr.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

  <title>User Login</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<section>
  <div class="log_img">
    <br> <br><br>
    <div class="box1">
        <h1 style="text-align: center; font-size: 35px;font-family: Lucida Console;">Forgot Password Form</h1>
      <form name="login" action="" method="post">
        <div class="login">
          <input class="form-control" type="text" name="username" placeholder="Username" required=""><br>
          <input class="form-control" type="text" name="email" placeholder="email" required=""><br>
          <input class="btn btn-default" type="submit" name="submit" value="Submit" style="color: black; width:60px; height:30px;"></div>
	  </form>
	 <% try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Sam03devi!");
Statement st=con.createStatement();
String username=request.getParameter("username");
String email=request.getParameter("email");
String strQuery = "SELECT password FROM user where email='"+email+"'&&username='"+username+"' ";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
if(Countrow!=null){
	out.println("<html><body><center>Hi "+username+"! Your password is <b>'"+Countrow
                        + "'</b> Please proceeed to <a href='student_login.jsp'>Login</a><center></body></html>");

}
else {
	out.println("<html><body><center>Sorry! No record found.<center></body></html>");
}
}
catch (Exception e){
	
e.printStackTrace();
}%>
    </div>
  </div>
</section>
</body>
</html>