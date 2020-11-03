
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>Appointment Request List</title>  
    </head>  
    <body style="background-color:wheat">  
          <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            
            if(session.getAttribute("demail")==null)
                response.sendRedirect("doctorLogin.jsp");
            %> 
        <form>
            <%@page import="com.info.dao.*,com.info.method.*,java.util.*"%>  
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

            <h1 style="text-align: center">Doctor Appointment List</h1><hr style="width:75%; height:4px;background-color: black"> 

            

            <%          
        String id=(String)session.getAttribute("id");
       int inum = Integer.parseInt(id);
            List<appointmentbean> list = appointmentDao.getRecordByDoctorID(inum);
                request.setAttribute("list", list);
        %>
             

             <table border="1" width="90%" style="text-align: center;margin-left: 5%">  
                <tr><th>Id</th><th>Patient Name</th><th>Preferred date</th>  
                    <th>Symptoms</th><th>Disease</th><th>Send to Lab</th><th>Send to Pharmacy</th></tr>  
                        <c:forEach items="${list}" var="u"> 
                    <tr><td>${u.getId()}</td><td>${u.getPname()}</td>  
                        <td>${u.getApdate()}</td><td>${u.getSymptoms()}</td><td>${u.getDisease()}</td>
                        <td><a href="doctorAppointmentDetailView.jsp?id=${u.getId()}">View</a></td>
                        <td><a href="doctorRecommendationMedicine.jsp?id=${u.getId()}">View</a></td>
                    </tr>

                </c:forEach>  
            </table> 

        </form>
            <div style="margin-top:40px;">
            <div style="float: left">
                <form action="doctorDashboard.jsp">
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