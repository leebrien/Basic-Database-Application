<%-- 
    Document   : delete_processing
    Created on : 11 20, 23, 3:01:48 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Inventory</title>
    </head>
    <body>
        <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
        <% 
            Integer v_productid = Integer.parseInt(request.getParameter("productid"));
            
            int invDeleted = I.deleteInventory(v_productid);
        
        if (invDeleted == 1){ %>
            
            <h1>Inventory Deleted Successfully</h1>
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            <a href="deleteinventory.html"><input type="button" value="Delete Another Inventory"></a>
        <% } 
        
        else { %>
            
            <h1>Inventory Deletion Unsuccessful</h1>
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
            <a href="deleteinventory.html"><input type="button" value="Delete Another Inventory"></a>
        <% } %>
    </body>
</html>
