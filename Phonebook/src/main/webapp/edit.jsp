<%@page import="com.entity.contact"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ContactDao"%>
<%@page import="com.conn.dbconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone_book App</title>
		<%@include file="Component/allcss.jsp" %>
    </head>
    <body>
		<%@include file="Component/navbar.jsp" %>
		<%			if (user == null) {
				session.setAttribute("invalid", "Login please...");
				response.sendRedirect("login.jsp");
			}
		%>

        <div class="container-fluid">
            <div class="row p-2">
                <div class="col-md-6 offset-md-3">
                    <div class="card" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);">
                        <div class="card-body">
                            <h4 class="text-center text-success">Edit Contact</h4>

				<%
					String error = (String) session.getAttribute("invalid");
					if (error != null) {
				%>
				<p class="text-danger text-center"><%=error%></p>
				<%
					session.removeAttribute("error");
					}
				%>
				<form action="update" method="post">
					<%
						int cid = Integer.parseInt(request.getParameter("cid"));
						ContactDao dao = new ContactDao(dbconnect.getConn());
						contact c = dao.getContactByID(cid);
 					%>
					<input type="hidden" value="<%=cid%>" name="cid">

					<div class="form-group">
						<label for="exampleInputEmail1">Enter Name</label>
						<input required  value="<%=c.getName()%>" name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
					</div>


					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label>
						<input required   value="<%=c.getEmail()%>" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
					</div>


					<div class="form-group">
					         <label for="exampleInputPhone">Enter Phone Number</label>
					         <input required   value="<%=c.getPh()%>" name="phone" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone Number">
					</div>


					<div class="form-group">	
					        <input required    value="<%=c.getAbout()%>"  name="about"  type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Short details">
					</div>


					<div class="text-center" >
					         <button type="submit" class="btn btn-primary" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);">Update Contact</button>
					</div>
				</form>
                        </div>
		</div>
	</div>
</div>
					
	<div style="margin-top: 100px;">
		<%@include file="Component/footer.jsp" %>
	</div>
    </body>
</html>
