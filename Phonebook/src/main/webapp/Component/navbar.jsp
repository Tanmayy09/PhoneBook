<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-phone"></i> PhoneBook</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house-user"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="add_contact.jsp"><i class="fa-solid fa-address-book"></i> Add Phone</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="viewcontact.jsp"><i class="fa-solid fa-eye"></i> View Contact</a>
      </li>
    </ul>
      
      <% 
      User user = (User)session.getAttribute("user");
      
      if(user==null){
      %> 
        <form class="form-inline my-2 my-lg-0">
        <a href="login.jsp" class="btn btn-success" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);" ><i class="fa-solid fa-user"></i> Login</a>
        <a href="register.jsp" class="btn btn-danger ml-2" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);" ><i class="fa-solid fa-right-to-bracket"></i> Register</a>
        </form>
      <% 
        }
        else    
        {
      %>
        <form class="form-inline my-2 my-lg-0">
            <button class="btn btn-success" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);"><%=user.getName()%></button>
            <button type="button" class="btn btn-danger ml-2" style = "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8);" data-toggle="modal" data-target="#exampleModalCenter">Logout</button>
        </form>
      <%
        }
      %>
  </div>
  
  
  
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <h6>Are you sure to logout?</h6>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="logout" type="button" class="btn btn-primary">Yes</a>
      </div>
    </div>
  </div>
</div>
  
  
  
</nav>