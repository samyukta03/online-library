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
String id=request.getParameter("id");
try
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!");
Statement st = con.createStatement();
st.executeUpdate("DELETE FROM user WHERE id='"+id+"'");
%>

<%
response.sendRedirect("user.jsp");
}

catch(Exception e){
	System.out.print(e);
e.printStackTrace();

}

%>
</body>
</html>
