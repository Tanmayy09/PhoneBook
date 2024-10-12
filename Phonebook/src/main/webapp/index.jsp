<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>Phone_Book App</title>
		<%@include file="Component/allcss.jsp" %>
		<style type="text/css">
			.bg-img
				{
					background: url("img/Untitled.png");
					width: 100%;
					height: 80vh;
					background-repeat: no-repeat;
					background-size: cover;
				}
				
		</style>
	</head>
	<body>
		<%@include file="Component/navbar.jsp" %>
          	
		<div class="container-fluid bg-img text-center text-white" >
			<h1>Welcome to PhoneBook App</h1>
		</div>
		
		<div>
			<%@include file="Component/footer.jsp" %>
		</div>
		
	</body>
</html>