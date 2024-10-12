<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Phone_Book App</title>
		<%@include file="Component/allcss.jsp" %>
	</head>
	<body style="background-color: #f7faf8;">
		<%@include file="Component/navbar.jsp" %>
		<div class="container-fluid">
			<div class="row p-2">
				<div class="col-md-6 offset-md-3">
					<div class="card" style= "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);">
						<div class="card-body">
							<h4 class="text-center text-success">Login Page</h4>
                                                        
                            <% String invalid = (String)session.getAttribute("invalid");
                               
                                if(invalid!=null){
                            %>
                            <p class="text-danger text-center"><%=invalid %></p>
                            <%
                                session.removeAttribute("invalid");
                                }
                            %>
                            
                            <% String Logout = (String)session.getAttribute("Logout");
                               
                                if(Logout!=null){
                            %>
                            <p class="text-success text-center"><%=Logout %></p>
                            <%
                                session.removeAttribute("Logout");
                                }
                            %>
                            <form action="LoginServlet" method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
							  </div>
							  <div class="text-center" >
							  	<button type="submit" class="btn btn-primary" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);">Login</button>
							  </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 190px;">
			<%@include file="Component/footer.jsp" %>
		</div>
	</body>
</html>