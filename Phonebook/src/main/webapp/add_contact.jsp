<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Phone_Book App</title>
        <%@include file="Component/allcss.jsp" %>
    </head>
    <body style="background-color: #f7faf8; ">
        <%@include file="Component/navbar.jsp" %>
        <%              
		if (user == null) {
		session.setAttribute("invalid", "Login please...");
		response.sendRedirect("login.jsp");
		}
        %>

        <div class="container-fluid">
            <div class="row p-2">
                <div class="col-md-6 offset-md-3">
                    <div class="card" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);">
                        <div class="card-body">
                            <h4 class="text-center text-success">Add Contact Page</h4>

							<% String succ = (String) session.getAttribute("succ");
							      String error = (String) session.getAttribute("error");

								if (succ != null) {
							%>
							<p class="text-success text-center"> <%=succ%></p>
							<%
									session.removeAttribute("succ");
								}
								if (error != null) {
							%>
							<p class="text-danger text-center"><%=error%></p>
							<%
									session.removeAttribute("error");
								}
							%>
                            <form action="addcontact" method="post">

								<%
									if (user != null) {
								%>
								<input type="hidden" value="<%=user.getId()%>" name="user">
								<%
									}
								%>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Name</label>
                                    <input required name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input required name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPhone">Enter Phone Number</label>
                                    <input required name="phone" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone Number">
                                </div>


                                <div class="form-group">	
                                    <input required  name="about"  type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Short details">
                                </div>


                                <div class="text-center" >
                                    <button type="submit" class="btn btn-primary" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top:75px;">
            <%@include file="Component/footer.jsp" %>
        </div>
    </body>
</html>