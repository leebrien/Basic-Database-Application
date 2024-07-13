<%-- 
    Document   : generateorderreport_processing
    Created on : 11 22, 23, 2:14:06 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate Report for Time Taken for Order Completion</title>
    </head>
    <body>
        <form>
        <jsp:useBean id="O" class="suppliermanagement.orders" scope="session"/>
        <%
            boolean sFlag = false, pFlag = false, daFlag = false, dsFlag = false;
            
            String supplierid = request.getParameter("supplierid");
            String productid = request.getParameter("productid");
            String dateacknowledged = request.getParameter("dateacknowledged");
            String dateshipped = request.getParameter("dateshipped");
            
            
            if (supplierid != null && supplierid.isEmpty() == false) {
                sFlag = true;
            }
            if (productid != null && productid.isEmpty() == false) {
                pFlag = true;
            }
            if (dateacknowledged != null && dateacknowledged.isEmpty() == false) {
                daFlag = true;
            }
            if (dateshipped != null && dateshipped.isEmpty() == false) {
                dsFlag = true;
            }
      
            ArrayList<orders> ordersList= O.checkOrders(sFlag, pFlag, daFlag, dsFlag, supplierid, productid, dateacknowledged, dateshipped);
            
            //List<supplier> = supplier.getList(criteria);
        %>
        
        <h2>Generation Results:</h2>
        
        <%
            if (ordersList.isEmpty()) {
        %>
            <p>No orders were made with entered criteria.</p>
        <%
            } else {
        %>
            <table border="1">
                <tr>
                    <th>Order ID</th>
                    <th>Supplier ID</th>
                    <th>Product ID</th>
                    <th>Product Quantity</th>
                    <th>Date Acknowledged</th>
                    <th>Date Shipped</th>
                    <th>Status</th>
                    
                    
                </tr>

                <% for (orders thisOrder : ordersList) { %>
                    <tr>
                        <td><%= thisOrder.orderid %></td>
                        <td><%= thisOrder.supplierid %></td>
                        <td><%= thisOrder.productid %></td>
                        <td><%= thisOrder.productquantity %></td>
                        <td><%= thisOrder.dateacknowledged %></td>
                        <td><%= thisOrder.dateshipped %></td>
                        <td><%= thisOrder.orderstatusid %></td>
                    </tr>
                <% } %>
            </table>
        <%
            }
        %>
        <br>
        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <a href="generateorderreport.jsp"><input type="button" value="Generate Another Report"></a>
        </form>
    </body>
</html>
