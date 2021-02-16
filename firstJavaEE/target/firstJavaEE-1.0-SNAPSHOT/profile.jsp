<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="WEB-INF/vendor/head.jsp" %>
</head>
<body>
   <%@include file="WEB-INF/vendor/navbar.jsp"%>
     <h1>
         hello this is profile of <%=user.getFullname()%>
     </h1>
</body>
</html>
