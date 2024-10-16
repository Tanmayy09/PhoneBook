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

/**
 * Servlet implementation class DeleteContact
 */
@WebServlet("/delete")
public class DeleteContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		ContactDao dao = new ContactDao(dbconnect.getConn());
		boolean f = dao.deleteContact(cid);
		HttpSession session = request.getSession();
		if(f)
		{
			session.setAttribute("succ","contact deleted successfully");
			response.sendRedirect("viewcontact.jsp");
		}
		else
		{
			session.setAttribute("invalid", "Server error");
			response.sendRedirect("viewcontact.jsp");
		}
	}

}
