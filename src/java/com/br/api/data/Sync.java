/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.api.data;

import com.br.api.connect.ConnectDB2;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.codehaus.jettison.json.JSONException;

/**
 *
 * @author Wattana
 */
public class Sync extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Sync</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sync at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("page").equals("Company")) {
                try {
                    out.print(Utility.getCompany());
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (request.getParameter("page").equals("GridBP")) {
                try {
                    out.print(SelectDB2.GridBP(request.getParameter("user")));
                    out.flush();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }

            } else if (request.getParameter("page").equals("UpdateStatus")) {
                try {
                    UpdateDB2.UpdateStatus(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("BNNO"), request.getParameter("USER"),request.getParameter("STS"));

                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if (request.getParameter("page").equals("GetPaymentDate")) {
                try {
                    out.print(SelectDB2.GetPaymentDate(request.getParameter("CONO"), request.getParameter("CUNO")));
                    out.flush();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }

            } else if (request.getParameter("page").equals("GetPaymentDate2")) {
                try {
                    out.print(SelectDB2.GetPaymentDate2(request.getParameter("CONO"), request.getParameter("CUNO"),request.getParameter("PYDATE")));
                    out.flush();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }

            }
            else if (request.getParameter("page").equals("SetnamePayer")) {
                try {
                    out.print(SelectDB2.SetnamePayer(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("code")));
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (request.getParameter("page").equals("Grid_ARS200")) {
                try {
                    out.print(SelectDB2.Grid_ARS200(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("payer"), request.getParameter("type"), request.getParameter("ENDDATE")));
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (request.getParameter("page").equals("Grid_BillingNote")) {
                try {
                    out.print(SelectDB2.Grid_BillingNote(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("BNNO")));
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (request.getParameter("page").equals("Search_BillingNote")) {
                try {
                    out.print(SelectDB2.Search_BillingNote(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("BNNO"), request.getParameter("USER")));
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
             else if (request.getParameter("page").equals("Search_BillingNote2")) {
                try {
                    out.print(SelectDB2.Search_BillingNote2(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("BNNO"), request.getParameter("USER")));
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }
            }else if (request.getParameter("page").equals("Monitoring")) {
                try {
                    out.print(SelectDB2.Monitoring(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("USER")));
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (request.getParameter("page").equals("CheckInvoice")) {
                try {
                    out.print(SelectDB2.CheckInvoice(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("Invoice")));
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        } catch (Exception ex) {
            Logger.getLogger(Sync.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        if (session.getAttribute("cono") == null) {
            response.sendRedirect("login.jsp");
        }

        if (request.getParameter("page").equals("CreateBillingNote")) {
            try {
                String BBNO = InsertDB2.CreateBillingNote(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("CUNO"), request.getParameter("TRDT"),
                        request.getParameter("PONO"), request.getParameter("USER"));
                try {
                    out.print(SelectDB2.ShowBillingNO(BBNO));
                    out.flush();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }
            } catch (Exception e) {
                System.out.println(e.toString());
            }

        } else if (request.getParameter("page").equals("checkGrid_ARS200")) {
            try {
                out.print(SelectDB2.checkGrid_ARS200(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("payer"), request.getParameter("type"), request.getParameter("ENDDATE")));
                out.flush();
            } catch (Exception e) {
                System.out.println(e.toString());
            }

        } else if (request.getParameter("page").equals("InsertLine")) {
            try {
                InsertDB2.InsertLine(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("BBNO"), request.getParameter("ESCINO"),
                        request.getParameter("ESIVDT"), request.getParameter("ESINYR"), request.getParameter("ESCUAM"), request.getParameter("WHTAX"));
            } catch (Exception e) {
                System.out.println(e.toString());
            }

        } else if (request.getParameter("page").equals("InsertLineJSON")) {
            try {
                InsertDB2.InsertLineJSON(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("BNNO"), request.getParameter("JSONARRAY"));
            } catch (Exception e) {
                System.out.println(e.toString());
            }

        } else if (request.getParameter("page").equals("UpdateLineInvoice")) {
            try {
                UpdateDB2.UpdateLineInvoice(request.getParameter("LB_CONO"), request.getParameter("LB_DIVI"), request.getParameter("LB_BNNO"), request.getParameter("LB_INVNO"),
                        request.getParameter("LB_INVDT"), request.getParameter("LB_INVYEAR"), request.getParameter("LB_INVAMT"), request.getParameter("LB_TAXAMT"), request.getParameter("LB_WHTAX"), request.getParameter("LB_STS"));
            } catch (Exception e) {
                System.out.println(e.toString());
            }

        } else if (request.getParameter("page").equals("UpdateBillingNote")) {
            try {
                UpdateDB2.UpdateBillingNote(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("BNNO"), request.getParameter("CUNO"),
                        request.getParameter("TRDT"), request.getParameter("PONO"), request.getParameter("USER"));
            } catch (Exception e) {
                System.out.println(e.toString());
            }

        } else if (request.getParameter("page").equals("DeleteLineInvoice")) {
            try {
                DeleteDB2.DeleteLineInvoice(request.getParameter("LB_CONO"), request.getParameter("LB_DIVI"), request.getParameter("LB_BNNO"), request.getParameter("LB_INVNO"),
                        request.getParameter("LB_INVDT"), request.getParameter("LB_INVYEAR"));
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        } else if (request.getParameter("page").equals("DeleteLineInvoiceJSON")) {
            try {
                DeleteDB2.DeleteLineInvoiceJSON(request.getParameter("CONO"), request.getParameter("DIVI"), request.getParameter("BNNO"), request.getParameter("JSONARRAY"));
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
