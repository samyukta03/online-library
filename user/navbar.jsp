<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<header style="height:0px;">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
<div class="navbar-header">
      <a class="navbar-brand active">ZEUS E-BOOK CLUB</a>
    </div>
        <ul class="nav navbar-nav">
          <li><a href="indexx.jsp">HOME</a></li>
          <li><a href="books.jsp">BOOKS</a></li>
		  <li><a href="profile.jsp">PROFILE</a></li>
		  <li><a href="feedback.jsp">FEEDBACK</a></li>
		 </ul>
		 
	
		 <ul class="nav navbar-nav navbar-right">
		<%
if(request.getSession(false)!=null){
	%>
	
	<li><a href="profile.jsp">
	     <img style="height: 25px; width: 30px; border-radius: 100%;" class="img_circle profile-img" src="images/7.jpg"></a></li>
		  <li><a href=""><div style="color:white">
	<%
	Object username =(session.getAttribute("username"));
	out.println("Hi " +username);
	%></div></a></li>
	      <li><a href="message.jsp"><span class="glyphicon glyphicon-envelope"></span> &nbsp
		  <span class="badge bg-white">0</span></a></li>
		  <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out">&nbsp USER-LOGOUT</span></a></li>
         
        </ul>
		</div>
      </nav>
<%
}
%>
	  
	  
	  </header>
</body>
</html>


