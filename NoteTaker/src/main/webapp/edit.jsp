<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.*"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.Factoryprovider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<h1>Edit your note</h1>
	<%
	try {
		int noteId = Integer.parseInt(request.getParameter("note_id"));
		Session s = Factoryprovider.getFactory().openSession();
		Transaction tx = s.getTransaction();
		tx.begin();
		Note note = s.get(Note.class, noteId);

		// Check if note is not null before accessing its properties
		if (note != null) {
	%>

	<form action="updateServlet" method="post">
	<input value="<%=note.getId() %>" name="noteId" type="hidden"/>
		<div class="form-group">
			<label for="title">Note Title</label> <input required type="text"
				class="form-control" id="title" name="title"
				aria-describedby="emailHelp" value="<%=note.getTitle()%>"
				placeholder="Enter here">
		</div>
		<div class="form-group">
			<label for="content">Note Content</label>
			<textarea required id="content" class="form-control" name="content"
				placeholder="Enter your content here" style="height: 250px;"
				<%=note.getContent()%>></textarea>
		</div>
		<div class="container text-center">
			<button type="submit" class="btn btn-success">Save</button>
		</div>


	</form>

	<%
	} else {
	out.println("Note not found!");
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

</body>
</html>
