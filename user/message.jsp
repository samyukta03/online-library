<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
	<title>Message</title>
</head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
	body
	{
			background-image: url("images/4.jpg");
			background-size:cover;
	}
.wrapper
{
	height: 600px;
	width: 490px;
	background-color: black;
	opacity: .9;
	color: white;
	margin: 79px auto;
	padding: 10px;
}
.form-control
{
	height: 47px;
	width: 76%;
}
.msg
{
	height: 450px;
	overflow-y: scroll;
}
.btn-info
{
	background-color: #02c5b6;
}
.chat
{
	display: flex;
	flex-flow:row wrap;
}
.user .chatbox
{
	height: 50px;
	width: 400px;
	padding: 13px 10px;
	background-color: #821b69;
	color: white;
	border-radius: 10px;
	order: -1;
}
.admin .chatbox
{
	height: 50px;
	width: 400px;
	padding: 13px 10px;
	background-color: #423471;
	color: white;
	border-radius: 10px;
}
</style>

<body>


<div class="wrapper">
	<div style="height: 70px; width: 100%; background-color: #2eac8b; text-align: center; color:white; "><br>
		<h3 style="margin-top: -5px; padding-top: 10px;">Admin</h3>
	</div>
	<div class="msg">
		<!-------student---------------->
		<br><div class="chat user">
			<div style="float: left; padding-top: 5px;">
				&nbsp
				&nbsp
			</div>
			<div style="float: left;" class="chatbox">
			</div>
		</div>

		<!-------admin---------------->

		<br><div class="chat admin">
			<div style="float: left; padding-top: 5px;">
				&nbsp
				<img style="height: 40px; width: 40px; border-radius: 50%;" src="images/7.jpg">
				&nbsp
			</div>
			<div style="float: left;" class="chatbox">
			
			</div>
		</div>
</div>

	<div style="height: 100px; padding-top: 10px;" >
		<form action="" method="post">
			<input type="text" name="message" class="form-control" required="" placeholder="Write Message..." style="float: left"> &nbsp
			<button class="btn btn-info btn-lg" type="submit" name="submit"><span class="glyphicon glyphicon-send "></span>&nbsp Send</button>
		</form>
	</div>
</div>

</body>
</html>