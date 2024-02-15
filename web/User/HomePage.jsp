<%-- 
    Document   : HomePage
    Created on : 18 Jan, 2024, 10:48:56 AM
    Author     : aseem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Dashboard</title>
    </head>
    <body>
        <h1>Hello <%=session.getAttribute("uname")%></h1>
        <a href="MyProfile.jsp">PROFILE</a><br>
        <a href="EditProfile.jsp">EDIT PROFILE</a><br>
        <a href="ChangePassword.jsp">CHANGE PASSWORD</a><br>
        <a href="Review.jsp">Review Shop</a><br>
        <a href="complaint.jsp">file a Complaint</a><br>
        <a href="Feedback.jsp">Provide Feedback</a>
    </body>
</html>
