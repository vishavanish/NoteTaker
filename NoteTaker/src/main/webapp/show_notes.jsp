<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.*"%>
<%@ page import="org.hibernate.query.Query"%>


<%@page import="java.util.*"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.Factoryprovider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="Navbar.jsp"%><br>
		<h1 class="text-uppercase">All Notes:</h1>
		<div class="row">
			<div class="col-12">
				<%
				try {
					Session s = Factoryprovider.getFactory().openSession();
					Transaction tx = s.beginTransaction();

					Query q = s.createQuery("from Note");
					List<Note> list = q.list();

					Iterator<Note> it=list.iterator();
					while(it.hasNext()){
					out.println(it.next());
					}
					for (Note note : list) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width: 90px"
						src="img/icon.png" alt="Card image cap">
					<div class="card-body px-5">
					<h3 class="card-id"><%=note.getId() %></h3>
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<div class="container text-center mx-2">
							<a href="deleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a> 
							<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

				<%
				}

				tx.commit();
				s.close();
				%>

				<%
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>





			</div>
		</div>


	</div>


</body>
</html>