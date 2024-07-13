<%-- 
    Document   : updatesupplier
    Created on : 11 19, 23, 10:56:58 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update a Supplier</title>
    </head>
    <body>
        <form action="updatesupplier_inputprocessing.jsp">
            <jsp:useBean id="A" class="suppliermanagement.supplier" scope="session"/>
            <h1>Input supplier ID to be updated</h1>
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
