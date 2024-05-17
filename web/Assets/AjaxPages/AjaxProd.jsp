<%--
    Document   : AjaxProd
    Created on : Feb 28, 2024, 6:25:24 PM
    Author     : ANANTHU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%
        String did = request.getParameter("dsid");
        String pid = request.getParameter("plid");
        String lid = request.getParameter("lid");
        String cid = request.getParameter("caid");
        String scid = request.getParameter("scid");
        String pnid = request.getParameter("pnid");
        int i = 0;
        String selqr = "select*from tbl_product p inner join tbl_shop s on p.shop_id=s.shop_id inner join tbl_location l on s.location_id=l.location_id inner join tbl_place pl on l.place_id=pl.place_id inner join tbl_district d on pl.district_id=d.district_id inner join tbl_subcategory su on p.subcategory_id=su.subcategory_id  inner join tbl_category c on su.category_id=c.category_id where p.product_id > 0";
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
            selqr += " and p.product_name LIKE '%" + pnid + "%'";
        }
        ResultSet rs5 = con.selectCommand(selqr);
        while (rs5.next()) {
    %>
<div class="col-md-4 mb-4">
    <div class="card h-100">
        <img src="../Assets/Files/ProductImage/<%=rs5.getString("product_image")%>" class="card-img-top" alt="<%=rs5.getString("product_name")%>">
        <div class="card-body">
            <h5 class="card-title"><%=rs5.getString("product_name")%></h5>
            <p class="card-text"><%=rs5.getString("product_details")%></p>
            <p class="card-text"><strong>Price: </strong>$<%=rs5.getString("product_price")%></p>
        </div>
        <div class="card-footer">
            <a href="product_details.jsp?product_id=<%=rs5.getString("product_id")%>" class="btn btn-primary">View Details</a>
        </div>
    </div>
</div>
<%
}
%>