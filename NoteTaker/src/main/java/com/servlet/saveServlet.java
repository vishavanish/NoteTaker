package com.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.Factoryprovider;

public class saveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public saveServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note();
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());

			Session session = Factoryprovider.getFactory().openSession();
			Transaction tx = session.beginTransaction();

			session.save(note);
			tx.commit();
			session.close();
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note is added succesfully </h1>");
			out.println("<h1 style='text-align:center;'><a href='show_notes.jsp'>Views All Notes </a></h1>");
			System.out.println(note.getId() + " " + note.getContent() + " mil rha hai data ");
			// response.sendRedirect("show_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
