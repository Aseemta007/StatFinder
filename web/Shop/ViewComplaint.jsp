
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/compdisp.css">
        <%@include file="Shophead.jsp" %>

    </head>

    <%        if (request.getParameter("btn_save") != null) {

            String upQry = "update tbl_complaint set complaint_reply='" + request.getParameter("txt_reply") + "', complaint_reply_date=curdate(),complaint_status='1' where complaint_id='" + request.getParameter("hid") + "'";
            System.out.println(upQry);
            con.executeCommand(upQry);
            response.sendRedirect("ViewComplaint.jsp");
        }


    %>
    <body>
        <div align="center" id="h2e">
 <h2>New Complaints</h2>
                                    <!-- table-responsive -->
                                    <table>
                                        <thead>
                                            <tr >
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Complaint</td>
                                                <td align="center" scope="col">Date</td>
                                                <td align="center" scope="col">User</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_complaint c inner join tbl_user co on co.user_id=c.user_id where complaint_status='0'";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("complaint_content")%></td>
                                                <td align="center"><%=rs.getString("complaint_date")%></td>
                                                <td align="center"><%=rs.getString("user_name")%></td>
                                                <td align="center"><a href="ViewComplaint.jsp?up=<%=rs.getString("complaint_id")%>" >Reply</a> </td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                               
                                <%                                    if (request.getParameter("up") != null) {
                                %>
                                 <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h3 class="">Send Reply</h3>
      </div>
                               <div class="formbold-mb-3">
        <div>
          <textarea 
            name="txt_reply"  
            title="Reply Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            rows="6" cols="20"
            type="text"
            class="formbold-form-input"
            required
          ></textarea>
            <input type="hidden" name="hid" value="<%=request.getParameter("up")%>">
        </div>
      </div>
                                             
                            <input type="submit" class="formbold-btn" name="btn_register" value="Send">
    </form>
  </div>
</div>

                                                
                                                
                                                
                                                   
                                        
                                    
                              

                                <%
                                    }


                                %>
                                       <br><br> <h2>Replied Complaints</h2>
                        
                                    <!-- table-responsive -->
                                    <table>
                                        <thead>
                                            <tr >
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Complaint</td>
                                                <td align="center" scope="col">Date</td>
                                                <td align="center" scope="col">User</td>
                                                <td align="center" scope="col">Reply</td>
                                                <td align="center" scope="col">Reply Date</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int j = 0;
                                                String selQry1 = "select * from tbl_complaint c inner join tbl_user co on co.user_id=c.user_id where complaint_status='1'";
                                                ResultSet rs1 = con.selectCommand(selQry1);
                                                while (rs1.next()) {

                                                    j++;

                                            %>
                                            <tr>
                                                <td align="center"><%=j%></td>
                                                <td align="center"><%=rs1.getString("complaint_content")%></td>
                                                <td align="center"><%=rs1.getString("complaint_date")%></td>
                                                <td align="center"><%=rs1.getString("user_name")%></td>
                                                <td align="center"><%=rs1.getString("complaint_reply")%></td>
                                                <td align="center"><%=rs1.getString("complaint_reply_date")%></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                                            </div>
                                            
    </body>
    <%@include file="Foot.jsp" %>
</html>