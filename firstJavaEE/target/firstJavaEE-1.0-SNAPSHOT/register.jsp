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
                REGISTER TO SYSTEM
            </h4>

            <%
                String repassworderror=request.getParameter("passworderror");
                if (repassworderror!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect re-password
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%}%>

            <%
                String emailexisterror=request.getParameter("emailexisterror");
                if ( emailexisterror!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 Email exists
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%}%>

            <%
                String success=request.getParameter("success");
                if (success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                You was successfully registered!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%}%>
            <form action="/register" method="post">
                <div class="form-group">
                    <label class="mb-3">EMAIL:</label>
                    <input type="email" required class="form-control mb-3" name="email">
                </div>
                <div class="form-group">
                    <label class="mb-3">PASSWORD:</label>
                    <input type="password" required class="form-control mb-3" name="password">
                </div>
                <div class="form-group">
                    <label class="mb-3">RETYPE PASSWORD:</label>
                    <input type="password" required class="form-control mb-3" name="re-password">
                </div>
                <div class="form-group">
                    <label class="mb-3">FULLNAME:</label>
                    <input type="text" required class="form-control mb-3" name="fullname">
                </div>
                <div class="form-group">
                    <button class="btn btn-success">REGISTER</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
