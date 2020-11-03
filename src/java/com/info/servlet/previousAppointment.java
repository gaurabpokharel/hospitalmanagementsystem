/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.servlet;

import com.info.dao.appointmentDao;
import com.info.dao.userDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gaurab Pokharel
 */
public class previousAppointment extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
             String sid=request.getParameter("id");  
             int id=Integer.parseInt(sid);
            String email = request.getParameter("email");
            

            if (appointmentDao.validatesforperviousrecord(id,email)) 
            {
                  RequestDispatcher rd = request.getRequestDispatcher("viewUserPreviousAppointment.jsp");
                rd.forward(request, response);
            } 
            else
            {
                out.print("Sorry id or username incorrect");
                RequestDispatcher rd = request.getRequestDispatcher("userPreviousAppointment.jsp");
                rd.include(request, response);
            }

            out.close();
        
    }

    }
}
