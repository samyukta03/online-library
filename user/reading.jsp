

<jsp:include page="navbar.jsp" />

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
	<title> Currently Reading </title>
	<style>
	.wrapper 
		{
			padding: 10px;
    		margin: 78px auto;
    		width:1300px;
    		background-color: black;
    		opacity: 0.8;
    		color: white;
		}
	.table{
	   font-family: "Merriweather", "Georgia", serif;
    font-size: 15px ;   
   }
	 .div1 {
   background-color: white;  color:black;  text-align: center;  font-size: 27px;
		font-family: "Merriweather", "Georgia", serif; }
	
	</style>
	</head>
<body>
&nbsp 
<jsp:include page="sidenav.jsp" /> <br>
<center><div class="div1"><b>Your 'Reading' list</b><br> </div></center>
<div class="wrapper">
<div class="table-responsive"> 
<table class="table" border="1" width="25%" cellpadding="5" id="myTable">
<thead>
<tr > 
<th><b>Book ID</b></th>
<th><b>Book Name</b></th>
<th><b>Action</b></th>
<th><b>Add to & Remove from</b></th>
</tr>
</thead><tbody>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
if(request.getSession(false)!=null){
			Object username =(session.getAttribute("username"));	
String sql ="select bookId,username,bookName from reading where username = '"+username+"' ";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
  %>
<tr > 
<td><%=resultSet.getString("bookId") %></td>
<td><%=resultSet.getString("bookName") %></td>
<td><button><a href= "./disp.jsp?bookId=<%=resultSet.getString("bookId") %>">View</a> </button></td>
 <td><button><a href= "./addread.jsp?bookId=<%=resultSet.getString("bookId")%>&bookName=<%=resultSet.getString("bookName") %>">Add to'Read'</a> </button>
 <br><button><a href= "./deletereading.jsp?bookId=<%= resultSet.getString("bookId") %>">Remove from reading lists</a> </button>
 </td>


</tr>

<% 

}
}
connection.close();
}
 catch (Exception e) {
e.printStackTrace();
}
%></tbody>
</table>
</div>
</body>
</html>