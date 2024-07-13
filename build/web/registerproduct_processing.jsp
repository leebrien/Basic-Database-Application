<%-- 
    Document   : registersupplier_processing
    Created on : 11 15, 23, 9:50:35 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Product Processing</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id="P" class="suppliermanagement.product" scope="session"/>
            <%
                String v_productname = request.getParameter("productname");
                String v_description = request.getParameter("description");
                Integer v_price = Integer.parseInt(request.getParameter("price"));
                Integer v_supplierid = Integer.parseInt(request.getParameter("supplierid"));
                Integer v_categoryid = Integer.parseInt(request.getParameter("categoryid"));
                
                P.productname = v_productname;
                P.description = v_description;
                P.price = v_price;
                P.supplierid = v_supplierid;
                P.categoryid = v_categoryid;
                
                int status = P.register_product();
                if (status == 1) {
            %>
            <h1>Registering Product Successful</h1>
            <p>Product Details:</p>
            <ul>
                <li>Product Name: <%= P.productname %></li>
                <li>Product Description: <%= P.description %></li>
                <li>Product Price: <%= P.price %></li>
                <li>Product Supplier: <%= P.supplierid %></li>
                <li>Product Category: <%= P.categoryid %></li>  
            </ul>
            <%} else {
            %>
            <h1>Registering Product Unsuccessful </h1>
            <%
                }
            %>
            <input type="submit" value="Return to menu">
        </form>
    </body>
</html>