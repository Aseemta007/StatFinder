<%-- 
    Document   : EditProfile
    Created on : Jan 18, 2024, 2:11:09 PM
    Author     : ANANTHU
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
                 <link rel="stylesheet" href="../Assets/Templates/Main/css/prodreg.css">
    </head>
    <%@include file="Shophead.jsp" %>
    <body>
        <%
            if(request.getParameter("txtupdate")!=null)
            {
                    String uq = "update tbl_shop set shop_name = '"+request.getParameter("txtname")+"',shop_contact = '"+request.getParameter("txtcontact")+"',shop_email = '"+request.getParameter("txtemail")+"',shop_address = '"+request.getParameter("txtaddress")+"'where shop_id = '"+session.getAttribute("shid")+"'";
                    con.executeCommand(uq);
                    response.sendRedirect("EditProfile.jsp");    
            } 
            String editname="";
            String editcontact="";
            String editemail="";
            String editaddress="";
            String sq2 = "select*from tbl_shop where shop_id ='"+session.getAttribute("shid")+"'";
            ResultSet rs2 = con.selectCommand(sq2);
            rs2.next();
            editname = rs2.getString("shop_name");
            editcontact = rs2.getString("shop_contact");
            editemail = rs2.getString("shop_email");
            editaddress = rs2.getString("shop_address");
                        
        %>
        <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post">
      <div class="formbold-form-title">
        <h2 class="">Profile</h2>
      </div>
        <div class="formbold-mb-3">
        <div>
          <label for="txtname" class="formbold-form-label">
            Name
          </label>
          <input 
            name="txtname" 
            placeholder="Enter name" 
            title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$" 
            type="text"
            value="<%=editname%>"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
                    
      <div class="formbold-mb-3">
        <div>
          <label for="txtcontact" class="formbold-form-label">
            Contact
          </label>
          <input 
            name="txtcontact" 
             placeholder="Enter Contact No" 
            title="Phone number with 7-9 and remaing 9 digit with 0-9" 
            pattern="[7-9]{1}[0-9]{9}"
            type="text"
            value="<%=editcontact%>"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
      <div class="formbold-mb-3">
        <div>
          <label for="txtemail" class="formbold-form-label">
            Email
          </label>
          <input 
            name="txtemail" 
            placeholder="Enter Email-Id" 
            type="email"
            value="<%=editemail%>"
            class="formbold-form-input"
            required
          />
        </div>
      </div> 
      <div class="formbold-mb-3">
        <div>
          <label for="txtaddress" class="formbold-form-label">
            Address
          </label>
          <textarea 
            name="txtaddress" 
            placeholder="Enter Address" 
            class="formbold-form-input"
            required
          ><%=editaddress%></textarea>
        </div>
      </div>
                   
    <input type="submit" class="formbold-btn" name="txtupdate" value="Update">&nbsp&nbsp<input type="reset" class="formbold-btn" name="txtreset" value="Cancel">
    </form>
  </div>
</div>
    </body>
    <%@include file="Foot.jsp" %>
</html>
