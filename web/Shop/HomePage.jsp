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
        <title>Home Page</title>
    </head>
    <body>
        <h1>Hello <%=session.getAttribute("shname")%></h1>
        <a href="MyProfile.jsp">PROFILE</a><br>
        <a href="EditProfile.jsp">EDIT PROFILE</a><br>
        <a href="ChangePassword.jsp">CHANGE PASSWORD</a>
    </body>
</html>
