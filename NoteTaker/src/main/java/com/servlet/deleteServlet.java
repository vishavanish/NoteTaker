package com.servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.Factoryprovider;

/**
 * Servlet implementation class deletServlet
 */
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public deleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session s= Factoryprovider.getFactory().openSession();
			Transaction tx=s.getTransaction();
			tx.begin();
			Note note= s.get(Note.class, noteId);
			s.delete(note);
			tx.commit();
			s.close();
			
			response.sendRedirect("show_notes.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
