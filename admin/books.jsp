
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>	
	
	<%@page import ="java.sql.*"%>
<%@ page import="java.io.*"%>
<jsp:include page="navbarr.jsp" /> &nbsp

<!DOCTYPE html>

<html>
    <head>
 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="style.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
   .table{
	   font-family: "Merriweather", "Georgia", serif;
    font-size: 15px ;   
   }
  .srch
		{
			padding-left: 530px;
    margin-bottom: auto;
		}
		body{
			background-image: url("images/13.jpg");
			background-size:cover;
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
     width: 240px;  height: 47px;  box-sizing: border-box;  background-color: #794304;  color: #ffebdd;  text-align: center;  font-size: 33px;
    font-family: "Merriweather", "Georgia", serif;
  </style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body> &nbsp
<jsp:include page="sidenav.jsp" />
	<div class="container-fluid">
	<div class="row-md-6">
	<center><div class="div1"><b>List of Books</b><br> </div></center> <br>
										<!-- -----search_bar-----                 -->
	<div class="srch">
		<form class="navbar-form" action=""  method="post" name="form1">
				<input class="form-control" type="text" id="myInput" onkeyup="myFunction1()" name="username" placeholder="search a book name.." required="">
				<button style="background-color: #6db6b9e6;" type="submit" name="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
				</button>
		</form>
		
	</div>	
									<!-- ------------------------table----------  -->
	<div class="wrapper">
	<div class="table-responsive">          
  <table id="myTable" class="table" border="1" width="25%" cellpadding="5">
	
	  <thead>
                    <tr>
                        <th><b>Book Id</b></th>
						<th><center><b>Book Title  &nbsp  &nbsp   &nbsp   <button  style="color:black" onclick="sortTable(1)">Sort</button> </b></center></th> 
						<th><center><b>Cover Image</b></center></th> 
						<th><center><b>Author  &nbsp  &nbsp   &nbsp   <button  style="color:black" onclick="sortTable(3)">Sort</button> </b></center></th> 
						<th><center><b>Genre  &nbsp  &nbsp   &nbsp   <button  style="color:black" onclick="sortTable(4)">Sort</button> </b></center></th>
						<th><center><b>Action </b></center></th>
				<!--	<td><center><b>File</b></center></td>      -->
						</tr> </thead><tbody>
	<%

try{ 
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Sam03devi!");
Statement statement=connection.createStatement();
String sql ="SELECT * FROM book";

ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("bookId") %></td>
<td><%=resultSet.getString("bookName")%></td>	
<td><img src="<%=resultSet.getString("cover")%>" width="120" height="150"        /> </td>	
<td><%=resultSet.getString("author")%></td>	
<td><%=resultSet.getString("genre")%></td>	
<td><a href= "./deletebook.jsp?bookId=<%=resultSet.getString("bookId") %>">Delete</a> | <a href= "./viewbooks.jsp?bookId=<%=resultSet.getString("bookId") %>" target="_blank">View</a> </td>
</tr>		
	
<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</tbody>
</table>

		</div>	</div> 	</div>
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
	