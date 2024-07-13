<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Processing</title>
</head>
<body>
    <%
        Connection conn = null;

        try {
            // Retrieve product ID and quantity from the form
            String selectedProductIdStr = request.getParameter("productid");
            String quantityStr = request.getParameter("quantity");

            int selectedProductId = (selectedProductIdStr != null && !selectedProductIdStr.isEmpty()) ? Integer.parseInt(selectedProductIdStr) : 0;
            int quantity = (quantityStr != null && !quantityStr.isEmpty()) ? Integer.parseInt(quantityStr) : 0;

            // Retrieve supplier ID from the session (assuming it's stored in the session)
            int supplierId = (int)session.getAttribute("supplierid");

            // Retrieve product information
            int productPrice = 0;
            int quantityInStock = 0;

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            // Retrieve product information
            String productInfoQuery = "SELECT p.price, i.quantityinstock FROM products p JOIN inventory i ON p.productid = i.productid WHERE p.productid = ?";

            try (PreparedStatement productInfoStmt = conn.prepareStatement(productInfoQuery)) {
                productInfoStmt.setInt(1, selectedProductId);
                try (ResultSet productInfoResult = productInfoStmt.executeQuery()) {
                    if (productInfoResult.next()) {
                        productPrice = productInfoResult.getInt("price");
                        quantityInStock = productInfoResult.getInt("quantityinstock");
                    }
                }
            }

            // Check if the requested quantity exceeds the available quantity in stock
            if (quantity > quantityInStock) {
    %>
                <h2>Error: Insufficient Quantity in Stock</h2>
                <p>The requested quantity exceeds the available quantity in stock. Available Quantity: <%= quantityInStock %></p>
                <a href="productpurchase.jsp"><input type="button" value="Return"></a>
    <%
            } else {
                // Calculate the total price
                int totalPrice = quantity * productPrice;

                // Get the next available orderid
                int nextOrderId = 0;
                String nextOrderIdQuery = "SELECT MAX(orderid) + 1 AS nextOrderId FROM orders";
                try (PreparedStatement nextOrderIdStmt = conn.prepareStatement(nextOrderIdQuery)) {
                    try (ResultSet nextOrderIdResult = nextOrderIdStmt.executeQuery()) {
                        if (nextOrderIdResult.next()) {
                            nextOrderId = nextOrderIdResult.getInt("nextOrderId");
                        }
                    }
                }

                // Insert the order record into the database
                String insertOrderQuery = "INSERT INTO orders (orderid, productid, supplierid, productquantity, price, dateacknowledged, dateshipped, orderstatusid) VALUES (?, ?, ?, ?, ?, NOW(), NULL, 1)";
                try (PreparedStatement insertOrderStmt = conn.prepareStatement(insertOrderQuery)) {
                    insertOrderStmt.setInt(1, nextOrderId);
                    insertOrderStmt.setInt(2, selectedProductId);
                    insertOrderStmt.setInt(3, supplierId);
                    insertOrderStmt.setInt(4, quantity);
                    insertOrderStmt.setInt(5, totalPrice);
                    insertOrderStmt.executeUpdate();
                }

                // Deduct quantity from inventory
                inventory inventoryItem = new inventory();
                inventoryItem.productid = selectedProductId;
                int deductResult = inventoryItem.deductQuantityFromInventory(quantity);

                // Check if the deduction was successful
                if (deductResult == 1) {
    %>
                    <h2>Order Successfully Processed</h2>
                    <p>Product ID: <%= selectedProductId %></p>
                    <p>Quantity: <%= quantity %></p>
                    <p>Total Price: <%= totalPrice %></p>
                    <a href="productpurchase.jsp"><input type="button" value="Return"></a>
    <%
                } else {
    %>
                    <h2>Error Deducting Quantity from Inventory</h2>
                    <p>An error occurred while deducting quantity from the inventory. Please try again.</p>
                    <a href="index.html"><input type="button" value="Return to Main Menu"></a>
    <%
                }
            }
        } catch (SQLException e) {
    %>
            <h2>Error Processing Order</h2>
            <p>An error occurred while processing the order. Please try again. Error Details: <%= e.getMessage() %></p>
            <a href="index.html"><input type="button" value="Return to Main Menu"></a>
    <%
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
