<%@page import="com.info.dao.userDao"%>  
<jsp:useBean id="u" class="com.info.method.userbean"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
userDao.delete(u);  
response.sendRedirect("adminDashboard.jsp");  
%> 