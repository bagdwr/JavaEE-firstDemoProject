<%@include file="User.jsp"%>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #a65e73";>
    <a class="navbar-brand" href="/" style="margin-left: 30px;">SHOP ELECTRONICS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <%
                  if (ONLINE){
            %>
                   <li class="nav-item">
                       <a class="nav-link" href="/profile"><%=user.getFullname()%></a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="/logout">Log out</a>
                    </li>
            <li class="nav-item">
                <a class="nav-link" href="/">Table</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/addItem">Add Item</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/cookies">Cookies home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/sessions">Sessions home</a>
            </li>
             <%
                  }else {
             %>
                      <li class="nav-item">
                         <a class="nav-link" href="/login">Login</a>
                      </li>
                     <li class="nav-item">
                         <a class="nav-link" href="/register">Register</a>
                     </li>
            <%
                  }
            %>

        </ul>
        <form class="form-inline my-2 my-lg-0" style="margin-left:auto; display: flex; margin-right: 30px;">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="margin-right: 20px;">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>