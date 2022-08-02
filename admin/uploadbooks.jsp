
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>	
	
	<%@page import ="java.sql.*"%>
<%@ page import="java.io.*"%>
<jsp:include page="navbarr.jsp" /> &nbsp
<jsp:include page="sidenav.jsp" />
<!DOCTYPE html>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <link rel="stylesheet" type="text/css" href="style.css">	
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body{
			background-image: url("images/12.jpg");
			background-size:cover;
		}
.table{
			font-size: 15px;
			color:black;
		}
		.wrapper 
		{
			padding: 10px;
    		margin: 78px auto;
    		width:1000px;
    		background-color:#055252;
    		opacity: 0.8;
    		color: white;
		}
		.div1 {
     
				width: 303px;
    height: 44px;
    box-sizing: border-box;
    background-color: #d6d1c3;
    color: black;
    text-align: center;
    font-size: 29px;
    font-family: "Merriweather", "Georgia", serif;
}
		</style>
    </head>

    <body>
<center>
<div  class="div1">
	<b>Upload new Books</b>
	</div></center>
	<div class="wrapper">
<center><h1>Book File details</h1></center> <br>
  <center>       <form  method="POST" action="upload.jsp"   style="width:300px;">
		 <div class="form-group">
    <label for="bookId">Book ID</label>
    <input type="text" class="form-control"  name="bookId" placeholder="BookId" required=""/>
  </div>
  <div class="form-group">
    <label for="bookname">Book Name</label>
    <input type="text" class="form-control"  name="bookName" placeholder="BookName" required=""/>
  </div>
   <div class="form-group">
    <label for="series_no">Series No</label>
    <input type="text" class="form-control"  name="series_no" placeholder="'BookName'#'Number'" required=""/>
  </div>
   <div class="form-group">
    <label for="author">Author</label>
    <input type="text" class="form-control"  name="author" placeholder="Author " required=""/>
  </div>
<div class="form-group">
    <label for="file">Book Pdf</label>
    <input type="file" class="form-control"  name="Bookfile" id="file" />
  </div> 
   <div class="form-group">
    <label for="genre">Genre</label>
    <input type="text" class="form-control"  name="genre" placeholder="Genre " required=""/>
  </div>
  <div class="form-group">
    <label for="description">Book Description</label>
   	 <textarea class="form-control"  name="description" rows="4" cols="50" placeholder="short description.." required=""></textarea>
  </div>
    <div class="form-group">
    <label for="about_author">About Author</label>
   	 <textarea class="form-control"  name="about_author" rows="4" cols="50" placeholder="Short note on author.." required=""></textarea>
  </div>
<div class="form-group">
    <label for="cover">Cover image link</label>
    <input type="text" class="form-control"  name="cover" placeholder="Paste the image link: .jpg/png" required=""/>
  </div>

<table class="table">
        <tr>
        <td colspan="2">
          <center> <input type="submit" value="Upload" name="upload" id="upload" /></center> </td>
        </tr>
   </table>
 
   </form>
  </center> 

   
   
   
</div>

</div>
   </body>
</html>
	
		<!--       <input type="text" class="form-control"  name="description" placeholder="short description.." required=""/>         -->