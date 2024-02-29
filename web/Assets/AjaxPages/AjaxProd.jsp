<%-- 
    Document   : AjaxProd
    Created on : Feb 28, 2024, 6:25:24 PM
    Author     : ANANTHU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<tr>
    <%
        String did = request.getParameter("dsid");
        String pid = request.getParameter("plid");
        String lid = request.getParameter("lid");
        String cid = request.getParameter("caid");
        String scid = request.getParameter("scid");
        String pnid = request.getParameter("pnid");
        int i = 0;
        String selqr="select*from tbl_product p inner join tbl_shop s on p.shop_id=s.shop_id inner join tbl_location l on s.location_id=l.location_id"
                    + " inner join tbl_place pl on l.place_id=pl.place_id inner join tbl_district d on pl.district_id=d.district_id inner join "
                    + " tbl_subcategory su on p.subcategory_id=su.subcategory_id  inner join tbl_category c on su.category_id=c.category_id where p.product_id > 0";
        if (!did.equals("")) {
            selqr += " and d.district_id = '" + did + "'";
        }
        if (!pid.equals("")) {
            selqr += " and l.place_id = '" + pid + "'";
        }
        if (!lid.equals("")) {
            selqr += " and s.location_id = '" + lid + "'";
        }
        if (!cid.equals("")) {
            selqr += " and c.category_id = '" + cid + "'";
        }
        if (!scid.equals("")) {
            selqr += " and su.subcategory_id = '" + scid + "'";
        }
        if (!pnid.equals("")) {
            selqr += " and p.product_name LIKE '%"+pnid+"%'";
        }
        ResultSet rs5 = con.selectCommand(selqr);
         while (rs5.next()) {
          %>
           <td style="padding:30px">
                <p style="border:1px solid black;padding:20px;text-align:center">
                    <img src="../Assets/Files/ProductImage/<%=rs5.getString("product_image")%>" style="border-radius:50%" width="80" height="80"/><br /><br />
                    Product Name:<%=rs5.getString("product_name")%>
                    <br /><br />
                    Price<%=rs5.getString("product_price")%>
                    <br /><br />
                    <%=rs5.getString("shop_name")%>
                    </p>
    </td>
         }
       <%
            if (i == 4) {
                out.println("</tr><tr>");
                i = 0;
            }
        }
    %>