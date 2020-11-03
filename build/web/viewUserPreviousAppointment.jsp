<!DOCTYPE html>  
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>Previous Appointment</title>  
    </head>  
    <body style="background-color: whitesmoke">  
         <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

            if (session.getAttribute("email") == null) 
                response.sendRedirect("userlogin.jsp");
            
        %>
        <%@page import="com.info.dao.*,com.info.method.*"%>  
        <h1 style="text-align: center">Previous Data</h1>
        <hr>
        <%
            String id = request.getParameter("id");
            appointmentbean u = appointmentDao.getRecordById(Integer.parseInt(id));
        %>
        <form action="downloadUserReport" method="post"> 

            <table style="margin-left: 20px" >  
                <tr><td>Appointment id:</td><td>  
                        <input type="number" name="id" value="<%=u.getId()%>"/>  </td></tr> 
                <tr><td>Name:</td><td>  
                        <input type="text" name="pname" value="<%= u.getPname()%>"/></td></tr>  
                <tr><td>Appointment title:</td><td>  
                        <input type="text" name="aptitle" value="<%= u.getAptitle()%>"/></td></tr>    
                <tr><td>Doctor:</td><td>  
                        <input type="text" name="doctor" value="<%= u.getDoctor()%>"/></td></tr>
                <tr><td>Test:</td><td>  
                        <input type="text" name="test" value="<%= u.getTest()%>"/></td></tr>
                
                <tr><td>Medicine:</td><td>  
                        <input type="text" name="report" value="<%= u.getMedicine()%>"/></td></tr><br>
                <tr><td>Total amount spend:</td><td>  
                        <input type="text" name="amount" value="<%= u.getAmount()%>"/></td></tr><br>
                 <tr><td>Report:</td><td>  
                        <input type="submit"  value="Download Report"/></td></tr>
                <tr><td colspan="2"><a href="index.jsp">Go to home page</a></td></tr>  
            </table>  
        </form>  
    </body>  
</html>  