package com.info.servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.info.dao.*;
import com.info.method.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author debsu
 */
public class pharmacy extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           
            String sid=request.getParameter("id");  
             int id=Integer.parseInt(sid);
            
            
            String medicine=request.getParameter("medicine");
            
             
        appointmentbean es=new appointmentbean(); 
       
        es.setId(id);
        es.setMedicine(medicine);
        
         int status=appointmentDao.updateMedicine(es);  
        if(status>0)
        {  
            out.print("<p>Record saved successfully!</p>");  
             RequestDispatcher rd = request.getRequestDispatcher("doctorDashboard.jsp");
             rd.forward(request, response); 
        }
        
        else{  
            out.println("Sorry! unable to save record");  
        }  
          
        out.close();  
        }
    }
}
