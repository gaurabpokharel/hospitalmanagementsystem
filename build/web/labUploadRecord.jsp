<%-- 
    Document   : labUploadRecord
    Created on : 04-May-2020, 21:53:20
    Author     : Gaurab Pokharel
--%>

<%@page import="com.info.dao.appointmentDao"%>
<%@page import="com.info.method.appointmentbean"%>
<%@page import="com.info.dao.labDao"%>
<%@page import="com.info.method.labBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab Record</title>
    </head>
    <body>

        <%
            String id = request.getParameter("id");
            appointmentbean a=appointmentDao.getRecordById(Integer.parseInt(id));
            labBean u = labDao.getRecordById(Integer.parseInt(id));
        %>
        <form action="labUpdate" method="post"  enctype = "multipart/form-data"> 
            <table>  
                <tr><td>Patient id:</td><td>  
                        <input type="number" name="id" value="<%=a.getId()%>"/>  </td></tr> 
                <tr><td>Patient Name:</td><td>  
                        <input type="text" name="pname" value="<%= a.getPname()%>"/></td></tr>  
                <tr><td>Appointment title:</td><td>  
                        <input type="text" name="aptitle" value="<%= a.getAptitle()%>"/></td></tr>  
                <tr><td>Doctor Name:</td><td>  
                        <input type="text" name="doctor" value="<%= a.getDoctor()%>"/></td></tr>
                <tr><td>Test:</td><td>  
                        <input type="test" name="test" value="<%= a.getTest()%>"/></td></tr>

                <tr><td>Insert Report:</td><td>  
                        <input type="file" name="report"/></td></tr>

                <tr><td colspan="2"><input type="submit" value="Save"/></td></tr>  
            </table>  
        </form>  

    </body>
</html>
