/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.api.report;

import com.br.api.connect.ConnectDB2;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Report", urlPatterns = {"/Report"})
@MultipartConfig
public class Report extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Report</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Report at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
//        if (request.getParameter("REPORT").equalsIgnoreCase("BN-01")) {
            try {
                File reportFile = new File(getServletContext().getRealPath("Report/BN_01.jasper"));
                //  ClassGetReport cgr = new ClassGetReport();
                String CONO = session.getAttribute("cono").toString().trim();
                String DIVI = session.getAttribute("divi").toString().trim();
                String BNNO = request.getParameter("vBNNO").trim();
                Double AMT = Cal_LineAmount(CONO, DIVI, BNNO);

                String THB = WordCurrency(String.format("%.2f", AMT));

                Map parameterss = new HashMap();
                parameterss.put("CONO", CONO);
                parameterss.put("DIVI", DIVI);
                parameterss.put("BNNO", BNNO);
                parameterss.put("THB", THB);
//                parameterss.put("todate", Integer.parseInt(tdate));
//                parameterss.put("locations", locations);

                Connection conn = ConnectDB2.ConnectionDB();
//                conn.setAutoCommit(true);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameterss, conn);
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream ouputStream = response.getOutputStream();

                ouputStream.write(bytes, 0, bytes.length);
                ouputStream.flush();
                ouputStream.close();

            } catch (JRException ex) {
                Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
            }
//        }
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
//        processRequest(request, response);
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
//        if (request.getParameter("REPORT").equalsIgnoreCase("BN-01")) {
            try {
                File reportFile = new File(getServletContext().getRealPath("Report/BN-01.jasper"));
                //  ClassGetReport cgr = new ClassGetReport();
                String CONO = session.getAttribute("cono").toString().trim();
                String DIVI = session.getAttribute("divi").toString().trim();
                String BNNO = request.getParameter("vBNNO").trim();
                Double AMT = Cal_LineAmount(CONO, DIVI, BNNO);

                String THB = WordCurrency(String.format("%.2f", AMT));

                Map parameterss = new HashMap();
                parameterss.put("CONO", CONO);
                parameterss.put("DIVI", DIVI);
                parameterss.put("BNNO", BNNO);
                parameterss.put("THB", THB);
//                parameterss.put("todate", Integer.parseInt(tdate));
//                parameterss.put("locations", locations);

                Connection conn = ConnectDB2.ConnectionDB();
//                conn.setAutoCommit(true);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameterss, conn);
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream ouputStream = response.getOutputStream();

                ouputStream.write(bytes, 0, bytes.length);
                ouputStream.flush();
                ouputStream.close();

            } catch (JRException ex) {
                Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
            }
//        }
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

    public static Double Cal_LineAmount(String CONO, String DIVI, String BNNO) {
        Double Amt = 0.00;
        try {
            Connection conn = ConnectDB2.ConnectionDB();
//            conn.setAutoCommit(true);

            if (conn != null) {
                Statement stmt = conn.createStatement();
                String query = "SELECT SUM(B.LB_INVAMT - B.LB_TAXAMT) AS  Amount\n"
                        + "FROM BRLDTA0100.LN_BILLNOTE B\n"
                        + "WHERE LB_CONO = '" + CONO + "'\n"
                        + "AND LB_DIVI = '" + DIVI.trim() + "'\n"
                        + "AND LB_BNNO = '" + BNNO.trim() + "'";
//                System.out.println(query);
                ResultSet mRes = stmt.executeQuery(query);
                while (mRes.next()) {
                    Amt += mRes.getDouble(1);
                }
                Amt = Double2digitReturn(Amt);
            }
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return Amt;
    }

    public static double Double2digitReturn(double number) {

        try {
            String numberBeforeconvert = String.valueOf(new DecimalFormat("##.##").format(Math.round(number * 100.0) / 100.0));
            double numberreturn = Double.parseDouble(numberBeforeconvert);
            return numberreturn;
        } catch (Exception e) {
            return 0;
        }

    }

    public static String WordCurrency(String Money) {
        DecimalFormat df = new DecimalFormat("#.00");
        String bathTxt, n, bathTH = "";
        Double amount;

        bathTxt = Money.replaceAll("-", "");
        amount = Double.parseDouble(Money.replaceAll("-", ""));

        bathTxt = df.format(amount);
        String[] num = {"ศูนย์", "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า", "สิบ"};
        String[] number = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
        String[] rank = {"", "สิบ", "ร้อย", "พัน", "หมื่น", "แสน", "ล้าน"};
        String[] temp = bathTxt.split("[.]");
        String intVal = temp[0];
        String deciVal = temp[1];
        String strTrillion = "";
        Boolean _IsTrillion = intVal.length() > 7;
        int check = 0;
        if (_IsTrillion) {
            strTrillion = intVal.substring(0, intVal.length() - 6);
            bathTH = WordCurrency2(strTrillion) + "ล้าน";
            intVal = intVal.substring(strTrillion.length());
            check++;
        }

        if (Double.parseDouble(bathTxt) == 0) {
            bathTH = "ศูนย์บาท";
        } else {
            try {
                for (int i = 0; i < intVal.length(); i++) {
                    n = intVal.substring(i, i + 1);
                    if (Integer.parseInt(n) != 0) {
                        if ((i == (intVal.length() - 1)) && (n.indexOf("1") > -1) && intVal.length() > 1) {
                            bathTH += "เอ็ด";
                        } else if ((i == (intVal.length() - 2)) && (n.indexOf("2") > -1)) {
                            bathTH += "ยี่";
                        } else if ((i == (intVal.length() - 2)) && (n.indexOf("1") > -1)) {
                            bathTH += "";
                        } else {
                            bathTH += num[Integer.parseInt(n)];
                        }
                        bathTH += rank[(intVal.length() - i) - 1];
                    } else if (i == 0) {
                        bathTH += num[Integer.parseInt(n)];
                    }

                }

            } catch (Exception e) {
                System.out.println(e);
            }

            if (deciVal.length() > 0 && Integer.parseInt(deciVal) != 0) {
                bathTH += "บาท";
                for (int i = 0; i < deciVal.length(); i++) {
                    System.out.print(deciVal.substring(0 + i, 1 + i));
                    n = deciVal.substring(i, i + 1);
                    if (Integer.parseInt(n) != 0) {
                        if ((i == (deciVal.length() - 1)) && (n.indexOf("1") > -1) && deciVal.length() > 1) {
                            if (!deciVal.substring(0, 0 + 1).equalsIgnoreCase("0")) {
                                bathTH += "เอ็ด";
                            } else {
                                bathTH += num[Integer.parseInt(n)];
                            }
                        } else if ((i == (deciVal.length() - 2)) && (n.indexOf("2") > -1)) {
                            bathTH += "ยี่";
                        } else if ((i == (deciVal.length() - 2)) && (n.indexOf("1") > -1)) {
                            bathTH += "";
                        } else {
                            bathTH += num[Integer.parseInt(n)];
                        }
                        bathTH += rank[(deciVal.length() - i) - 1];
                    }
                }
                bathTH += "สตางค์";
            } else {
                bathTH += "บาท";
            }

        }
        return bathTH;

    }

    public static String WordCurrency2(String Money) {
        DecimalFormat df = new DecimalFormat("#.00");
        String bathTxt, n, bathTH = "";
        Double amount;
        bathTxt = Money.replaceAll("-", "");
        amount = Double.parseDouble(Money.replaceAll("-", ""));

        bathTxt = df.format(amount);
        String[] num = {"ศูนย์", "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า", "สิบ"};
        String[] number = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
        String[] rank = {"", "สิบ", "ร้อย", "พัน", "หมื่น", "แสน", "ล้าน"};
        String[] temp = bathTxt.split("[.]");
        String intVal = temp[0];
        String deciVal = temp[1];
        if (Double.parseDouble(bathTxt) == 0) {
            bathTH = "ศูนย์บาท";
        } else {
            try {
                for (int i = 0; i < intVal.length(); i++) {
                    n = intVal.substring(i, i + 1);
                    if (Integer.parseInt(n) != 0) {
                        if ((i == (intVal.length() - 1)) && (n.indexOf("1") > -1) && intVal.length() > 1) {
                            bathTH += "เอ็ด";
                        } else if ((i == (intVal.length() - 2)) && (n.indexOf("2") > -1)) {
                            bathTH += "ยี่";
                        } else if ((i == (intVal.length() - 2)) && (n.indexOf("1") > -1)) {
                            bathTH += "";
                        } else {
                            bathTH += num[Integer.parseInt(n)];
                        }
                        bathTH += rank[(intVal.length() - i) - 1];
                    } else if (i == 0) {
                        bathTH += num[Integer.parseInt(n)];
                    }

                }
            } catch (Exception e) {
                System.out.println(e);
            }

        }
        return bathTH;

    }

}
