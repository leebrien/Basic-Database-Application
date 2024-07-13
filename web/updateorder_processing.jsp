<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Product</title>
</head>
<body>
    <jsp:useBean id="O" class="suppliermanagement.orders" scope="session"/>
    <jsp:useBean id="S" class="suppliermanagement.orderstatus" scope="session"/>
    
    <%
    Integer v_orderid = Integer.parseInt(request.getParameter("orderid"));

    O.orderid = v_orderid;

    // Call the method to retrieve product information
    int status = O.updateOrderStatus(O.orderid);
    
    // Check if information retrieval was successful
    if (status == 1) {
    v_orderid =2;
%>

    <form action="updateorder.jsp" method="post">
        <h1> Update Successful </h1>
        <ul>
            <li>Order ID: <%= O.orderid %></li>
            <li>Order Status ID: <%= v_orderid %></li>
        </ul>

    <input type="submit" value="Update Another">

    </form>
    
    <a href="index.html"><input type="button" value="Back to Main Menu"></a>
<%
    } else {
%>

    <h1>Order not found!</h1>
    <a href="updateorder.jsp"><input type="button" value="Try Again"></a>
    
<%
    }
%>
</body>
</html>
