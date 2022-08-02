<jsp:include page="navbar.jsp" /> 

<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>edit profile</title>
	<style type="text/css">
	body
    	{
    		background-image: url("images/8.jpg");
			background-size:cover;
    	}
		.form-control
		{
			width:250px;
			height: 38px;
		}
		.form1
		{
			margin:0 540px;
		}
		label
		{
			color: white;
		}

	</style>
</head>
<body>
<br><br><br>
	<h2 style="text-align: center;color: #fff;">Edit Information</h2><br>
	<div style='text-align:center'><img style="height: 110px; width:120px; border-radius: 40%;" class="img-circle profile-img" src="images/7.jpg"></div>
<div class="profile_info" style="text-align: center;"><br>
		<span style="color: white;">Welcome,<%= session.getAttribute("username")%></span>
<br>
<%
String username=request.getParameter("username");
try{
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!");
Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select * from user where username='"+username+"'");
	while(rs.next()){
%>	
<div class="form1">		
<form method="post" action="" enctype="multipart/form-data">

		<input  class="form-control"  type="hidden" name="id" value="<%=rs.getString("id") %>">
<label><h4><b>First Name: </b></h4></label>
		<input class="form-control" type="text" name="first" value="<%=rs.getString("first") %>">

		<label><h4><b>Last Name</b></h4></label>
		<input class="form-control" type="text" name="last" value="<%=rs.getString("last") %>">

		<label><h4><b>Username</b></h4></label>
		<input class="form-control" type="text" name="username" value="<%=rs.getString("username") %>">

		<label><h4><b>Password</b></h4></label>
		<input class="form-control" type="text" name="password" value="<%=rs.getString("password") %>">

		<label><h4><b>Email</b></h4></label>
		<input class="form-control" type="text" name="email" value="<%=rs.getString("email") %>">

		<label><h4><b>Contact No</b></h4></label>
		<input class="form-control" type="text" name="contact" value="<%=rs.getString("phone") %>">

		<br>
		<div style="padding-left: 100px;">
			<button class="btn btn-default" type="submit" name="submit">Save</button></div>
	</form>


</div>
<%
}
}
catch(Exception e){
	System.out.println(e);

}
%>

<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>	
<script> alert("Updated successfully!"); </script>

	<%
}
if("invalid".equals(msg)){
	%>
<script> alert("something went wrong!"); </script>
	<%
}
%>
</body>
</html>