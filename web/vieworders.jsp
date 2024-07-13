<%-- 
    Document   : vieworders
    Created on : 11 21, 23, 6:23:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Orders</title>
</head>
<body>
    <jsp:useBean id="O" class="suppliermanagement.orders" scope="session"/>
    <h1>View Orders</h1>

    <%
        List<orders> orderList = orders.listOrders();

        if (orderList.isEmpty()) {
    %>
            <p>No orders available.</p>
    <%
        } else {
    %>
            <table border="1">
                <tr>
                    <th>Order ID</th>
                    <th>Product ID</th>
                    <th>Product Quantity</th>
                    <th>Price</th>
                    <th>Supplier ID</th>
                    <th>Date Acknowledged</th>
                    <th>Date Shipped</th>
                    <th>Order Status ID</th>
                </tr>

                <%
                    for (orders order : orderList) {
                %>
                        <tr>
                            <td><%= order.orderid %></td>
                            <td><%= order.productid %></td>
                            <td><%= order.productquantity %></td>
                            <td><%= order.price %></td>
                            <td><%= order.supplierid %></td>
                            <td><%= order.dateacknowledged %></td>
                            <td><%= order.dateshipped %></td>
                            <td><%= order.orderstatusid %></td>
                        </tr>
                <%
                    }
                %>
            </table>
    <%
        }
    %>
    
    <a href="productpurchase_menu.html"><input type="button" value="Return"></a>
</body>
</html>
