<%-- 
    Document   : AjaxLoc
    Created on : 11 Jan, 2024, 11:01:48 AM
    Author     : aseem
--%>

<!--This Ajax File is used to pass ward no of the  corresponding location name -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%
    String selq="select *from tbl_location where place_id = '"+request.getParameter("pid")+"'"; /*According to the location id the ward id is fetched*/
    ResultSet rs = con.selectCommand(selq);
    %>
    <option value="">--select Location--</option>
     <%
    while(rs.next())
    {
        %>
        
        <option value = "<%=rs.getString("location_id")%>"><%=rs.getString("location_name")%></option> <!--According to the ward id the ward no is provided into the Ward Drop Down List-->
        <%
    }
%>