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
        <title>Product Gallery Display</title>
        
        <style>
            body {
    font-family: 'Inter', sans-serif;
    background: url("../Assets/Templates/Main/img/proddisp.jpg");
    background-size: 100% 100%;
    background-size: cover;
  background-position: center center;
            }

            h2 {
                 border-collapse: collapse;
  margin: 0 auto;
  overflow: hidden;
  color: #333;
  max-width: 200px;
  margin-bottom: 30px;
  background-color: rgba(255, 255, 255, 0.7);
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

            table {
              border-collapse: collapse;
              margin: 0 auto;
              overflow: hidden;
              background-color: rgba(255, 255, 255, 0.7);
              border-radius: 10px;
              box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            th,
            td {
              padding: 15px;
              border: 1px solid #ddd;
            }

            th {
              background-color: #4CAF50;
              color: white;
              font-weight: normal;
            }

            td img {
              height: 155px; /* increased height by 50% */
              width: 155px; /* increased width by 50% */
              object-fit: cover;
              border-radius: 50%;
            }

            a {
              color: #4CAF50;
              text-decoration: none;
              font-size: 14px;
              margin-right: 10px;
            }

            a:hover {
              text-decoration: underline;
            }

            form {
              margin-top: 30px;
            }
        </style>
    </head>
    <body>
        <%
        if(request.getParameter("did")!=null)
          {
              String delqry="delete from tbl_productgallery where productgallery_id='"+request.getParameter("did")+"'";
              con.executeCommand(delqry);
              response.sendRedirect("productgallerydisplay.jsp?gid="+request.getParameter("xid"));
          }
        %>
                
        <div align="center">
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
                         <td><img src="../Assets/Files/ProductGallery/<%=rs.getString("gallery_image")%>" height="90" width="90"</td>
                         <td><a href="productgallerydisplay.jsp?did=<%=rs.getString("productgallery_id")%>&xid=<%=request.getParameter("gid")%>">Delete</a></td>
                     </tr>
                     <%
                 }
                     %>      
             </table>
        </form>
             </div> 
    </body>
</html>