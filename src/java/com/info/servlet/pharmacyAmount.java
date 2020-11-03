/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.servlet;

import com.info.dao.appointmentDao;
import com.info.method.cashierBean;
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
public class pharmacyAmount extends HttpServlet {

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

            String oldamount = request.getParameter("amount");
            int oamount = Integer.parseInt(oldamount);

            cashierBean a = new cashierBean();

            a.setId(id);
            a.setOamount(oamount);
            
            int status = appointmentDao.updateamount(a);
            if (status > 0) {

                RequestDispatcher rd = request.getRequestDispatcher("pharmacy.jsp");
                rd.forward(request, response);
            } else {
                out.println("Unable to save record");
            }

            out.close();

        }
    }
}
          
