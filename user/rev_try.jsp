<jsp:include page="navbar.jsp" />

<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Reviews</title>
	<link rel="stylesheet" type="text/css" href="style.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    <style type="text/css">
    	body
    	{
    		background-image: url("images/3.jpg");
			background-size:cover;
    	}
    	.wrapper
    	{
    		padding: 10px;
    		margin: 78px auto;
    		width:900px;
    		height: 600px;
    		background-color: black;
    		opacity: .9;
    		color: white;
    	}
    	.form-control
    	{
    		height: 70px;
    		width: 60%;
    	}
    	.scroll
    	{
    		width: 100%;
    		height: 300px;
    		overflow: auto;
    	}

    </style>
</head>
<body>
&nbsp 
<jsp:include page="sidenav.jsp" />
	<div class="wrapper">
		<h4>Write your reviews</h4>
		<form style="" action="" method="post">
		<% if(request.getSession(false)!=null){
	Object username =(session.getAttribute("username"));	
	%> 
<input class="form-control" type="text" name="username" value="<% out.println(""+username);}%>" required=""><br>		
			<input class="form-control" type="text" name="review" placeholder="Write a review" required=""><br>	
			<input class="btn btn-default" type="submit" name="submit" value="Post" style="width: 100px; height: 35px;">		
		</form>
	
<br><br>
	<div class="scroll">
		<%
			
			String username=request.getParameter("username");
			String bookName=request.getParameter("bookName");
			String review=request.getParameter("review");
			try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!");
PreparedStatement ps=conn.prepareStatement("insert into review(username,bookName,review)values(?,?,?);");	
ps.setString(1,username);	
ps.setString(2,bookName);
ps.setString(3,review);	
	
int x= ps.executeUpdate();
if(x>0){

	out.println("<html><body><b><center>Thank You for the review ! "
                        + "<center></b></body></html>");}
}

catch(Exception e){
	
}		
			
		%>
	</div>
	</div>
</body>
</html>
