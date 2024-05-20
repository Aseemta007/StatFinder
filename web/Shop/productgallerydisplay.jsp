<%-- 
    Document   : WorkGalleryDisplay
    Created on : 24 Jan, 2024, 1:57:44 PM
    Author     : ananthu
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/prodgaldisp.css">
    </head>
    <%@include file="Shophead.jsp" %>
    <body>
        <%
        if(request.getParameter("did")!=null)
          {
              String delqry="delete from tbl_productgallery where productgallery_id='"+request.getParameter("did")+"'";
              con.executeCommand(delqry);
              response.sendRedirect("productgallerydisplay.jsp?gid="+request.getParameter("xid"));
          }
        %>
                
        <div align="center" id="h2e">
        <h2>Image Gallery</h2>
         
        <form method="post">
        <table border="3" align="center">
               
                <tr>
                    <th>Sl.no</th>
                    <th>Photo</th>
                    <th>Action</th>
                    
                </tr>
        <%
                 String selqry = "select*from tbl_productgallery where product_id='"+request.getParameter("gid")+"'";  
                 ResultSet rs = con.selectCommand(selqry);
                 int i=0;
                 while(rs.next())
                 {
                     i++;
                     %>
                     <tr>
                         <td><%=i%></td>
                         <td><img src="../Assets/Files/ProductGallery/<%=rs.getString("gallery_image")%>" height="90" width="90"></td>
                         <td><a href="productgallerydisplay.jsp?did=<%=rs.getString("productgallery_id")%>&xid=<%=request.getParameter("gid")%>">Delete</a></td>
                     </tr>
                     <%
                 }
                     %>      
             </table>
        </form>
             </div> 
    </body>
    <%@include file="Foot.jsp" %>
</html>