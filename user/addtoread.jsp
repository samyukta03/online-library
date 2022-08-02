
<%@page import ="java.sql.*"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="navbar.jsp" /> 
<!DOCTYPE html>
<html>
<head>
<title>Add to "Want to read" page</title>
</head>
<body>
<br><br><br><br>

<%
String bookId=request.getParameter("bookId");
String bookName=request.getParameter("bookName");
String username = (String) session.getAttribute("username");
try
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!");
PreparedStatement pst = con.prepareStatement(" insert into toread(bookId,username,bookName) values(?,?,?)");
pst.setString(1, bookId);
pst.setString(2, username);
pst.setString(3,bookName);
pst.executeUpdate();
response.sendRedirect("toread.jsp");

}
catch(Exception e){
	System.out.print(e);
e.printStackTrace();

}

%>
</body>
</html>