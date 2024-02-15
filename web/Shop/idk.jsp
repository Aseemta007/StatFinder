<%-- 
    Document   : WorkGallery
    Created on : 24 Jan, 2024, 10:53:27 AM
    Author     : abhij
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WorkGallery</title>
    </head>
    <body>
       
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/WorkGalleryUploadAction.jsp">
            <table border="3" align="center">

       <tr>
                    <td>Gallery</td>
                    <td align="center">
                        <input required type="file" name="gallery">
                    </td>
                    <td>
                        <input required type="text" name="workpostid" value="<%=request.getParameter("pid")%>" hidden>
                        
                    </td>
                     
       </tr>
      
       <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="Save">
                        <input type="reset" name="cancel" value="Cancel">
                    </td>
                </tr>
            </table>
      </form>
    
    </body>
</html>