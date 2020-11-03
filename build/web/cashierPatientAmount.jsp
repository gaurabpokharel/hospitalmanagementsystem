<!DOCTYPE html>  

<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>Appointment Request List</title>  
    </head>  
    <body style="background-color: whitesmoke">  
        <form>
            <%@page import="com.info.dao.*,com.info.method.*,java.util.*"%>  
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

            <h1 style="text-align: center">Patient Amount</h1>  
            <hr>
             
           <%
                List<appointmentbean> list = appointmentDao.getShowAmountAllRecords();
                request.setAttribute("list", list);
            %> 
            
            <table border="1" width="90%" style="text-align: center;margin-left: 30px;font-size:20px">  
                <tr><th>Id</th><th>Patient Name</th><th>Deposit Amount</th><th>Bill Amount</th>  
                        <c:forEach items="${list}" var="u"> 
                    <tr><td>${u.getId()}</td><td>${u.getPname()}</td><td>${u.getDepositamount()}</td>  
                        <td>${u.getAmount()}</td>
                    </c:forEach>  
            </table>   

        </form>
            <div style="margin-top:40px;">
            <div style="float: left">
                <form action="cashierDashboard.jsp">
                    <button style="font-weight: 700;height:30px;width: 90px;background-color:blue;color: white ">Back</button>
                </form>
            </div>

            <div style="float: right">
                <form action="index.jsp">
                    <button style="font-weight: 700;height:30px;width: 90px;background-color:blue;color: white ">Home Page</button>
                </form>
            </div>
        </div>
    </body>  
</html> 