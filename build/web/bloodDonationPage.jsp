<!DOCTYPE html>  

<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>Blood Donation Page</title>  
    </head>  
    <body style="background-color: whitesmoke">  
        <form>
            <%@page import="com.info.dao.*,com.info.method.*,java.util.*"%>  
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
            
            
            <h1 style="text-align: center">Blood donor list</h1> 
           
            <hr>
             
        
            <%
                List<blooddonationBean> list = blooddonationDao.getAllRecords();
                request.setAttribute("list", list);
            %> 
            
            <table border="1" width="90%" style="text-align: center;margin-left: 30px;font-size:20px">  
                <tr><th>Id</th><th>Donor Name</th><th>Address</th>  
                    <th>Phone Number</th><th>E-mail</th><th>Phone Number</th><th>Date of Birth</th><th>Blood Group</th> 
                        <c:forEach items="${list}" var="u"> 
                    <tr><td>${u.getId()}</td><td>${u.getFname()} ${"  "} ${u.getLname()}</td>  
                        <td>${u.getAddress()}</td><td>${u.getPnumber()}</td><td>${u.getEmail()}</td><td>${u.getPnumber()}</td> 
                        <td>${u.getDob()}</td><td>${u.getBgroup()}</td>
                    </c:forEach>  
            </table>   

        </form>
            <div style="float: right;padding-top: 10px">
                <form action="index.jsp">
                    <button style="font-weight: 700;height:30px;width: 90px;background-color:blue;color: white ">Home Page</button>
                </form>
            </div>
    </body>  
</html> 