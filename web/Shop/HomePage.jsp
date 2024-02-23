<%-- 
    Document   : Homepage
    Created on : Jan 18, 2024, 11:10:11 AM
    Author     : ANANTHU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello <%=session.getAttribute("shname")%></h1>
        <a href="MyProfile.jsp">Profile</a><br>
        <a href="EditProfile.jsp">Edit Profile</a><br>
        <a href="ChangePassword.jsp">Change Password</a><br>
        <a href="ProductRegistration.jsp">Register Products</a><br>
        <a href="productdisplay.jsp">Display Products</a><br>
        <a href="ReviewDisplay.jsp">Display Reviews</a><br>
        <a href="Complaintdisplay.jsp">Display Complaints</a><br>


    </body>
</html>
