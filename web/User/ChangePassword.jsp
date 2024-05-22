<%-- 
    Document   : ChangePassword
    Created on : Jan 18, 2024, 12:03:20 PM
    Author     : ANANTHU
--%>



<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
                 <link rel="stylesheet" href="../Assets/Templates/Main/css/changepass.css">
    </head>
    <%@include file="Userhead.jsp" %>
    <%  
        
       String currentpsswd=request.getParameter("txtpsswd");
       String newpsswd = request.getParameter("txtnpsswd");
       String repsswd = request.getParameter("txtrpsswd");
       String pass ="";
       String sq = "select*from tbl_user where user_id ='"+session.getAttribute("uid")+"'";
       ResultSet rs = con.selectCommand(sq);
       rs.next();
       pass = rs.getString("user_password");
       if(request.getParameter("txtupdate")!=null)
       {      
        if(pass.equals(currentpsswd))
        {
            if(newpsswd.equals(repsswd))
            {
                String uq = "update tbl_user set user_password = '"+request.getParameter("txtnpsswd")+"'where user_id = '"+session.getAttribute("uid")+"'";
                con.executeCommand(uq);
                                %>
                    <script>
                        alert("New password Set");
                        window.location.href='../Guest/Login.jsp';
                    </script>
                <%
            }
            else
            {
                %>
                    <script>
                        alert("New password Mismatched");
                        window.location="ChangePassword.jsp";
                    </script>
                <%
            }
        }
        else
        {
            %>
            <script>
                alert("Current Password Mismatched");
                window.location="ChangePassword.jsp";
            </script>
            <%
        }
       }
    %>
    <body>
    <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post">
      <div class="formbold-form-title">
        <h2 class="">Change Password</h2>
      </div>
       
      <div class="formbold-mb-3">
        <div>
          <label for="currentpass" class="formbold-form-label">
            Current Password
          </label>
          <input 
            type="password" 
            name="txtpsswd" 
            placeholder="Enter Current Password" 
            title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
      
        <div class="formbold-mb-3">
        <div>
          <label for="newpass" class="formbold-form-label">
            New Password
          </label>
          <input 
            type="password" 
            name="txtnpsswd" 
            placeholder="Enter New Password" 
            title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
        
      <div class="formbold-mb-3">
        <div>
          <label for="repass" class="formbold-form-label">
            Retype Password
          </label>
          <input 
           type="password" 
           name="txtrpsswd" 
           placeholder="ReEnter Password"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
      <input type="submit" class="formbold-btn" name="txtupdate" value="Save">&nbsp&nbsp<input type="reset" class="formbold-btn" name="btn_reset" value="Reset">
    </form>
  </div>
</div> 
    </body>
    <%@include file="../Guest/Foot.jsp" %>
</html>
