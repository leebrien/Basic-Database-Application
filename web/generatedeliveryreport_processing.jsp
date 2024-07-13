<%-- 
    Document   : generatedeliveryreport_processing
    Created on : 11 22, 23, 5:40:26 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Generated</title>
    </head>
    <body>
        <form>
        <jsp:useBean id="C" class="couriersmgt.couriers" scope="session"/>
        <jsp:useBean id="D" class="suppliermanagement.deliveries" scope="session"/>

        <a href="index.html"><input type="button" value="Back to Main Menu"></a>
        </form>
    </body>
</html>
