
<jsp:include page="navbar.jsp" />

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "library";
String userId = "root";
String password = "Sam03devi!";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>Books</title>
	<style type="text/css">
		.srch
		{
			padding-left: 900px;
		}
		body{
			background-image: url("images/11.jpg");
			background-size:cover;
		}
		h1{
			
			font-family: "Merriweather", "Georgia", serif;
			font-size: 40px;
			color:white
		}
		.table{
			font-size: 15px;
		}
		.wrapper 
		{
			padding: 10px;
    		margin: 78px auto;
    		width:1300px;
    		background-color: black;
    		opacity: 0.9;
    		color: white;
		}
		.div1 {
      width: 212px;
    height: 58px;
    box-sizing: border-box;
    background-color: #f9d491;
    color:#70410a;
    text-align: center;
    font-size: 38px;
				font-family: "Merriweather", "Georgia", serif;
		}
	</style>
</head>
<body>
&nbsp 
<jsp:include page="sidenav.jsp" />
<center>  <b> <div class="div1">Book List</div> </b> <!--  <h1><b>Book List</b></h1> --> </center>

<!--__________________________search bar bookname________________________-->

	<div class="srch">
	
		<form class="navbar-form" action=""  method="post" name="form1">
				<input class="form-control" type="text" id="myInput" onkeyup="myFunction1()" name="username" placeholder="search a book name.." required="">
				<button style="background-color: #6db6b9e6;" type="submit" name="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
				</button>
		</form>
		
	</div>	
	

	
															<!-- info table-->
<br>
<div class="wrapper">
<div class="table-responsive"> 
<table class="table " border="1" width="25%" cellpadding="5" id="myTable">
<thead>
<tr > <!-- style='background-color: #A52A2A;' -->
<th><b>Book ID</b></th>
<th><b>Book Name &nbsp  &nbsp   &nbsp   <button  style="color:black" onclick="sortTable(1)">Sort</button> </b></th>
<th><b>Author  &nbsp  &nbsp   &nbsp   <button  style="color:black" onclick="sortTable(2)">Sort</button> </b></th>
<th ><b>Genre  &nbsp  &nbsp   &nbsp  <button  style="color:black" onclick="sortTable(3)">Sort</button> </b></th>
<th><b>Action</b></th>
<th><b>Add to</b></th>
</tr>
</thead><tbody>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM Book";

resultSet = statement.executeQuery(sql);


while(resultSet.next()){
  %>
 <tr > <!-- style='background-color: #DEB887' -->
<td><%=resultSet.getString("bookId") %></td>
<td><%=resultSet.getString("bookName") %></td>
<td><%=resultSet.getString("author") %></td>
<td><%=resultSet.getString("genre") %></td>
<td><center><button><a href= "./disp.jsp?bookId=<%=resultSet.getString("bookId") %>">View</a></button></center> </td>
<td>
<div class="btn-group-vertical">
    <button type="button" class="btn btn-primary" style="background-color:#eff2f5"><a href="./addread.jsp?bookId=<%=resultSet.getString("bookId")%>&bookName=<%=resultSet.getString("bookName") %>"><strong>Read</strong></a></button>
     <button type="button" class="btn btn-primary" style="background-color:#eff2f5"><a href="./addreading.jsp?bookId=<%=resultSet.getString("bookId")%>&bookName=<%=resultSet.getString("bookName") %>"><strong>Reading</strong></a></button>
 <button type="button" class="btn btn-primary" style="background-color:#eff2f5">
<a href= "./addtoread.jsp?bookId=<%=resultSet.getString("bookId")%>&bookName=<%=resultSet.getString("bookName") %>"><strong>To read</strong></a>
</button>
 
</div>

 </td>

</tr>

<% 

}
connection.close();
}
 catch (Exception e) {
e.printStackTrace();
}
%></tbody>
</table>
</div>
<script>

function myFunction1() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}



function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("myTable");
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>
</div>

</body>
</html>
<!-- <input class="form-control" type="text" name="username" placeholder="search an author's name.." required=""> -->
<!-- 
<div style=" width:100%; height: 50px; margin-top:-20px; ">
<div style="background-color: #F44336; padding: 10px; width: 10%; height: 50px; float: left;">
<h3 style="color:white; margin-top:0px;">Trending: </h3>
</div>
<div style="background-color:#72a0ff57; width: 90%; height: 50px;
  float: left; padding:10px;">
 <table>
<tr style="color:black; width: 400px; margin-top: 0px; float: left;">aaa</tr> 
 </table> </div>
</div>
-->