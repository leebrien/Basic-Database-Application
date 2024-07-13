<%-- 
    Document   : listproduct_processing
    Created on : 11 20, 23, 4:53:33 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Information</title>
    </head>
    <body>
        <%
            String v_productname = "";
            String v_strSupplierId = request.getParameter("supplierid");
            String v_strCategoryId = request.getParameter("categoryid");
            
            
            int v_supplierId = (v_strSupplierId != null && !v_strSupplierId.isEmpty()) ? Integer.parseInt(v_strSupplierId) : 0;
            int v_categoryId = (v_strCategoryId != null && !v_strCategoryId.isEmpty()) ? Integer.parseInt(v_strCategoryId) : 0;
            
            List<product> productList = product.searchProduct(v_productname, 0, v_supplierId, v_categoryId);

        %>
        
        <h2>Results:</h2>
        
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
                    <th>Supplier ID</th>
                    <th>Category ID</th>
                    
                </tr>

                <% for (product thisProduct : productList) { %>
                    <tr>
                        <td><%= thisProduct.productid %></td>
                        <td><%= thisProduct.productname %></td>
                        <td><%= thisProduct.description %></td>
                        <td><%= thisProduct.price %></td>
                        <td><%= thisProduct.supplierid %></td>
                        <td><%= thisProduct.categoryid %></td>
                        
                    </tr>
                <% } %>
            </table>
        <%
            }
        %>
        <br>
        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <a href="listproduct.jsp"><input type="button" value="Search for Another List"></a>
                
    </body>
</html>
