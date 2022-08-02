<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="navbar.jsp" /> 
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
if(request.getSession(false)!=null){
            Object username =(session.getAttribute("username"));
int i=st.executeUpdate("DELETE FROM toread WHERE (bookId='"+bookId+"' AND username='"+username+"')");
if(i>0) {
response.sendRedirect("toread.jsp"); }
}
}

 


catch(Exception e){
    System.out.print(e);
e.printStackTrace();
}

 

 

 

%>
</body>
</html>