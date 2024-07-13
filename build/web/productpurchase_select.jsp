<%-- 
    Document   : productpurchase_select
    Created on : 11 21, 23, 12:53:07 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Supplier's Products</title>
</head>
<body>
    <%
        String v_strSupplierId = request.getParameter("supplierid");

        int v_supplierId = (v_strSupplierId != null && !v_strSupplierId.isEmpty()) ? Integer.parseInt(v_strSupplierId) : 0;
        
        session.setAttribute("supplierid", v_supplierId);
        List<product> productList = product.searchInventoryProduct(v_supplierId);
        List<inventory> stockList = inventory.searchInventory(0, v_supplierId, null, null, 0, null);

        // Retrieve the error message from the request attribute
        String errorMsg = (String)request.getAttribute("errorMsg");
    %>

    <h2>Supplier's Products</h2>

    <%
        if (productList.isEmpty()) {
    %>
        <p>No matching products found.</p>
    <%
        } else {
    %>
        <table border="1">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Product Description</th>
                <th>Product Price</th>
                <th>Product Stock</th>
                <th>Supplier ID</th>
                <th>Category ID</th>
            </tr>

            <% for (product thisProduct : productList) { %>
                <tr>
                    <td><%= thisProduct.productid %></td>
                    <td><%= thisProduct.productname %></td>
                    <td><%= thisProduct.description %></td>
                    <td><%= thisProduct.price %></td>
                    
                    <!-- Find stock for the corresponding product -->
                    <%
                        int stock = 0;
                        for (inventory stockItem : stockList) {
                            if (stockItem.productid == thisProduct.productid) {
                                stock = stockItem.quantityinstock;
                                break;
                            }
                        }
                    %>
                    
                    <td><%= stock %></td>
                    
                    <td><%= thisProduct.supplierid %></td>
                    <td><%= thisProduct.categoryid %></td>
                </tr>
            <% } %>
        </table>
    <%
        }
    %>

    <br><br>
    <form action="productpurchase_processing.jsp" method="post">
        <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
        <jsp:useBean id="P" class="suppliermanagement.product" scope="session"/>

        <!-- Display error message if it exists -->
        <%
            if (errorMsg != null) {
        %>
            <p style="color: red;"><%= errorMsg %></p>
        <%
            }
        %>

        Select a Product 
        <select id="productid" name="productid">
            <% 
                P.getInventoryProduct(v_supplierId);

                for (int i = 0; i < P.product_idlist.size(); i++) { 
            %>
                <option value="<%=P.product_idlist.get(i)%>"><%=P.product_idlist.get(i)%> : <%=P.productname_list.get(i)%></option>
            <% } %>
        </select><br><br>

        Enter Quantity: 
        <input type="number" id="quantity" name="quantity" min="1" required ><br><br>

        <input type="submit" value="Proceed">
    </form>

    <a href="productpurchase.jsp"><input type="button" value="Return"></a>

</body>
</html>
