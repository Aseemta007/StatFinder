<%-- 
    Document   : AjaxCat
    Created on : Jan 18, 2024, 2:40:26 PM
    Author     : ANANTHU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%
    String selq="select *from tbl_subcategory where category_id = '"+request.getParameter("cid")+"'"; /*According to the location id the ward id is fetched*/
    ResultSet rs = con.selectCommand(selq);
    %>
     <option>--select Sub category--</option>
     <%
    while(rs.next())
    {
        %>
       
        <option value = "<%=rs.getString("subcategory_id")%>"><%=rs.getString("subcategory_name")%></option> <!--According to the ward id the ward no is provided into the Ward Drop Down List-->
        <%
    }
%>
