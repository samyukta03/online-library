<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
  transition: background-color .5s;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: white;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
  margin-top:40px auto;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.h:hover
{
	color:white;
	width: 300px;
	height: 50px;
	background-color: #00544c;
}
</style>
</head>
<body>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div style="color: white; margin-left: 10px; font-size: 20px;">
   <img style="height: 110px; width: 120px; border-radius: 100%;" class="img_circle profile-img" src="images/7.jpg"></a></li>
    </div><br>
	<div style="color: white; margin-left: 40px; font-size: 20px;">
  <%
if(request.getSession(false)!=null){
	Object username =(session.getAttribute("username"));
	out.println("      Welcome, " +username);
}
	%>	 
<br>
  </div>
  <div class="h"> <a href="books.jsp">List</a></div>
  <div class="h"> <a href="read.jsp">Read</a></div>
  <div class="h"> <a href="reading.jsp">Currently Reading</a></div>
  <div class="h"> <a href="toread.jsp"> Want To Read</a></div>
  <div class="h"> <a href="./review.jsp">Reviews</a></div>
</div>

<div id="main"><br><br>

  <span style="font-size:30px;cursor:pointer; background-color:#f1d29a;" onclick="openNav()">&#9776; Open </span>
</div>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.body.style.backgroundColor = "white";
}
</script>
   
</body>
</html> 