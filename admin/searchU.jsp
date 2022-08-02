<jsp:include page="navbarr.jsp" />

	<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>User Information</title>
	<style type="text/css">
		.srch
		{
			padding-left: 1000px;
		}
		body{
		background-image: url(images/14.jpg);
		background-size:cover;
	}
	</style>
</head>
<body>
<br>
<!--__________________________search bar________________________-->
&nbsp 
<h2 align="center"><font><br><strong>User Information</strong></font></h2><br>
	<div class="srch">
		<form class="navbar-form" action="searchU.jsp"  method="post" name="form1">
				<input class="form-control" type="text" name="username" placeholder="search an user's username.." required="">
				<button style="background-color: #6db6b9e6;" type="submit" name="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
				</button>
		</form>
		
	</div>	
<table class='table table-bordered table-hover'>
<thead>
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
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Sam03devi!");
	Statement st=con.createStatement();
	
	String username=request.getParameter("username");
	String sqlStr= "select * from user where username ='"+username+"'";
	ResultSet rs = st.executeQuery(sqlStr);
	while(rs.next()){
		%>	
		<tr style='background-color: #DEB887; font-size:15px;'>
		<td><%=rs.getString("id") %></td>
<td><%=rs.getString("first") %></td>
<td><%=rs.getString("last") %></td>
<td><%=rs.getString("username") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("phone") %></td>
<td><button> <a href= "./delete.jsp?username=<%=rs.getString("username") %>">Delete</a> </button> </td>

</tr>		
		<%
	}
}
catch(Exception e){
	System.out.println(e.getMessage());
	}
%>
</tbody>
</table><br><br>
<div class="srch">
	&nbsp &nbsp <p style="font-size:15px;"><b>Click here to go <a href="user.jsp">Back</a></b> </p>
				

	</div>	

</body>
</html>
