<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Countries" %>
<%@ page import="db.DBmanager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="WEB-INF/vendor/head.jsp" %>

</head>
    <%@include file="WEB-INF/vendor/navbar.jsp"%>
<body>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <%
                String success=request.getParameter("success");
                   if (success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Item added successfully.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%}%>
            <form action="/addItem" method="post">
                <div class="form-group">
                    <label>NAME:</label>
                    <input name="item_name" type="text" class="form-control mt-3">
                </div>
                <div class="form-group">
                    <label class="mt-3">PRICE:</label>
                    <input name="item_price" type="number" class="form-control mt-3">
                </div>
                <div class="form-group">
                    <label class="mt-3">AMOUNT:</label>
                    <input name="item_amount" type="number" class="form-control mt-3">
                </div>
                <div class="form-group">
                    <label class="mt-3">MANUFACTURER:</label>
                    <select class="form-control mt-3" name="manufacturer_id">
                        <%
                            ArrayList<Countries>countries= (ArrayList<Countries>)request.getAttribute("countries") ;
                            if (countries!=null){
                                for (Countries country:countries) {
                        %>
                        <option value="<%=country.getId()%>"><%=(country.getName()+" / "+country.getShort_name())%></option>
                        <%}}%>
                    </select>
                </div>
                <div class="form-group">
                    <button class="btn btn-success mt-3">ADD ITEM</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
