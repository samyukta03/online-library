<!DOCTYPE html>
<html>
<head>
	<title>
		ZEUS E-BOOK CLUB
	</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
	nav
	{
		float: right;
		word-spacing: 30px;
		padding: 20px;
	}
	nav li 
	{
		display: inline-block;
		line-height: 80px;
	}
</style>
</head>


<body>
	<div class="wrapper">
		<header>
		<div class="logo">
			 &nbsp <img src="images/10.jpg" width="150px" height="113px" padding="10px" ><br>
		</div>
		<% 
		if(request.getSession(false)!= null){ %>
	        <nav>
				<ul>
				
				 <li><a href=""><div style="color:white"><h2>
				 <% Object username = (session.getAttribute("username")); %>
		
	</h2></a></li>
					<li><a href="books.jsp">BOOKS</a></li>
					<li><a href="user.jsp">USER-RECORDS</a></li>
					<li><a href="logout.jsp">LOGOUT</a></li>
					<li><a href="feedback.jsp">FEEDBACK</a></li>
				</ul>
			</nav>
		
		</header>
		<section>
		<div class="sec_img">
			<br><br><br>
			<div class="box">
				<br><br><br><br>
				<h1 style="text-align: center; font-size: 35px;">ZEUS E-BOOK CLUB</h1><br>
				<h1 style="text-align: center;font-size: 25px;">A bibliophile's paradise </h1><br><br>
				<h1 style="text-align: center;font-size: 23px;">
				<%	out.println("Welcome admin "+username);
		} %>
				</h1><br>
			</div>
		</div>
		</section>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>



