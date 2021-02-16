<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Items" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="WEB-INF/vendor/head.jsp" %>
</head>
<body>
<%@include file="WEB-INF/vendor/navbar.jsp"%>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-12">
            <%
                Items item=(Items)request.getAttribute("item");
                if (item!=null){
            %>
            <div class="jumbotron">
                <h1 class="display-4"><%=item.getName()%></h1>
                <p class="lead">PRICE: <%out.print(item.getPrice()+" tg");%><br>
                    MANUFACTURER: <%=(item.getManufacturer().getName()+" / "+item.getManufacturer().getShort_name())%>
                </p>
                <hr class="my-4">
                <p>AMOUNT:<%=item.getAmount()%> ITEMS</p>
                <%
                     if (ONLINE){
                %>
                   <a class="btn btn-primary btn-sm" href="/edit?id=<%=item.getId()%>" role="button">EDIT</a>
                   <%
                     }
                   %>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
