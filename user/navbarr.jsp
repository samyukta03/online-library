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
          <li><a href="index.jsp">&nbsp &nbsp &nbsp HOME</a></li>
		 </ul>
		 <%
if(request.getSession(false)!=null){
	%>
	
		 <ul class="nav navbar-nav navbar-right">
		
		 <li><a href=""><div style="color:white">
	<%
	Object username =(session.getAttribute("username"));	
	%></div></a></li>
	
          <li><a href="registration.jsp"><span class="glyphicon glyphicon-user">&nbsp SIGN-UP</span></a></li>
        </ul>
		</div>
      </nav>
<%
}
else {
	%>	  
	  
		 <ul class="nav navbar-nav navbar-right">
          <li><a href="student_login.jsp"><span class="glyphicon glyphicon-log-in">&nbsp USER-LOGIN</span></a></li>
		  <li><a href="student_login.jsp"><span class="glyphicon glyphicon-log-out">&nbsp USER-LOGOUT</span></a></li>
          <li><a href="registration.jsp"><span class="glyphicon glyphicon-user">&nbsp SIGN-UP</span></a></li>
        </ul>
		</div>
      </nav>
	  <%
}
%>
	  </header>
</body>
</html>


