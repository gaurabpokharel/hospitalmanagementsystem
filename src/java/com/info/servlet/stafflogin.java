 package com.info.servlet;

import com.info.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class stafflogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("username");
            String p = request.getParameter("password");
            String r = request.getParameter("role");
             HttpSession session=request.getSession();  

            if (staffDao.validate(n, p, r) && r.equals("admin")) {
               
                session.setAttribute("username", n);  
                RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
                rd.forward(request, response);
               

            } else if (staffDao.validate(n, p, r) && r.equals("lab")) {
               
                session.setAttribute("username", n);
                RequestDispatcher rd = request.getRequestDispatcher("lab.jsp");
                rd.forward(request, response);

               

            } else if (staffDao.validate(n, p, r) && r.equals("cashier")) {
               
                session.setAttribute("username", n);
                RequestDispatcher rd = request.getRequestDispatcher("cashierDashboard.jsp");
                rd.forward(request, response);  
               

            } else if (staffDao.validate(n, p, r) && r.equals("receptionist")) {
               
                session.setAttribute("username", n);
                RequestDispatcher rd = request.getRequestDispatcher("receptionistDashboard.jsp");
                rd.forward(request, response);
                 
               
            } else if (staffDao.validate(n, p, r) && r.equals("pharmacy")) {
               
                session.setAttribute("username", n); 
                RequestDispatcher rd = request.getRequestDispatcher("pharmacy.jsp");
                rd.forward(request, response);
                 
               

            } else {
                out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Invalid Credentials.');");
            out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("stafflogin.jsp");
                rd.include(request, response);
            }

            out.close();
        }
    }
}
