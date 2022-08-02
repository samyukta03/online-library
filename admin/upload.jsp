<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%> <!DOCTYPE html ><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN</title>
</head>
<body>
 <%

String s1=request.getParameter("bookId");
String s2=request.getParameter("bookName");
String s3=request.getParameter("series_no");
String s4=request.getParameter("author");
String s5=request.getParameter("Bookfile");
String s6=request.getParameter("genre");
String s7=request.getParameter("description");
String s8=request.getParameter("about_author");
String s9=request.getParameter("cover");
%>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Sam03devi!");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into book(bookId,bookName,series_no,author,Bookfile,genre,description,about_author,cover)values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"')");
if(i>0){
	response.sendRedirect("books.jsp"); 
}
else
{
out.print("Please Try Again");
}
}
catch(Exception sqls) {
sqls.printStackTrace();
}


%>

</body>
</html>
<!--  response.sendRedirect("books.jsp");  -->