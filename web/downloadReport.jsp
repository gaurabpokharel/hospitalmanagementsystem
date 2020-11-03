<%-- 
    Document   : recommendationMedicine
    Created on : 06-May-2020, 12:42:49
    Author     : Gaurab Pokharel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient lab report</title>
    </head>
    <body style="background-color: #2FA5EB"> 
         <form action="download" method="post"> 
             
        <%@page import="com.info.dao.*,com.info.method.*"%>  

        <%
            String id = request.getParameter("id");
            appointmentbean u = appointmentDao.getRecordById(Integer.parseInt(id));
        %>
       

           <table style="margin-left: 500px;margin-top: 150px;border-spacing:0 15px; font-size: 20px  ">  
                
                <tr><td>Doctor Name:</td><td>  
                        <input type="text" name="doctor" value="<%=u.getDoctor()%>"/>  </td></tr> 
                <tr><td>Patient id:</td><td>  
                        <input type="number" name="id" value="<%=u.getId()%>"/>  </td></tr> 
                <tr><td>Name:</td><td>  
                        <input type="text" name="pname" value="<%= u.getPname()%>"/></td></tr>  
                <tr><td>Title:</td><td>  
                        <input type="text" name="aptitle" value="<%= u.getAptitle()%>"/></td></tr>
                        <tr><td>Report:</td><td><input type="submit" value="Download"/></td></tr>  
            </table>  
        </form>  

    </body>
</html>
