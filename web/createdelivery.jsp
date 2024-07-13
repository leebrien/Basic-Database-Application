<%-- 
    Document   : createdelivery
    Created on : 11 21, 23, 8:43:05 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Delivery Record</title>
    </head>
    <body>
        <form action="createdelivery_processing.jsp">
        <jsp:useBean id="D" class="suppliermanagement.deliveries" scope="session"/>
        Date Acknowledged:<input type="text" id="dateacknowledged" name="dateacknowledged"/><br>
        Date Shipped:<input type="text" id="dateshipped" name="dateshipped"/><br>
        Shipping Cost:<input type="text" id="shippingcost" name="shippingcost"/><br>
        From Location:<input type="text" id="fromlocation" name="fromlocation"/><br>
        To Location:<input type="text" id="tolocation" name="tolocation"/><br>
        <input type="submit" value="Submit">
        </form>
    </body>
</html>
