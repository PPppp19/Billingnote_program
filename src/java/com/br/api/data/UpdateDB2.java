/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.br.api.data;

import com.br.api.connect.ConnectDB2;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class UpdateDB2 {

    static void UpdateBillingNote(String cono, String divi, String bnno, String cuno, String trdt, String pono, String user) throws Exception {
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {

            Statement stmt = conn.createStatement();
            String sql = "UPDATE BRLDTA0100.H_BILLNOTE\n"
                    + "SET HB_TRDT = '" + trdt.replaceAll("-", "").trim() + "', HB_CUNO = '" + cuno.trim() + "', HB_PO = '" + pono.trim() + "' \n"
                    + "WHERE HB_CONO = '" + cono.trim() + "' AND HB_DIVI = '" + divi.trim() + "' AND HB_BNNO = '" + bnno.trim() + "' ";
            stmt.execute(sql);
        } catch (Exception ex) {
            Logger.getLogger(UpdateDB2.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

    }

    static void UpdateStatus(String CONO, String DIVI, String BNNO, String USER, String STS) throws Exception {
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {

            Statement stmt = conn.createStatement();

            String sql = " UPDATE BRLDTA0100.H_BILLNOTE\n"
                    + "                    SET HB_STS = '"+STS+"'\n"
                    + "                    WHERE HB_CONO = '"+CONO+"' AND HB_DIVI = '"+DIVI+"' AND HB_BNNO = '"+BNNO+"' ";

            stmt.execute(sql);

        } catch (Exception ex) {
            Logger.getLogger(UpdateDB2.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

    }

    public void UpdateRunning(String CONO, String DIVI, String YEAR, String RNNO) throws Exception {
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {

            Statement stmt = conn.createStatement();
            String chk = RNNO;

            String sql = "UPDATE BRLDTA0100.RUNNING_BILLNOTE\n"
                    + "SET RN_RNNO = INT('" + RNNO.trim() + "') \n"
                    + "WHERE RN_CONO = '" + CONO.trim() + "' AND RN_DIVI = '" + DIVI.trim() + "' AND RN_YEAR = '" + YEAR.trim() + "'  AND RN_RNNO = INT('" + RNNO.trim() + "')-1";

            stmt.execute(sql);

        } catch (Exception ex) {
            Logger.getLogger(UpdateDB2.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    public static void UpdateLineInvoice(String LB_CONO, String LB_DIVI, String LB_BNNO, String LB_INVNO, String LB_INVDT, String LB_INVYEAR, String LB_INVAMT, String LB_TAXAMT, String LB_WHTAX, String LB_STS) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {
            if (conn != null) {
                Double TAX = 0.00;

                if (LB_WHTAX.equalsIgnoreCase("TRUE")) {
                    TAX = Double.parseDouble(LB_INVAMT) * 0.03;
                } else {
                    TAX = Double.parseDouble(LB_INVAMT) * 0.0;
                }

                if (LB_STS.equalsIgnoreCase("false")) {
                    LB_STS = "10";
                } else {
                    LB_STS = "20";
                }

                Statement stmt = conn.createStatement();
                String query = "UPDATE BRLDTA0100.LN_BILLNOTE\n"
                        + "SET LB_WHTAX = '" + LB_WHTAX.trim() + "', LB_TAXAMT = '" + TAX + "', LB_STS = '" + LB_STS.trim() + "'\n"
                        + "WHERE LB_CONO = '" + LB_CONO.trim() + "' AND LB_DIVI = '" + LB_DIVI.trim() + "' AND LB_BNNO = '" + LB_BNNO.trim() + "' AND LB_INVNO = '" + LB_INVNO.trim() + "' and LB_INVYEAR ='" + LB_INVYEAR.trim() + "'";
//                System.out.println(query);
                stmt.execute(query);
            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
            if (conn != null) {
                conn.close();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

    }

}
