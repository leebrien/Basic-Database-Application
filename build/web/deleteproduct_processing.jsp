<%-- 
    Document   : deleteproduct_processing
    Created on : 11 20, 23, 5:42:01 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Product</title>
    </head>
    <body>
        <jsp:useBean id="P" class="suppliermanagement.product" scope="session"/>
        
        
        <% 
            Integer v_productid = Integer.parseInt(request.getParameter("productid"));
            
            int productDeleted = P.deleteProduct(v_productid);
        
        if (productDeleted == 1){ %>
            
            <h1>Product Deleted Successfully</h1>
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            <a href="deleteproduct.html"><input type="button" value="Delete Another Product"></a>
        <% } 
        
        else { %>
            
            <h1>Product Deletion Unsuccessful</h1>
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            <a href="deleteproduct.html"><input type="button" value="Delete Another Product"></a>
        <% } %>
            
    </body>
</html>
