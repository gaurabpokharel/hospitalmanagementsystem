package com.info.servlet;

import com.info.dao.doctorDao;
import com.info.method.doctorBean;
import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;    
public class editDoctorProfile extends HttpServlet {  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   
          throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
          
        String sid=request.getParameter("id");  
        int id=Integer.parseInt(sid);  
        String fullname=request.getParameter("fullname");  
        String demail=request.getParameter("demail");  
        String pnumber=request.getParameter("dphonenumber"); 
        String department=request.getParameter("department"); 
          
        doctorBean e=new doctorBean(); 
        
        e.setId(id);  
        e.setFullname(fullname);    
        e.setEmail(demail);  
        e.setPhonenumber(pnumber);
        e.setDepartment(department);
          
        int status=doctorDao.update(e);  
        if(status>0){  
             out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Your profile is edited.');");
            out.println("</script>"); 
            response.sendRedirect("doctorDashboard.jsp");  
        }else{  
            out.println("Sorry! unable to update record");  
        }  
          
        out.close();  
    }  
  
}  