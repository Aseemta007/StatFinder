<%-- 
    Document   : AjaxWard.jsp
    Created on : Dec 7, 2023, 10:52:21 AM
    Author     : aseem
--%>
<!--This Ajax File is used to pass ward no of the  corresponding location name -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%
    String selq="select *from tbl_place where district_id = '"+request.getParameter("did")+"'"; /*According to the location id the ward id is fetched*/
    ResultSet rs = con.selectCommand(selq);
    %>
     <option>--select Place--</option>
     <%
    while(rs.next())
    {
        %>
       
        <option value = "<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option> <!--According to the ward id the ward no is provided into the Ward Drop Down List-->
        <%
    }
%>

