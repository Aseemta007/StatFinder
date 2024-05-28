<%-- 
    Document   : Login
    Created on : 12 Jan, 2024, 2:59:44 PM
    Author     : aseem
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/Login.css">
    </head>
    <%@include file="Head.jsp" %>
    <%
    
        if(request.getParameter("btn_login")!=null)
        {
            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");
            int sts = 0;
            String seladmin = "select * from tbl_admin where admin_email='"+email+"' and admin_password='"+password+"'";
            String selshop = "select * from tbl_shop where shop_email='"+email+"' and shop_password='"+password+"'";
            String selUser = "select * from tbl_user where user_email='"+email+"' and user_password='"+password+"'";
            ResultSet rsU = con.selectCommand(selUser);
            ResultSet rsAd = con.selectCommand(seladmin);
            ResultSet rssh = con.selectCommand(selshop);
  
        if (rsU.next()) {
                                                sts = rsU.getInt("user_vstate");
                                                if (sts == 0)//property table ill illa
                                                {
                                    %>
                                    <script>
                        alert("Pending verification");
                        window.location="Login.jsp";
                    </script>
                                    <%
                                    }else if (sts == 2)//rejected
                                    {
                                    %>
                                    <script>
                                        alert("Rejected User");
                                        window.location = "Login.jsp";
                                    </script>
                                    <%
                                        } else {
                                            session.setAttribute("uid", rsU.getString("user_id"));
                                            session.setAttribute("uname", rsU.getString("user_name"));
                                            response.sendRedirect("../User/HomePage.jsp");
                                        }
                                        } else if(rsAd.next())
                                        {
                                        session.setAttribute("adid", rsAd.getString("admin_id"));
                                        session.setAttribute("adname", rsAd.getString("admin_name"));
                                        response.sendRedirect("../Admin/HomePage.jsp");
                                    } else if(rssh.next())
                                    {
                                                sts = rssh.getInt("shop_vstate");
                                                if (sts == 0)//property table ill illa
                                                {
                                    %>
                                    <script>
                                        alert("Pending verification");
                                        window.location = "Login.jsp";
                                    </script>
                                    <%
                                    }else if (sts == 2)//rejected
                                    {
                                    %>
                                    <script>
                                        alert("Rejected Shop");
                                        window.location = "Login.jsp";
                                    </script>
                                    <%
                                        } else {
                                            session.setAttribute("shid", rssh.getString("shop_id"));
                                            session.setAttribute("shname", rssh.getString("shop_name"));
                                            response.sendRedirect("../Shop/HomePage.jsp");
                                        }

                                        }else {
                %>
                    <script>
                        alert("Invalid Credentials");
                        window.location="Login.jsp";
                    </script>
                <%
            }
        }
        


                                    %>    

    <body>
        <form method="post">
          <div class="ring">
  <i style="--clr:#00ff0a;"></i>
  <i style="--clr:#F8FF00 ;"></i>
  <i style="--clr:#00FFF6;"></i>
  <div class="login">
    <h2>Login</h2>
    <div class="inputBx">
      <input type="text" id="txt_email" name="txt_email" placeholder="Email">
    </div>
    <div class="inputBx">
      <input type="password" id="txt_password" name="txt_password" placeholder="Password">
    </div>
    <div class="inputBx">
      <input type="submit" name="btn_login" value="Sign in">
    </div>
    <div class="links">
      <a href="UserRegistration.jsp" class="button-17">New User</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="ShopRegistration.jsp" class="button-17">New Shop</a>
  </div>
</div>  
        </form>    
    </body>
    <%@include file="Foot.jsp" %>
</html>


