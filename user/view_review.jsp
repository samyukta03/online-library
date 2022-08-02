
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>




<!DOCTYPE html>
<jsp:include page="navbar.jsp" /> 
&nbsp 
<jsp:include page="sidenav.jsp" />
<html>
<head>
<style>
body{
background-image: url("images/13.jpg");
			background-size:cover;
}
.table{
			font-size: 17px;
		}
<!-- .div1 {

    height: 58px;
   
    background-color: #f9d491;
    color:#70410a;
    text-align: center;
    font-size: 38px;
				font-family: "Merriweather", "Georgia", serif;
		} -->
		.wrapper 
		{
			    padding: 6px;
    margin: 7px auto;
    width: 890px;
    background-color: #2e0b09;
    opacity: 0.9;
    color: #f9d491;
		}
</style>
</head>

<body>
<center><b><h1 style="color:white;">Reviews</h1></b></center>
 
<%
String bookName= request.getParameter("bookName");
String bookId= request.getParameter("bookId");
try
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!"); 
Statement st=con.createStatement();
String query="select * from review where bookName='"+bookName+"'";
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<div class="wrapper">

<div class="table-responsive">
<table class="table">
<tr> <td><b> <div style="float: left; padding-top: 0px;">
			<img style="height: 40px; width: 40px; border-radius: 50%;" src="images/7.jpg">
			</div> &nbsp <%=rs.getString("username") %>'s on <%=rs.getString("bookName") %> : </b> </td><td>  <%=rs.getString("review") %> </td> </tr> <br>
</table>
  </div></div>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>

