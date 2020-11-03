<%@page import="com.info.dao.appointmentDao"%>
<%@page import="com.info.dao.userDao"%>  

<jsp:useBean id="u" class="com.info.method.appointmentbean"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
appointmentDao.delete(u);  
response.sendRedirect("adminviewappointment.jsp");  
%>  