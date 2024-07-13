<%-- 
    Document   : productpurchase
    Created on : 11 21, 23, 12:08:43 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, suppliermanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select a Supplier</title>
        
    </head>
    <body>
        <form action="productpurchase_select.jsp">
            <jsp:useBean id="I" class="suppliermanagement.inventory" scope="session"/>
            <jsp:useBean id="S" class="suppliermanagement.supplier" scope="session"/>
            
            

            Product's Supplier: 
            <select id="supplierid" name="supplierid">
               <% 
                    I.getInventory();
                    S.getSupplier(); // Load supplier information

                    for (int i = 0; i < I.supplieridlist.size(); i++) { 
                        int currentSupplierId = I.supplieridlist.get(i);
                        String currentSupplierName = ""; // Initialize to an empty string

                        // Find the corresponding supplier name
                        for (int j = 0; j < S.supplier_idlist.size(); j++) {
                            if (S.supplier_idlist.get(j) == currentSupplierId) {
                                currentSupplierName = S.completename_List.get(j);
                                break; // Stop searching once found
                            }
                        }
                %>
                    <option value="<%=currentSupplierId%>">
                        <%=currentSupplierId%> : <%=currentSupplierName%>
                    </option>
                <% } %>

            </select><br><br>
        
            <input type="submit" value="Proceed">
        </form>
        
        <a href="index.html"><input type="button" value="Main Menu"></a>
        
    </body>
</html>
