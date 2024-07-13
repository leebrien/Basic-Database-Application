<%-- 
    Document   : deletesupplier_processing
    Created on : 11 17, 23, 7:05:38 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete a Supplier</title>
    </head>
    <body>
        <form action="suppliermenu.html">
            <jsp:useBean id="A" class="suppliermanagement.supplier" scope="session"/>
            <%
                String v_supplier_id = request.getParameter("suppliers");
                
                int supID = Integer.valueOf(v_supplier_id);
                A.supplierid = supID;
                int status = A.delete_supplier(v_supplier_id);
                if (status == 1) {
            %>
            <h1>Record is deleted</h1>
            <%} else {
            %>
            <h1>Record is not deleted</h1>
            <%
                }
            %>
            <input type="submit" value="Return to supplier menu">
        </form>
        <a href ="deletesupplier.jsp"><input type="button" value="Delete another supplier"></a>
    </body>
</html>
