<!DOCTYPE html>  

<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>Appointment Request List</title>  
    </head>  
    <body style="background-color:wheat">  
        <form>
            <%@page import="com.info.dao.*,com.info.method.*,java.util.*"%>  
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

            <h1 style="text-align: center"> Appointment List</h1><hr style="width:75%; height:4px;background-color: black"> 

            

            <%
                String id = request.getParameter("id");
                List<appointmentbean> list = appointmentDao.getAllDoctorRecords();
                request.setAttribute("list", list);
            %> 
             Application id :<input type="text" name="id" placeholder="Search from id"/>
            <button formaction="appointmentDetailDoctorView.jsp">Show data</button><br><br>

             <table border="1" width="90%" style="text-align: center;margin-left: 5%">  
                <tr><th>Id</th><th>Patient Name</th><th>Appointment title</th><th>Preferred date</th>  
                    <th>Symptoms</th><th>Disease</th><th>Send to Lab</th><th>Send to Pharmacy</th></tr>  
                        <c:forEach items="${list}" var="u"> 
                    <tr><td>${u.getId()}</td><td>${u.getPname()}</td><td>${u.getAptitle()}</td>  
                        <td>${u.getApdate()}</td><td>${u.getSymptoms()}</td><td>${u.getDisease()}</td>
                        <td><a href="appointmentDetailDoctorView.jsp?id=${u.getId()}">View</a></td>
                        <td><a href="recommendationMedicine.jsp?id=${u.getId()}">View</a></td>
                    </tr>

                </c:forEach>  
            </table> 

        </form>
            <div style="margin-top:40px;">
            <div style="float: left">
                <form action="doctorRamDashboard.jsp">
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