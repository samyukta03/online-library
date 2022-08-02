<jsp:include page="navbar.jsp" /> 

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("username");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "library";
String userId = "root";
String password = "Sam03devi!";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
	<title>Profile</title>
	<style type="text/css">
	body{
		background-image: url("images/8.jpg");
			background-size:cover;
	}
		.wrapper
		{ 
		  
			width:500px;
			margin:55px auto;
			background-color:#d03737;
			color:black;
			opacity:0.9;
		}
		.table{
			font-size:19px;
		}
	</style>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#004528;"><br><br><br>
<br><br>
	<div class="container">
<div style='text-align:center'><h2><b>My Profile</b></h2><br><img style="height: 110px; width:120px; border-radius: 40%;" class="img-circle profile-img" src="images/7.jpg"><br>
<h4><b>Welcome <%= session.getAttribute("username")%>,</b></h4></div>
		<div class="wrapper">
		
			<table class="table " align="center" cellpadding="5" cellspacing="5" border="10">
 <% 
		   try{ 
			connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
			statement=connection.createStatement();
			if(request.getSession(false)!=null){
			Object username =(session.getAttribute("username"));	
			String sql ="SELECT * FROM user where username='"+username+"'";

			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
%>
<tr>
<td><b>First Name:</b></td>
<td><b><%=resultSet.getString("first") %></b></td>
</tr>
<tr>
<td><b>Last Name:</b></td>
<td><b><%=resultSet.getString("last") %></b></td>
</tr>
<tr>
<td><b>User Name:</b></td>
<td><b><%=resultSet.getString("username") %></b></td>
</tr>
<tr>
<td><b>Email:</b></td>
<td><b><%=resultSet.getString("email") %></b></td>
</tr>
<tr>
<td><b>Phone:</b></td>
<td><b><%=resultSet.getString("phone") %></b></td>
</tr>
    </table>  

<%}
}connection.close();

}catch (Exception e) {
e.printStackTrace();
}%>
		</div>
	</div>

</body>
</html>




