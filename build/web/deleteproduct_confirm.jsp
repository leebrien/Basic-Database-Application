<%-- 
    Document   : deleteproduct_confirm
    Created on : 11 20, 23, 5:19:19 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
    </head>
    <body>
        
        <jsp:useBean id="P" class="suppliermanagement.product" scope="session"/>
        <jsp:useBean id="U" class="suppliermanagement.productUsage" scope="session"/>
        <%
            Integer v_productid = Integer.parseInt(request.getParameter("productid"));

            P.productid = v_productid;

            // Call the method to retrieve product information
            int status = P.productInformation();

            // Check if information retrieval was successful
            if (status == 1) {
                
            boolean isUsed = U.isProductUsed(v_productid);
        %>

            <h1>Product Information</h1>
            <ul>
                <li>Product ID: <%= P.productid %></li>
                <li>Product Name: <%= P.productname %></li>
                <li>Description: <%= P.description %></li>
                <li>Price: <%= P.price %></li>
                <li>Supplier ID: <%= P.supplierid %></li>
                <li>Category ID: <%= P.categoryid %></li>
            </ul>
            
            <% if(!isUsed){ %>
                          
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            
            <a href="deleteproduct_processing.jsp?productid=<%= v_productid %>"><input type="button" value="Delete"></a>

            <% } else{ %>
            
            <h2>Product is being used, it cannot be deleted!</h2>
            <a href="deleteproduct.html"><input type="button" value="Return"></a>
            
            <% } %>

            
        <%
            } else {
        %>

            <h1>Product not found!</h1>
            <a href="deleteproduct.html"><input type="button" value="Try Again"></a>
            
        <%
            }
        %>
    </body>
</html>


