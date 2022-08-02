<%@page import ="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String first=request.getParameter("first");
String last=request.getParameter("last");
String username=request.getParameter("username");
String password=request.getParameter("password");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String image=request.getParameter("image");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!");
File pic=new File("C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/library/user/images/7.jpg");
PreparedStatement ps=conn.prepareStatement("insert into user(first,last,username,password,email,phone,image)values(?,?,?,?,?,?,?);");
FileInputStream fis;
ps.setString(1,first);
ps.setString(2,last);
ps.setString(3,username);
ps.setString(4,password);
ps.setString(5,email);
ps.setString(6,phone);
fis=new FileInputStream(pic);
ps.setBinaryStream(7, (InputStream)fis, (int)(pic.length()));

String strQuery = "SELECT COUNT(*) FROM user where email='"+email+"'";
ResultSet rs = ps.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("0")){
int i=ps.executeUpdate();
if(i>0){
out.println("<html><body><b><center>Thank you for registering ! Please <a href='student_login.jsp'>Login</a> to continue."+ "<center></b></body></html>");
}
}
else{
out.println("<html><body><b><center>User name or Email already exists! Please proceeed to <a href='student_login.jsp'>Login</a>"+ "<center></b></body></html>");
}
}
catch(Exception e)
{
out.println(e);
}
%>

