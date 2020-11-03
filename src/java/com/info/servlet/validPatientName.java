/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.servlet;

import com.info.dao.appointmentDao;
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
public class validPatientName extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String sid = request.getParameter("id");
            int id = Integer.parseInt(sid);
            String dn = request.getParameter("dname");

            if (appointmentDao.validate(id, dn))
            {
                RequestDispatcher rd = request.getRequestDispatcher("cashierAmount.jsp");
                rd.forward(request, response);

            }
            else 
            {
               out.println("Wrong id or username");
                RequestDispatcher rd = request.getRequestDispatcher("cashierPatientLogin.jsp");
                rd.forward(request, response);
               
            }

        }
    }
}
