<%-- 
    Document   : HomePage
    Created on : 18 Jan, 2024, 10:37:02 AM
    Author     : aseem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <h1>Hello <%=session.getAttribute("adname")%></h1>
        <a href="ChangePassword.jsp">CHANGE PASSWORD</a><br>
        <a href="district.jsp">SET DISTRICT</a><br>
        <a href="place.jsp">SET PLACE</a><br>
        <a href="location.jsp">SET LOCATION</a><br>
        <a href="category.jsp">SET CATEGORY</a><br>
        <a href="subcategory.jsp">SET SUB CATEGORY</a><br>
        <a href="reviewverification.jsp">verify Reviews</a><br>
        <a href="ComplaintVerification.jsp">Verify Complaints</a><br>
        <a href="Complaintaction.jsp">View Complaints</a><br>

    </body>
</html>
