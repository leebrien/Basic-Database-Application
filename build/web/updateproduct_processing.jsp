<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Product</title>
    
</head>
<body>
    <jsp:useBean id="P" class="suppliermanagement.product" scope="session"/>
    <%
        // Retrieve parameters from the form submission
        String productname = request.getParameter("productname");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String supplieridStr = request.getParameter("supplierid");
        String categoryidStr = request.getParameter("categoryid");

        // Validate that all fields are provided
        if (productname == null || description == null || priceStr == null || supplieridStr == null || categoryidStr == null ||
            productname.isEmpty() || description.isEmpty() || priceStr.isEmpty() || supplieridStr.isEmpty() || categoryidStr.isEmpty()) {
    %>
        <h1>All fields are required. Please provide values for all fields.</h1>
        <a href="updateproduct_update.jsp?productid=<%= P.productid %>"><input type="button" value="Back to Update"></a>
    <%
        } else {
            // Proceed with data type validation
            try {
                // Parse values to check data type
                int price = Integer.parseInt(priceStr);
                int supplierid = Integer.parseInt(supplieridStr);
                int categoryid = Integer.parseInt(categoryidStr);
                
                // Retrieve old values from hidden fields
                String oldProductName = request.getParameter("old_productname");
                String oldDescription = request.getParameter("old_description");
                int oldPrice = Integer.parseInt(request.getParameter("old_price"));
                int oldSupplierId = Integer.parseInt(request.getParameter("old_supplierid"));
                int oldCategoryId = Integer.parseInt(request.getParameter("old_categoryid"));

                // Retrieve new values from the submitted form
                String newProductName = request.getParameter("productname");
                String newDescription = request.getParameter("description");
                int newPrice = Integer.parseInt(request.getParameter("price"));
                int newSupplierId = Integer.parseInt(request.getParameter("supplierid"));
                int newCategoryId = Integer.parseInt(request.getParameter("categoryid"));

         
                int updateStatus = P.updateProduct(newProductName, newDescription, newPrice, newSupplierId, newCategoryId);


                // Check if the update was successful
                if (updateStatus == 1) {
    %>
                <h1>Product Updated Successfully!</h1>

                <table border="1">
                    <caption>Old Values</caption>
                    <tr>
                        <th>Attribute</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Product Name</td>
                        <td><%= oldProductName %></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><%= oldDescription %></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><%= oldPrice %></td>
                    </tr>
                    <tr>
                        <td>Supplier ID</td>
                        <td><%= oldSupplierId %></td>
                    </tr>
                    <tr>
                        <td>Category ID</td>
                        <td><%= oldCategoryId %></td>
                    </tr>
                </table>
                    <br>
                <table border="1">
                    <caption>New Values</caption>
                    <tr>
                        <th>Attribute</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Product Name</td>
                        <td><%= newProductName %></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><%= newDescription %></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><%= newPrice %></td>
                    </tr>
                    <tr>
                        <td>Supplier ID</td>
                        <td><%= newSupplierId %></td>
                    </tr>
                    <tr>
                        <td>Category ID</td>
                        <td><%= newCategoryId %></td>
                    </tr>
                </table>
                    <br>
                <a href="index.html"><input type="button" value="Back to Main Menu"></a>
                <a href="updateproduct.html"><input type="button" value="Update Another Product"></a>
    <%
                } else {
    %>
                    <h1>Error Updating Product!</h1>
                    <a href="updateproduct_update.jsp?productid=<%= P.productid %>"><input type="button" value="Try Again"></a>
    <%
                }
            } catch (NumberFormatException e) {
    %>
                <h1>Invalid data type. Please provide valid numeric values for Price, Supplier ID, and Category ID.</h1>
                <a href="updateproduct_update.jsp?productid=<%= P.productid %>"><input type="button" value="Back to Update"></a>
    <%
            }
        }
    %>
 
</body>
</html>
