<%-- 
    Document   : updateinventory
    Created on : 11 21, 23, 1:46:07 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Inventory</title>
    </head>
    <body>
        <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
        <jsp:useBean id="S" class="suppliermanagement.supplier" scope="session"/>
        <%
        Integer v_productid = Integer.parseInt(request.getParameter("productid"));

        I.productid = v_productid;

        int status = I.viewInventoryInformation();
        
        if (status == 1) {
        %>
        <h1>Inventory Information</h1>
        <form action="update_processing.jsp" method="post">
            <ul>
                <li>Product ID: <%= I.productid %></li>
                <input type="hidden" name="old_supplierid" value="<%= I.supplierid %>">
                <input type="hidden" name="old_streetname" value="<%= I.streetname %>">
                <input type="hidden" name="old_city" value="<%= I.city %>">
                <input type="hidden" name="old_zipcode" value="<%= I.zipcode %>">
                <input type="hidden" name="old_region" value="<%= I.region %>">
                <li>Supplier ID: 
                    <select name="supplierid">
                        <%
                            S.getSupplier();
                            for(int i = 0; i < S.supplier_idlist.size(); i++){
                        %>
                            <option value="<%=S.supplier_idlist.get(i)%>" <%= (S.supplier_idlist.get(i) == I.supplierid) ? "selected" : "" %>><%=S.supplier_idlist.get(i)%> : <%=S.completename_List.get(i)%></option>
                        <%
                            }
                        %>
                    </select>
                </li>
                <li>Street Name: <%= I.streetname %> <input type="text" name="streetname" value=""></li>
                <li>City: <%= I.city %> <input type="text" name="city" value=""></li>
                <li>Zip Code: <%= I.zipcode %> <input type="text" name="zipcode" value=""></li>
                <li>Region: <%= I.region %> <input type="text" name="region" value=""></li>
            </ul>
            <input type="submit" value="Update">
        </form>
            <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        <%
        } else {
        %>

        <h1>Product not found!</h1>
        <a href="updateproduct.html"><input type="button" value="Try Again"></a>
        
        <%
        }
        %>
            
    </body>
</html>
