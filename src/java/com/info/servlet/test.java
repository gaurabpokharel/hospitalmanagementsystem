/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.servlet;

import com.info.dao.appointmentDao;
import com.info.method.appointmentbean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class test extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String sid = request.getParameter("id");
            int id = Integer.parseInt(sid);

            String test = request.getParameter("test");
            //String doctor=request.getParameter("doctor");

            appointmentbean a = new appointmentbean();

            a.setId(id);
            a.setTest(test);
            
            int status = appointmentDao.updatetest(a);
            
            if (status >0) {

                RequestDispatcher rd = request.getRequestDispatcher("doctorAppointment.jsp");
                rd.forward(request, response);
            }
            
            else {
                out.println("Try Again!!");
            }

            out.close();
        }
    }
}
