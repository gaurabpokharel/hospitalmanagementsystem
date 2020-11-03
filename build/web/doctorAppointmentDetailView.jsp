<!DOCTYPE html>  
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>Detailed View</title>  
    </head>  
    <body style="background-color: #2FA5EB">  

        <form action="test" method="post"> 

            <%@page import="com.info.dao.*,com.info.method.*"%>  

            <%
                String id = request.getParameter("id");
                appointmentbean u = appointmentDao.getRecordById(Integer.parseInt(id));
            %>
           
            <table style="margin-left: 500px;margin-top: 150px;border-spacing:0 15px; font-size: 20px  ">  
                <tr><td>Patient id:</td><td><input type="number" name="id" value="<%=u.getId()%>"/>  </td></tr> 

                <tr><td>Name:</td><td><input type="text" name="pname" value="<%= u.getPname()%>"/></td></tr> 

                <tr><td>Title:</td><td><input type="text" name="aptitle" value="<%= u.getAptitle()%>"/></td></tr>   

                <tr><td>Symptoms:</td><td><input type="text" name="symptoms" value="<%= u.getSymptoms()%>"/></td></tr>

                <tr><td>Suspected disease:</td><td><input type="text" name="disease" value="<%= u.getDisease()%>"/></td></tr>
                
                <tr><td>Report:</td><td><button formaction="downloadDocument">Download Report</button></td></tr>

                <tr><td>Doctor:</td><td><input type="text" name="doctor" value="<%= u.getDoctor()%>"/></td></tr>

                <tr><td>Test to be done:</td><td><input type="text" name="test"/></td></tr>

                <tr><td colspan="2"><input type="submit" value="Done"/></td></tr>

            </table> 
         
        </form>  
    </body>  
</html>  