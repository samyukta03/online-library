<jsp:include page="navbar.jsp" />
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Registration</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<section>
  <div class="reg_img">
 <br> <br><br>
    <div class="box2">
        <br><h1 style="text-align: center; font-size: 35px;font-family: Lucida Console;">Admin Registration Form</h1>
      <form name="Registration" action="connect.jsp" method="post">
        <br>
        <div class="login">
          <input class="form-control" type="text" name="first" placeholder="First Name" required=""> <br>
          <input class="form-control" type="text" name="last" placeholder="Last Name" required=""> <br>
          <input class="form-control" type="text" name="username" placeholder="Username" required=""> <br>
          <input class="form-control" type="password" name="password" placeholder="Password" required=""> <br>
          <input class="form-control" type="text" name="email" placeholder="Email" required=""><br>
		   <input class="form-control" type="text" name="phone" placeholder="Phone No" required=""><br>
      <input class="btn btn-default" type="submit" name="submit" value="Sign-up" style="color: black; width:70px; height:30px;"></div>
      </form>
     
    </div>
  </div>
</section>
</body>
</html>