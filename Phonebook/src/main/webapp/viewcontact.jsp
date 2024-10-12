<%@page import="com.entity.contact"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ContactDao"%>
<%@page import="com.conn.dbconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Phone_Book App</title>
		<%@include file="Component/allcss.jsp" %>
		<style type="text/css">
			.crd-hod :hover
			{
				background-color: #d9d9d9;
			}
		</style>
	</head>
	<body>
		<%@include file="Component/navbar.jsp" %>
                  <% 
	                  if(user==null)
	                          {
					session.setAttribute("invalid", "Login please...");
                                             response.sendRedirect("login.jsp");
                                    }
                  %>    
		
		<%
			String succ = (String) session.getAttribute("succ");
			String error = (String) session.getAttribute("invalid");
			if(succ !=null)
			{
		%>
		<div class="alert alert-success " role="alert"><%=succ%></div> 
		<%
			session.removeAttribute("succ");
			}
			if(error!=null)
			{	
		%>
		<div class="alert alert-danger" role="alert"><%=error%></div>
		<%
			session.removeAttribute("error");
			}
		%>
		<div class="container">
			<div class="row p-4">
					
				<%
					if(user!=null){
					ContactDao dao = new ContactDao(dbconnect.getConn());
					List<contact> contact = dao.getAllContact(user.getId());
					
					for(contact c : contact){
				%>
				<div class="col-md-3">
					<div class="card crd-hod" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);">
						<div class="card-body">
							<h5> Name : <%=c.getName()  %></h5>
							<p>Email : <%= c.getEmail() %></p>
							<p>Phone no : +91<%= c.getPh() %></p>
							<p> About : <%= c.getAbout() %></p>
							<div class="text-center">
								<a href="edit.jsp?cid=<%=c.getId()%>" class="btn btn-sm btn-success text-white" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);">Edit</a>
								<a href="delete?cid=<%=c.getId()%>"  class="btn btn-sm btn-danger text-white" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);">Delete</a>
							</div>
						</div>
					</div>
				</div>
				<%
					}}
				%>
			</div>
		</div>
	</body>
</html>