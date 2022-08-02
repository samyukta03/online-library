<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
String bookId = request.getParameter("bookId");
  Connection  con=null;
        PreparedStatement pstmt=null;
response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline");
				  
                OutputStream output = response.getOutputStream();
				 try {
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Sam03devi!");
          } catch (Exception e) {
                     System.out.println(e);
                     System.exit(0); 
                          }
						   ResultSet rset=null;
						    try {
                pstmt = con.prepareStatement("Select Bookfile from Book where bookId=?");
                pstmt.setString(1, bookId.trim());
                rset = pstmt.executeQuery();
                if (rset.next())
                    output.write(rset.getBytes("Bookfile"));
                else
                    return;
                 
            } catch (SQLException e) {
                e.printStackTrace();
            }
    output.flush();




%>