<jsp:include page="navbarr.jsp" /> &nbsp
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<!DOCTYPE html>
<html>
<head>
	<title>User Information</title>
	<style type="text/css">
	body{
		background-image: url(images/14.jpg);
		background-size:cover;
	}
		.srch
		{
			padding-left: 1000px;
		}
	</style>
</head>
<body>
<br>
<!--__________________________search bar________________________-->
&nbsp 
<h2 align="center"><font><br><strong>User Information</strong></font></h2><br>
	<div class="srch">
		<form class="navbar-form" action="./searchU.jsp"  method="post" name="form1">
				<input class="form-control" type="text" name="username" placeholder="search an user's username.." required="">
				<button style="background-color: #6db6b9e6;" type="submit" name="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
				</button>
		</form>
		
	</div>	
															<!-- info table-->

<table class='table table-bordered table-hover'><thead>
<tr style='background-color: #A52A2A; color:white;'>
<td><b>Id</b></td>
<td><b>First Name</b></td>
<td><b>Last Name</b></td>
<td><b>Username</b></td>
<td><b>Email</b></td>
<td><b>Phone</b></td>
<td><b>Action</b></td>
</tr></thead><tbody>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM user";

resultSet = statement.executeQuery(sql);

int i=0;
while(resultSet.next()){
  %>
 <tr style='background-color: #DEB887; font-size:15px;'>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("first") %></td>
<td><%=resultSet.getString("last") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><button> <a href= "./delete.jsp?id=<%=resultSet.getString("id") %>">Delete</a></button> </td>

</tr>

<% 
i++ ;
}
connection.close();
}
 catch (Exception e) {
e.printStackTrace();
}
%></tbody>
</table>


</body>
</html>
