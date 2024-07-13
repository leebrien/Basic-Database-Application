<%-- 
    Document   : createdelivery_processing
    Created on : 11 21, 23, 8:51:55 PM
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
        <form action="index.html">
            <jsp:useBean id="D" class="suppliermanagement.deliveries" scope="session"/>
            <%
                Integer v_deliverystatusid = Integer.parseInt(request.getParameter("deliverystatusid"));
                Integer v_shippingcost = Integer.parseInt(request.getParameter("shippingcost"));
                String v_dateacknowledged = request.getParameter("dateacknowledged");
                String v_dateshipped = request.getParameter("dateshipped");
                String v_fromlocation = request.getParameter("fromlocation");
                String v_tolocation = request.getParameter("tolocation");
                
                D.deliverystatusid = v_deliverystatusid;
                D.shippingcost = v_shippingcost;
                D.dateacknowledged = v_dateacknowledged;
                D.dateshipped = v_dateshipped;
                D.fromlocation = v_fromlocation;
                D.tolocation = v_tolocation;
                
                int status = D.createDelivery();
                if (status == 1) {
            %>
            <h1>Creating Delivery Successful</h1>
            <p>Delivery Details:</p>
            <ul>
                <li>Delivery Status ID: <%= D.deliverystatusid %></li>
                <li>Shipping Cost: <%= D.shippingcost %></li>
                <li>Date Acknowledged: <%= D.dateacknowledged %></li>
                <li>Date Shipped: <%= D.dateshipped %></li>
                <li>From Location: <%= D.fromlocation %></li>
                <li>To Location: <%= D.tolocation %></li>
               
            </ul>
            <%} else {
            %>
            <h1>Creating Delivery Unsuccessful </h1>
            <%
                }
            %>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>
