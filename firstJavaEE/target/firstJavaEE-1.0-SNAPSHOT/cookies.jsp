
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <%@include file="WEB-INF/vendor/head.jsp"%>
</head>
<body>
   <%@include file="WEB-INF/vendor/navbar.jsp"%>

   <div class="container">
       <div class="row mt-5">
           <div class="col-sm-6 offset-3">
               <h1>
                   <%
                       String myCookieValue= (String) request.getAttribute("myCookieValue");
                       out.print("You cookies is "+myCookieValue);
                   %>
               </h1>
           </div>
       </div>
       <div class="row mt-5">
           <div class="col-sm-6 offset-3">
               <form action="/setCookie" method="post">
                   <div class="form-group">
                        <label>COOKIE VALUE: </label>
                        <input name="cookie_name" class="form-control mt-5" type="text">
                   </div>
                   <button class="btn btn-success mt-5">SET COOKIE</button>
               </form>
               <form action="/deleteCookie" method="post">
                   <button class="btn btn-danger mt-5">DELETE COOKIE</button>
               </form>
           </div>
       </div>
   </div>
</body>
</html>
