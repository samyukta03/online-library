
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
h2{
	color:#999999;
	font-family: "Merriweather", "Georgia", serif;
}
body{
	
	line-height: 1.428571;
}
* {
  box-sizing: border-box;
}
.column {
  float: left;
  width: 50%;
  padding: 18px;
  height: 600px; 
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
.table{
	padding-left: 0px ;
	width: 101%;
    max-width: 80%;
	font-family: "Merriweather", "Georgia", serif;
    font-size: 15px ;
	}
	.button {
        display: inline-block;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        color: black;
		font-weight:bold;
        background-color:#ffe97ce0;
        border-radius: 6px;
        outline: none;
      }

</style>
</head>

<body>
<%
String bookId= request.getParameter("bookId");
try
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!"); 
Statement st=con.createStatement();
String query="select * from book where bookId='"+bookId+"'";
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<div class="row">
  <div class="column">
  <a href= "./viewbooks.jsp?bookId=<%=rs.getString("bookId") %>" target="_blank">
<image src="<%=rs.getString("cover") %>" width="210" height="280" /> </a> <br>
<center> <h1> &nbsp  <%=rs.getString("bookName") %> </h1> <br> </center>
 <center> <a class="button" href= "./viewbooks.jsp?bookId=<%=rs.getString("bookId") %>" target="_blank">Start</a>
  <br>    <br>      <a class="button" href="./view_review.jsp?bookName=<%=rs.getString("bookName") %>&bookId=<%=rs.getString("bookId") %> ">View Reviews on <%=rs.getString("series_no") %> </a> 
 </center> 
</div>
<div class="column">
<center><h2>   <%=rs.getString("Series_no") %>              </h2></center>
<center>
<table class="table table-hover">
<tr> <td><b>  Author: </b> </td> <td>  <%=rs.getString("author") %> </td> </tr>
<tr> <td><b> Genre:  </b></td> <td>  <%=rs.getString("genre") %></td> </tr>
<tr> <td><b> Description: </b></td> <td>  <%=rs.getString("description") %></td> </tr>
<tr> <td><b> About The Author: </b></td> <td>  <%=rs.getString("about_author") %></td> </tr>
</table></center> </div>

<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
 
 
 
 
</body>
</html>




<!-- ./viewimg.jsp?bookId=< % =rs.getString("bookId") % > 
 ./viewbooks.jsp?bookId=< % =rs.getString("bookId") %>-->