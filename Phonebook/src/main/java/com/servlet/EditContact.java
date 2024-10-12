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
 * Servlet implementation class EditContact
 */
@WebServlet("/update")
public class EditContact extends HttpServlet {
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
		int cid = Integer.parseInt(request.getParameter("cid"));

		contact c = new contact();
		c.setId(cid);
		c.setName(name);
		c.setEmail(email);
		c.setPh(phone);
		c.setAbout(about);
		ContactDao dao = new ContactDao(dbconnect.getConn());
		
		HttpSession session = request.getSession();
		boolean f = dao.updateContact(c);
		if(f)
		{
			session.setAttribute("succ", "Contact updated");
			response.sendRedirect("viewcontact.jsp");
		}
		else
		{
			session.setAttribute("invalid", "Something went wrong on server");
			response.sendRedirect("edit.jsp?cid="+c.getId());
		}
	}

}
