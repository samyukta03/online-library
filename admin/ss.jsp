

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.zip.*"%>

 <%

String s1=request.getParameter("bookId");
String s2=request.getParameter("bookName");
String s3=request.getParameter("author");
String s4=request.getParameter("genre");
String s5=request.getParameter("file");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Sam03devi!");
Statement st=con.createStatement();
st.executeUpdate("insert into Book(bookId,bookName,author,genre,file)values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')");

out.print("Successfully Register");


}
catch(Exception sqls) {
out.print("Please Try Again");
}


%>


