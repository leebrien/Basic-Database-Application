<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cancel Order Processing</title>
</head>
<body>
    <%
        // Get the order ID from the request
        String orderIdStr = request.getParameter("orderid");

        // Check if order ID is provided
        if (orderIdStr != null && !orderIdStr.isEmpty()) {
            try {
                // Parse the order ID
                int orderId = Integer.parseInt(orderIdStr);

                // Create an instance of the orders class
                orders order = new orders();

                // Get order information
                order.orderid = orderId;
                int result = order.orderInformation();

                // Check if the order information retrieval was successful
                if (result == 1) {
                    // Check if the order is in a cancelable state (status not 3 or 4)
                    if (order.orderstatusid != 3 && order.orderstatusid != 4) {
                        // Set the order status to 4 (canceled)
                        int cancelResult = order.cancelOrder(orderId);

                        // Check if the order status update was successful
                        if (cancelResult == 1) {
                            // Get product information to add quantity back to inventory
                            inventory inventoryItem = new inventory();
                            inventoryItem.productid = order.productid;
                            int inventoryResult = inventoryItem.viewInventoryInformation();

                            // Check if inventory information retrieval was successful
                            if (inventoryResult == 1) {
                                // Add the product quantity back to the inventory
                                int newQuantity = inventoryItem.quantityinstock + order.productquantity;
                                int updateInventoryResult = inventoryItem.updateInventory(newQuantity, inventoryItem.streetname, inventoryItem.city, inventoryItem.zipcode, inventoryItem.region);

                               
                                // Check if the inventory update was successful
                                if (updateInventoryResult == 1) {
                                    out.println("<h2>Order Cancellation Successful</h2>");
                                    out.println("<p>Order ID: " + orderId + "</p>");
                                    out.println("<p>Order Status: Canceled</p>");
                                    out.println("<p>Product Quantity Added Back to Inventory: " + order.productquantity + "</p>");
                                } else {
                                    out.println("<h2>Error: Failed to update inventory</h2>");
                                }
                            } else {
                                out.println("<h2>Error: Failed to retrieve inventory information</h2>");
                            }

                        } else {
                            out.println("<h2>Error: Failed to cancel order</h2>");
                        }
                    } else {
                        out.println("<h2>Error: Order is in an invalid state for cancellation</h2>");
                    }
                } else {
                    out.println("<h2>Error: Failed to retrieve order information</h2>");
                }
            } catch (NumberFormatException e) {
                out.println("<h2>Error: Invalid order ID</h2>");
            }
        } else {
            out.println("<h2>Error: Order ID not provided</h2>");
        }
    %>
    
     <a href="index.html"><input type="button" value="Return to Main Menu"></a>
</body>
</html>
