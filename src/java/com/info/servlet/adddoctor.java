package com.info.servlet;

import java.util.*;
import com.info.method.*;
import com.info.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gaurab Pokharel
 */
public class adddoctor extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Base64.Encoder encoder = Base64.getEncoder();

            String f = request.getParameter("fullname");
            String u = request.getParameter("dusername");
            String p = request.getParameter("dpassword");

            String str = encoder.encodeToString(p.getBytes());
            String e = request.getParameter("demail");
            String pho = request.getParameter("dphonenumber");
            String department=request.getParameter("department");
            doctorBean es = new doctorBean();

            es.setFullname(f);
            es.setUsername(u);
            es.setPassword(str);
            es.setEmail(e);
            es.setPhonenumber(pho);
            es.setDepartment(department);

            int status = doctorDao.save(es);
            if (status > 0) {
                RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
                rd.forward(request, response);
            } else {
                out.println("Sorry cannot save the record");
                RequestDispatcher rd = request.getRequestDispatcher("adminadddoctor.jsp");
                rd.include(request, response);

            }

            out.close();

        }
    }

}
