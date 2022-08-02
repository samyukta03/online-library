<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="navbarr.jsp" /> 
<!DOCTYPE html>
<html>
<head>
<title>Delete record page</title>
</head>
<body>
<br><br><br><br>

<%
String bookId=request.getParameter("bookId");
try
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!");
Statement st = con.createStatement();
int i=st.executeUpdate("DELETE FROM book WHERE bookId='"+bookId+"'");
if(i>0){
%>
<script> alert("deleted"); </script>
<%
response.sendRedirect("books.jsp");
}
}

catch(Exception e){
	System.out.print(e);
e.printStackTrace();

}

%>
</body>
</html>
