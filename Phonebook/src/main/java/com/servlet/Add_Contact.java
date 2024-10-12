package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.dbconnect;
import com.dao.ContactDao;
import com.entity.contact;

/**
 * Servlet implementation class Add_Contact
 */
@WebServlet("/addcontact")
public class Add_Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String about = request.getParameter("about");
		int userid = Integer.parseInt(request.getParameter("user"));
		   
		contact c = new contact(name,email,phone,about,userid);
		ContactDao dao = new ContactDao(dbconnect.getConn());
		   
		HttpSession session = request.getSession();
		boolean f = dao.saveContact(c);
		if(f)
		{
			session.setAttribute("succ", "Contact Successfully saved");
			response.sendRedirect("add_contact.jsp");
		}
		else
		{
			session.setAttribute("error", "Something went on server");
			response.sendRedirect("add_contact.jsp");
		}
	}

}
