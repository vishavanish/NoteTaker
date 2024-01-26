<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="Navbar.jsp"%><br>
		<h2>This is add note page</h2>
		<!-- this is formm for add the notes -->
		<form action="saveServlet" method="post">
			<div class="form-group">
				<label for="Notes">Note title</label> <input type="text"
					class="form-control" id="title" name="title" aria-describedby="emailHelp"
					placeholder="Enter here">
			</div>

			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content" name="content" placeholder="Enter your content here"
					class="form-content" style="height:300px">
				 </textarea>
			</div>
	<div class="container text-center">
	<button type="submit" class="btn btn-primary">Add</button>
	</div>
			
		</form>
</body>
</html>