<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="navbarr.jsp" /> 

<!DOCTYPE html>
<html>
<head>
	<title>Feedback review</title>
	<link rel="stylesheet" type="text/css" href="style.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body{
		background-image: url("images/5.jpg");
			background-size:cover;
	}
.wrapper
    	{
    		padding: 10px;
    		margin: 78px auto;
    		width:900px;
    		height: 600px;
    		background-color: black;
    		opacity: .8;
    		color: white;
			font-size:15px;
    	}
</style>
</head>
<body>
	<div class="wrapper">		

<%
String id = request.getParameter("userId");
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
<br><br><br>
<h2 align="center"><font><strong>Feedbacks/Suggestions from Users</strong></font></h2><br>
<table class=" table table-bordered" align="center" cellpadding="5" cellspacing="5" border="1">
<thead style=" background-color: #ffffff; color:black; font-weight:bold;" >
<tr >
<td><center>Username</center></td>
<td><center>Comments</center></td>
</tr>
</thead><tbody>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM comments order by id DESC";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr><strong>
<td><center><%=resultSet.getString("username")%></center></td>
<td><center><%=resultSet.getString("comment")%></center></td>

</tr></strong>

<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</tbody>
</table>
</div>
</body>
</html>
