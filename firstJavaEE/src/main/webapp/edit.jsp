<%@ page import="db.Items" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Countries" %>
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
            <%
                String success=request.getParameter("success");
                if (success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Item saved successfully.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%

                }%>

            <%
                String error=request.getParameter("error");
                if (error!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Something is wrong.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%}%>
            <%
                Items item=(Items) request.getAttribute("item");
                if (item!=null){%>
            <form action="/edit" method="post">
                <input type="hidden" name="item_id" value="<%=item.getId()%>">
                <div class="form-group">
                    <label>NAME:</label>
                    <input name="item_name" type="text" class="form-control mt-3" value="<%=item.getName()%>">
                </div>
                <div class="form-group">
                    <label class="mt-3">PRICE:</label>
                    <input name="item_price" type="number" class="form-control mt-3" value="<%=item.getPrice()%>">
                </div>
                <div class="form-group">
                    <label class="mt-3">AMOUNT:</label>
                    <input name="item_amount" type="number" class="form-control mt-3" value="<%=item.getAmount()%>">
                </div>
                <div class="form-group">
                    <label class="mt-3">MANUFACTURER:</label>
                    <select class="form-control mt-3" name="manufacturer_id">
                        <%
                            ArrayList<Countries>countries= (ArrayList<Countries>)request.getAttribute("countries") ;
                            if (countries!=null){
                                for (Countries country:countries) {
                        %>
                        <option value="<%=country.getId()%>" <%if (country.getId()==item.getManufacturer().getId()){ out.print("selected");}%>><%=(country.getName()+" / "+country.getShort_name())%></option>
                        <%}}%>
                    </select>
                </div>
                <div class="form-group mt-3">
                    <button class="btn btn-success">SAVE</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                    style="float: right">
                        DELETE
                    </button>
                </div>
            </form>
            <form action="/delete" method="post">
                <input type="hidden" name="item_id" value="<%=item.getId()%>">
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Confirm delete</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                            <button type="submit" class="btn btn-danger" >YES</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <%}%>
        </div>
    </div>
</div>
</body>
</html>
