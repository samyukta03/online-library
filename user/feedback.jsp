<jsp:include page="navbar.jsp" />
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Feedback</title>
	<link rel="stylesheet" type="text/css" href="style.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    <style type="text/css">
    	body
    	{
    		background-image: url("images/5.jpg");
			background-size:cover;
    	}
    	.wrapper
    	{
    		padding: 10px;
    		margin: 78px auto;
    		width:900px;
    		height: 600px;
    		background-color: black;
    		opacity: .8;
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
	<div class="wrapper">
		<h4>If you have any suggesions or questions please comment below.</h4>
		<form style="" action="" method="post">
		<%
if(request.getSession(false)!=null){
	Object username =(session.getAttribute("username"));
	%>
<input class="form-control" type="text" name="uname" placeholder="Your username" value="<% out.println("" +username); } %>" required=""><br>	
			<input class="form-control" type="text" name="comment" placeholder="Write something..." required=""><br>	
			<input class="btn btn-default" type="submit" name="submit" value="Comment" style="width: 100px; height: 35px;">		
		</form>
	
<br><br>
	<div class="scroll">
		<%
			String comment=request.getParameter("comment");
			String uname=request.getParameter("uname");
			try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Sam03devi!");
PreparedStatement ps=conn.prepareStatement("insert into comments(comment,username)values(?,?);");			
ps.setString(1,comment);
ps.setObject(2,uname);			
		int x= ps.executeUpdate();
if(x>0){
	out.println("<html><body><b><center>Your comment was added."
                        + "<center></b></body></html>");
						}
}

catch(Exception e){
	
}		
			
		%>
	</div>
	</div>
</body>
</html>
<!--
int x= 
if(x>0){
	out.println("<html><body><b><center>Registered Successfully "
                        + "<center></b></body></html>");}
else{
	out.println("Registration failed..");}	

if(isset($_POST['submit']))
			{
				$sql="INSERT INTO `comments` VALUES('','$_POST[comment]');";
				if(mysqli_query($db,$sql))
				{
					$q="SELECT * FROM `comments` ORDER BY `comments`.`id` DESC";
					$res=mysqli_query($db,$q);

					echo "<table class='table table-bordered'>";
					while ($row=mysqli_fetch_assoc($res)) 
					{
						echo "<tr>";
							echo "<td>"; echo $row['comment']; echo "</td>";
						echo "</tr>";
					}
				}

			}

			else
			{
				$q="SELECT * FROM `comments` ORDER BY `comments`.`id` DESC"; 
					$res=mysqli_query($db,$q);

					echo "<table class='table table-bordered'>";
					while ($row=mysqli_fetch_assoc($res)) 
					{
						echo "<tr>";
							echo "<td>"; echo $row['comment']; echo "</td>";
						echo "</tr>";
					}
			}
			-->