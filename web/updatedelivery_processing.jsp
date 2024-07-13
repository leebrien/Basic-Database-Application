<%-- 
    Document   : updatedelivery_processing
    Created on : 11 21, 23, 9:10:51 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Delivery</title>
    </head>
    <body>
        <jsp:useBean id="D" class="suppliermanagement.deliveries" scope="session"/>
        <%
        // Retrieve parameters from the form submission
        String deliverystatusidStr = request.getParameter("deliverystatusid");
        String shippingcostStr = request.getParameter("shippingcost");
        String dateacknowledged = request.getParameter("dateacknowledged");
        String dateshipped = request.getParameter("zipcode");
        String fromlocation = request.getParameter("fromlocation");
        String tolocation = request.getParameter("tolocation");

        // Validate that all fields are provided
        if (deliverystatusidStr == null || shippingcostStr == null || dateacknowledged == null || dateshipped == null ||fromlocation == null || tolocation == null ||
            deliverystatusidStr.isEmpty() || shippingcostStr.isEmpty() || dateacknowledged.isEmpty() || dateshipped.isEmpty() || fromlocation.isEmpty() || tolocation.isEmpty()) {
    %>
    <h1>All fields are required. Please provide values for all fields.</h1>
        <a href="updatedelivery.jsp?orderid=<%= D.orderid %>"><input type="button" value="Back to Update"></a>
        <%
        } else {
            // Proceed with data type validation
            try {
                // Parse values to check data type
                int deliverystatusid = Integer.parseInt(deliverystatusidStr);
                int shippingcost = Integer.parseInt(shippingcostStr);
                
                int oldDeliveryStatusId = Integer.parseInt(request.getParameter("old_deliverystatusid"));
                int oldShippingCost = Integer.parseInt(request.getParameter("old_shippingcost"));
                String oldDateAcknowledged = request.getParameter("old_dateacknowledged");
                String oldDateShipped = request.getParameter("old_dateshipped");
                String oldFromLocation = request.getParameter("old_fromlocation");
                String oldToLocation = request.getParameter("old_tolocation");

                // Retrieve new values from the submitted form
                int new_deliverystatusid = Integer.parseInt(request.getParameter("deliverystatusid"));
                int new_shippingcost = Integer.parseInt(request.getParameter("shippingcost"));
                String new_dateacknowledged = request.getParameter("dateacknowledged");
                String new_dateshipped = request.getParameter("dateshipped");
                String new_fromlocation = request.getParameter("fromlocation");
                String new_tolocation = request.getParameter("tolocation");

                int updateStatus = D.updateDelivery(new_deliverystatusid, new_shippingcost, new_dateacknowledged, new_dateshipped, new_fromlocation, new_tolocation);


                // Check if the update was successful
                if (updateStatus == 1) {
    %>
        <h1>Delivery Updated Successfully!</h1>

                <table border="1">
                    <caption>Old Values</caption>
                    <tr>
                        <th>Attribute</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>Delivery Status ID</td>
                        <td><%= oldDeliveryStatusId %></td>
                    </tr>
                    <tr>
                        <td>Shipping Cost</td>
                        <td><%= oldShippingCost %></td>
                    </tr>
                    <tr>
                        <td>Date Acknowledged</td>
                        <td><%= oldDateAcknowledged %></td>
                    </tr>
                    <tr>
                        <td>Date Shipped</td>
                        <td><%= oldDateShipped %></td>
                    </tr>
                    <tr>
                        <td>From Location</td>
                        <td><%= oldFromLocation %></td>
                    </tr>
                    <tr>
                        <td>To Location</td>
                        <td><%= oldToLocation %></td>
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
                        <td>Delivery Status ID</td>
                        <td><%= new_deliverystatusid %></td>
                    </tr>
                    <tr>
                        <td>Shipping Cost</td>
                        <td><%= new_shippingcost %></td>
                    </tr>
                    <tr>
                        <td>Date Acknowledged</td>
                        <td><%= new_dateacknowledged %></td>
                    </tr>
                    <tr>
                        <td>Date Shipped</td>
                        <td><%= new_dateshipped %></td>
                    </tr>
                    <tr>
                        <td>From Location</td>
                        <td><%= new_fromlocation %></td>
                    </tr>
                    <tr>
                        <td>To Location</td>
                        <td><%= new_tolocation %></td>
                    </tr>
                </table>
                    <br>
                <a href="index.html"><input type="button" value="Back to Main Menu"></a>
                <a href="updatedelivery.html"><input type="button" value="Update Another Delivery"></a>
    <%
                } else {
    %>
                    <h1>Error Updating Delivery!</h1>
                    <a href="updatedelivery.jsp?orderid=<%= D.orderid %>"><input type="button" value="Try Again"></a>
    <%
                }
            } catch (NumberFormatException e) {
    %>
                <h1>Invalid data type. Please provide valid numeric values for Shipping Cost and Delivery Status ID.</h1>
                <a href="updatedelivery.jsp?orderid=<%= D.orderid %>"><input type="button" value="Back to Update"></a>
    <%
            }
        }
    %>
    </body>
</html>
