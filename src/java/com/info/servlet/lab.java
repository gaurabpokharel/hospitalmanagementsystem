package com.info.servlet;

import com.info.config.*;
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
 * @author Dev
 */
public class lab extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String sid = request.getParameter("id");
            int id = Integer.parseInt(sid);
            String pname = request.getParameter("pname");
            String aptitle = request.getParameter("aptitle");
            String doctor = request.getParameter("doctor");
            String test = request.getParameter("test");

            labBean a = new labBean();

            a.setId(id);
            a.setPname(pname);
            a.setAptitle(aptitle);
            a.setDoctor(doctor);
            a.setTest(test);

            int status = labDao.save(a);
            if (status > 0&&doctor.equals("Dr.Ram")) {
                
                RequestDispatcher rd = request.getRequestDispatcher("appointmentRamDoctorList.jsp");
             rd.forward(request, response);
            } 
            else if (status > 0&&doctor.equals("Dr.Shyam")) {
                
                RequestDispatcher rd = request.getRequestDispatcher("appointmentShyamDoctorList.jsp");
             rd.forward(request, response);
            } 
            else {
                out.println("Sorry! unable to update record");
            }

            out.close();
        }
    }
}
