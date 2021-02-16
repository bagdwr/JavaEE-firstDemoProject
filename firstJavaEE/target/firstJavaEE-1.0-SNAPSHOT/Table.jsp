<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Items" %>
<%@ page import="db.DBmanager" %>
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
                <table class="table">
                    <thead>
                          <tr>
                              <th>ID</th>
                              <th>NAME</th>
                              <th>PRICE</th>
                              <th>AMOUNT</th>
                              <th>MANUFACTURER</th>
                              <th>DETAILS</th>
                          </tr>
                    </thead>
                    <tbody>
                          <%
                              ArrayList<Items>items=(ArrayList<Items>) request.getAttribute("tovary");
                              if (items!=null){
                                       for (Items item:items){
                                  %>
                                  <tr>
                                      <td>
                                          <%
                                              out.print(item.getId());
                                          %>
                                      </td>
                                      <td>
                                          <%
                                              out.print(item.getName());
                                          %>
                                      </td>
                                      <td>
                                          <%
                                              out.print(item.getPrice());
                                          %>
                                      </td>
                                      <td>
                                          <%
                                              out.print(item.getAmount());
                                          %>
                                      </td>
                                      <td>
                                          <%
                                              out.print(item.getManufacturer().getName()+" / "+item.getManufacturer().getShort_name());
                                          %>
                                      </td>
                                      <td>
                                          <a href="/details?id=<%=item.getId()%>" class="btn btn-info btn-sm">DETAILS</a>
                                      </td>
                                  </tr>
                          <%
                                  }}
                          %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
