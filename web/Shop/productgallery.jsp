<%-- 
    Document   : WorkPostGallery
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
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/gallery.css">
    </head>
    <%@include file="Shophead.jsp" %>
    <body>
        <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages1/ProductGalleryUploadAction.jsp">
      <div class="formbold-form-title">
        <h2 class="">Product Registration</h2>
      </div>
        <div class="formbold-mb-3">
        <label for="gallery" class="formbold-form-label">
          Photo
        </label>
        <input  
         type="file" 
         name="gallery" 
          required
        />
        <input required type="text" name="productid" value="<%=request.getParameter("pid")%>" hidden>
                        <input required type="text" name="shopid" value="<%=session.getAttribute("shid")%>" hidden>
      </div>
      
       <input type="submit" class="formbold-btn" name="save" value="Save">&nbsp&nbsp<input type="reset" class="formbold-btn" name="cancel" value="Cancel">
    </form>
  </div>
</div> 
    
    </body>
    <%@include file="../Guest/Foot.jsp" %>
</html>