<%-- 
    Document   : createinventory
    Created on : 11 21, 23, 1:24:36 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Inventory</title>
    </head>
    <body>
        <form action="create_processing.jsp">
        <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
        Inventory Street Name:<input type="text" id="streetname" name="streetname"/><br>
        Inventory City:<input type="text" id="city" name="city"/><br>
        Inventory Zip Code:<input type="text" id="zipcode" name="zipcode"/><br>
        Inventory Region:<input type="text" id="region" name="region"/><br> 
        <input type="submit" value="Submit">
        </form>
    </body>
</html>
