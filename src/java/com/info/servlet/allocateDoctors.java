package com.info.servlet;

//import com.info.config.*;
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
public class allocateDoctors extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //String email=request.getParameter("email");
            String time=request.getParameter("time");
            String department=request.getParameter("department");
            String doctor = request.getParameter("doctor");
            String doctorid=request.getParameter("doctorid");
            int did = Integer.parseInt(doctorid);
            String fdate = request.getParameter("fdate");
            String sid = request.getParameter("id");
            int id = Integer.parseInt(sid);
            String number=request.getParameter("pnumber");

            appointmentbean a = new appointmentbean();
            
            a.setDepartment(department);
            a.setDoctor(doctor);
            a.setDoctorid(did);
            a.setFdate(fdate);
            a.setId(id);
            a.setTime(time);

            int status = appointmentDao.update(a);
            if (status > 0)
            {
                 out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Appointment is send to Doctor.');");
            out.println("</script>"); 
                aa obj = new aa(number);
                 request.getRequestDispatcher("receptionistDashboard.jsp").include(request,response);
            } 
            else
            {
                out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Appointment isnot send to Doctor.');");
            out.println("</script>");
            }

            out.close();
        }
    }
}
