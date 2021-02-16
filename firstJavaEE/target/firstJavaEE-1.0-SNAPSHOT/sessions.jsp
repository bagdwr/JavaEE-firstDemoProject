<%@ page import="java.util.ArrayList" %>
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
                         String text=(String) request.getAttribute("session");
                         out.print(text);
                %>
            </h1>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <form action="/setSession" method="post">
                <div class="form-group">
                    <label>SESSION VALUE: </label>
                    <input name="session_value" class="form-control mt-5" type="text">
                </div>
                <button class="btn btn-success mt-5">SET SESSION</button>
            </form>
            <form action="/deleteSession" method="post">
                <button class="btn btn-danger mt-5">DELETE SESSION</button>
            </form>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <%
                ArrayList<String>basket=(ArrayList<String>) request.getAttribute("basket");
                if (basket!=null){
                    for (String s:basket){
            %>
                     <h4><%=s%></h4>
            <%
                    }
                }
            %>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <form action="/addtobasket" method="post">
                <div class="form-group">
                    <label>BASKET VALUE: </label>
                    <input name="basket_value" class="form-control mt-5" type="text">
                </div>
                <button class="btn btn-success mt-5">ADD TO BASKET</button>
            </form>
            <form action="/clearbasket" method="post">
                <button class="btn btn-danger mt-5">DELETE SESSION</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
