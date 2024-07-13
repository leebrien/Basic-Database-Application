<%-- 
    Document   : generatedeliveryreport
    Created on : 11 22, 23, 5:38:56 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate by Filter</title>
    </head>
    <body>
        <form action="generatedeliveryreport_processing.jsp">
            <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>
            <jsp:useBean id="D" class="suppliermanagement.deliveries" scope="session"/>

            Courier ID:<input type="text" id="courierid" name="courierid"/><br>
            Delivery Number:<input type="text" id="deliveryid" name="deliveryid"/><br>
            Product:<input type="text" id="product" name="product"/><br>
            Seller ID:<input type="text" id="sellerid" name="sellerid"/><br>      
            <input type="submit" value="Generate">
            
            <a href="couriersmenu.html">
                <input type="button" value="Return to Couriers Menu">
            </a>
        </form>
    </body>
</html>
