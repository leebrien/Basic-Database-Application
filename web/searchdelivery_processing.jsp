<%-- 
    Document   : searchdelivery_processing
    Created on : 11 21, 23, 10:35:17 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Delivery</title>
    </head>
    <body>
         <%
            String v_strCourierID = request.getParameter("courierid");
            String v_strOrderID = request.getParameter("orderid");
            String v_strDeliveryStatID = request.getParameter("deliverystatusid");
            String v_strShippingCost = request.getParameter("shippingcost");
            String v_dateacknowledged = request.getParameter("dateacknowledged");
            String v_dateshipped = request.getParameter("dateshipped");
            String v_fromlocation = request.getParameter("fromlocation");
            String v_tolocation = request.getParameter("tolocation");
            
            System.out.println("strCourierID: " + v_strCourierID);
            System.out.println("strOrderID: " + v_strOrderID);
            System.out.println("strDeliveryStatID: " + v_strDeliveryStatID);
            System.out.println("strShippingCost: " + v_strShippingCost);
            System.out.println("dateacknowledged: " + v_dateacknowledged);
            System.out.println("dateshipped: " + v_dateshipped);
            System.out.println("fromlocation: " + v_fromlocation);
            System.out.println("tolocation: " + v_tolocation);
            
            int v_courierid = (v_strCourierID != null && !v_strCourierID.isEmpty()) ? Integer.parseInt(v_strCourierID) : 0;
            int v_orderid = (v_strOrderID != null && !v_strOrderID.isEmpty()) ? Integer.parseInt(v_strOrderID) : 0;
            int v_deliverystatusid = (v_strDeliveryStatID != null && !v_strDeliveryStatID.isEmpty()) ? Integer.parseInt(v_strDeliveryStatID) : 0;
            int v_shippingcost = (v_strShippingCost != null && !v_strShippingCost.isEmpty()) ? Integer.parseInt(v_strShippingCost) : 0;
            
            List<deliveries> deliveryList = inventory.searchInventory(v_courierid, v_orderid, v_deliverystatusid, v_shippingcost, v_dateacknowledged, v_dateshipped, v_fromlocation, v_tolocation);
            
            System.out.println("Converted CourierId: " + v_courierid);
            System.out.println("Delivery List Size: " + deliveryList.size());
        %>
        
        <h2>Search Results:</h2>
        
        <%
            if (deliveryList.isEmpty()) {
        %>
            <p>No matching delivery found.</p>
        <%
            } else {
        %>
            <table border="1">
                <tr>
                    <th>Order ID</th>
                    <th>Courier ID</th>
                    <th>Delivery Status ID</th>
                    <th>Shipping Cost</th>
                    <th>Date Acknowledged</th>
                    <th>Date Shipped</th>
                    <th>From Location</th>
                    <th>To Location</th>
                    
                    
                </tr>

                <% for (deliveries thisDelivery : deliveryList) { %>
                    <tr>
                        <td><%= thisDelivery.orderid %></td>
                        <td><%= thisDelivery.courierid %></td>
                        <td><%= thisDelivery.deliverystatusid %></td>
                        <td><%= thisDelivery.shippingcost %></td>
                        <td><%= thisDelivery.dateacknowledged %></td>
                        <td><%= thisDelivery.dateshipped %></td>
                        <td><%= thisDelivery.fromlocation %></td>
                        <td><%= thisDelivery.tolocation %></td>
                        
                        
                    </tr>
                <% } %>
            </table>
        <%
            }
        %>
        <br>
        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <a href="searchdelivery.jsp"><input type="button" value="Search for Another Delivery"></a>
    </body>
</html>
