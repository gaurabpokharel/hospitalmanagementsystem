package com.info.servlet;

import com.info.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class doctorLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NumberFormatException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           // HttpSession session = request.getSession();
              Base64.Encoder encoder = Base64.getEncoder();
              String id=request.getParameter("id");
              int intid = Integer.parseInt(id);
            String email = request.getParameter("demail");
            String password = request.getParameter("dpassword");
            String str = encoder.encodeToString(password.getBytes()); 

            if (doctorDao.validate(intid,email,str)) {
                
                RequestDispatcher rd = request.getRequestDispatcher("doctorDashboard.jsp");
                rd.forward(request, response);
             HttpSession session=request.getSession();  
            session.setAttribute("id",id);
             session.setAttribute("demail", email);

            }
            else {
                out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Invalid Credentials.');");
            out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("doctorLogin.jsp");
                rd.include(request, response);
            }

            out.close();
        }
    }
}
