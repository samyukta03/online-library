<%@page import ="java.sql.*"%>



<%
String id=request.getParameter("id");
String first=request.getParameter("first");
String last=request.getParameter("last");
String username=request.getParameter("username");
String password=request.getParameter("password");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
try{
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!");
PreparedStatement ps = con.prepareStatement("Update user set first=?,last=?,username=?,password=?,email=?,phone=? where id=?");
ps.setString(1,first);
ps.setString(2, last);
ps.setString(3, username);
ps.setString(4, password);
ps.setString(5, email);
ps.setString(6, phone);
ps.setString(7, id);
ps.executeUpdate();

response.sendRedirect("edit.jsp?msg=valid");
}
catch(SQLException sql)
{
System.out.print(e);
e.printStackTrace();

}

%>
