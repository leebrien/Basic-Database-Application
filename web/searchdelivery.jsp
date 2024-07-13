<%-- 
    Document   : searchdelivery
    Created on : 11 21, 23, 10:20:56 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Delivery</title>
    </head>
    <body>
        <form action="searchdelivery_processing.jsp">
            <jsp:useBean id="D" class="suppliermanagement.deliveries" scope="session"/>
            Shipping Cost            :<input type="text" id="shippingcost" name="shippingcost"/><br>
            Date Acknowledged          :<input type="text" id="dateacknowledged" name="dateacknowledged"/><br>
            Date Shipped          :<input type="text" id="dateshipped" name="dateshipped"/><br>
            From Location         :<input type="text" id="fromlocation" name="fromlocation"/><br>
            To Location          :<input type="text" id="tolocation" name="tolocation"/><br>
            <input type="submit" value="Search">
            
            <a href="index.html">
                <input type="button" value="Return to Main Menu">
            </a>
        </form>
    </body>
</html>
