<%@ page import="db.Users" %><%
    Users user=(Users) request.getSession().getAttribute("CURRENT_USER");
    boolean ONLINE=false;
    if (user!=null){
        ONLINE=true;
    }
%>