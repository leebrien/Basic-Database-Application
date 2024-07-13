<%-- 
    Document   : viewsupplier
    Created on : 11 21, 23, 3:19:39 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View a Supplier's Information</title>
    </head>
    <body>
        <form action="viewsupplier_processing.jsp">
            <jsp:useBean id="A" class="suppliermanagement.supplier" scope="session"/>
            <h1>Input supplier ID to be viewed</h1>
            <%
                A.getSupplier();
            %>
            Supplier ID: <select id="supplieridU" name="supplieridU">
                <%for (int i = 0; i < A.supplier_idlist.size(); i++) {%>
                    <option value="<%=A.supplier_idlist.get(i)%>"> <%=A.supplier_idlist.get(i)%>: <%=A.completename_list.get(i)%></option>
                <%}%>
            </select><br>
           
            <input type="submit" value="Submit">
        </form>
        <form action="suppliermenu.html">
            <input type="submit" value="Cancel">
        </form>
    </body>
</html>
