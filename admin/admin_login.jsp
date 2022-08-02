<jsp:include page="navbar.jsp" />

<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

  <title>Admin  Login</title>
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
        <h1 style="text-align: center; font-size: 35px;font-family: Lucida Console;">Admin Login Form</h1>
      <form name="login" action="" method="post">
        <div class="login">
          <input class="form-control" type="text" name="username" placeholder="Username" required=""><br>
          <input class="form-control" type="password" name="password" placeholder="Password" required=""><br>
          <input class="btn btn-default" type="submit" name="submit" value="Login" style="color: black; width:60px; height:30px;"></div>
      
      <p style="color: white; padding-left: 15px;">
        <br>
        <a style="color:white;" href="forgot.jsp"><strong>Forgot password?</strong></a> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
       
	  </form>
    </div>
  </div>
</section>

<%
String username=request.getParameter("username");
session.putValue("username",username);
String password=request.getParameter("password");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Sam03devi!");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from admin where username='"+username+"' and password='"+password+"'");
try{
rs.next();
if(rs.getString("password").equals(password)&&rs.getString("username").equals(username))
{
session.setAttribute("username",username);
	session.setAttribute("password",password);
	response.sendRedirect("indexx.jsp");
}
else {
response.sendRedirect("index.jsp");	
}
}
catch (Exception e) {
}
%>
</body>
</html>