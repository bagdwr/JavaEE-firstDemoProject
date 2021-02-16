<%--
  Created by IntelliJ IDEA.
  User: official_ds
  Date: 06.01.2021
  Time: 01:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="WEB-INF/vendor/head.jsp" %>
</head>
<body>
<%@include file="WEB-INF/vendor/navbar.jsp"%>
    <div class="container">
        <div class="row mt-5">
            <div class="col-sm-6 offset-3">
                <h4 class="mb-4">
                    LOGIN TO SYSTEM
                </h4>

                <%
                    String passerror=request.getParameter("passworderror");
                    if (passerror!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Incorrect password
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%}%>

                <%
                    String emailerror=request.getParameter("emailerror");
                    if (emailerror!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Incorrect email
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%}%>

                <form action="/auth" method="post">
                    <div class="form-group">
                        <label class="mb-3">EMAIL:</label>
                        <input type="email" required class="form-control mb-3" name="email">
                    </div>
                    <div class="form-group">
                        <label class="mb-3">PASSWORD:</label>
                        <input type="password" required class="form-control mb-3" name="password">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success">LOGIN</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
