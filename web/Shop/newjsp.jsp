 <h1>New Complaints</h1>
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
                                </div>
                                <%                                    if (request.getParameter("up") != null) {
                                %>

                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Send Reply</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_district">Reply</label>
                                                    <input required="" type="text" class="form-control" id="txt_reply" name="txt_reply">
                                                    <input type="hidden" name="hid" value="<%=request.getParameter("up")%>">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <%
                                    }


                                %>
                                <h1>Replied Complaints</h1>
                        
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