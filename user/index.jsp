<%@page import ="java.sql.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
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
			 &nbsp <img src="images/10.jpg" width="155px" height="125px" padding="10px" ><br>
		</div>
	<nav>
				<ul>
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="student_login.jsp">USER-LOGIN</a></li>
					&nbsp 
				</ul>
			</nav>
		
		</header>
		<section>
		<div class="sec_img">
			<br><br><br>
			<div class="box">
				<br><br><br><br>
				<h1 style="text-align: center; font-size: 35px;">ZEUS E-BOOK CLUB</h1><br><br>
				<h1 style="text-align: center;font-size: 25px;">A bibliophile's paradise </h1><br>
				<h1 style="text-align: center;font-size: 25px;">Welcome user!! </h1><br>
				<h1 style="text-align: center;font-size: 20px;">Please Login to continue.
				</h1><br>
			</div>
		</div>
		</section>
	<jsp:include page="footer.jsp" />
	</div>
</body>

</html>



