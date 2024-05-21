<%-- 
    Document   : ViewWorkBooking
    Created on : 5 Mar, 2024, 12:45:52 AM
    Author     : ashwi
--%>


<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Work Gallery</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <style>
body {
    font-family: 'Inter', sans-serif;
    background: url("../Assets/Templates/Main/img/proddisp.jpg");
    background-size: 100% 100%;
    background-size: cover;
  background-position: center center;
            }
                        #cake h2{
                 border-collapse: collapse;
  margin: 0 auto;
  overflow: hidden;
  color: #333;
  max-width: 400px;
  margin-bottom: 30px;
  background-color: rgba(255, 255, 255, 0.7);
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}
        </style>
    </head>
    <div class="bg-img">
        <div >
    <%@include file="Userhead.jsp" %>
    
    <body>
        <br><br>
        <div align="center">
        <h2 id="cake" class="font">Product Gallery</h2>
        <br>
         
        <form method="post">
        <table cellpadding="10" align="center">
               
             <!--   <tr>
                    <th>Sl.no</th>
                    <th>Photo</th>
                    
                </tr>-->
       <%
                 String selqry = "select*from tbl_productgallery where product_id='"+request.getParameter("sid")+"'";
                 ResultSet rs = con.selectCommand(selqry);
                 int i=0;
                 while(rs.next())
                 {
                     %>
                
                     <td style="max-width: 100%; height: auto; border-radius: 10px;">
  <img src="../Assets/Files/ProductGallery/<%=rs.getString("gallery_image")%>" style="max-width: 100%; height: auto;">
</td>
             
                     
                     <%
                 }
                     %> 
                     </form>
                      </table>
      
        </body>
    <br><br> <br><br> <br><br> <br><br>
     <%@include file="../Guest/Foot.jsp" %>
      </div>
             </div> 
        </div>
   
</html>