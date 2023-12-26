/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.api.data;

import com.br.api.connect.ConnectDB2;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author Jilasak
 */
public class InsertDB2 {

    public static String CreateBillingNote(String CONO, String DIVI, String CUNO, String TRDT, String PONO, String USER) throws Exception {
        UpdateDB2 UPDATE = new UpdateDB2();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        String BNNO = "";
            String userc = CUNO;
        if (userc != "" && (userc.indexOf("TH") != 0 && userc.indexOf("th") != 0 && userc.indexOf("Th") != 0 && userc.indexOf("tH") != 0)) {

            userc = "TH" + userc;
        }
        System.out.println(userc);
        try {
            if (conn != null) {

                LocalDate date = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy");
                String YEAR = date.format(formatter);

                String RNNO = Get_RNNO(CONO, DIVI, YEAR);

//                BNNO = "BP" + YEAR + "-" + RNNO;
                if (USER.equalsIgnoreCase("PHONGS_PHO")) {
                    BNNO = "PP" + "2023" + "-" + "0001";

                } else {
                    BNNO = "BP" + YEAR + "-" + RNNO;
                    UPDATE.UpdateRunning(CONO, DIVI, YEAR, RNNO);

                }

                Statement stmt = conn.createStatement();
                String query = "INSERT INTO BRLDTA0100.H_BILLNOTE\n"
                        + "(HB_CONO, HB_DIVI, HB_BNNO, HB_TRDT, HB_CUNO, HB_PO, HB_USER, HB_STS)\n"
                        + "VALUES('" + CONO.trim() + "', '" + DIVI.trim() + "', '" + BNNO.trim() + "', '" + TRDT.replaceAll("-", "").trim() + "', '" + userc.trim() + "', '" + PONO.trim() + "', '" + USER.trim() + "', '10')";
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
        return BNNO;
    }

    public static void InsertLine(String CONO, String DIVI, String BNNO, String INVNO, String INVDT, String INVYEAR, String INVAMT, String WTTAX) throws Exception {
        UpdateDB2 UPDATE = new UpdateDB2();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {
            if (conn != null) {
                Double TAX = 0.00;

                if (WTTAX.equalsIgnoreCase("TRUE")) {
                    TAX = Double.parseDouble(INVAMT) * 0.03;
                }

                Statement stmt = conn.createStatement();
                String query = "INSERT INTO BRLDTA0100.LN_BILLNOTE\n"
                        + "(LB_CONO, LB_DIVI, LB_BNNO, LB_INVNO, LB_INVDT, \n"
                        + "LB_INVYEAR, LB_INVAMT, LB_WHTAX, LB_TAXAMT, LB_STS)\n"
                        + "VALUES('" + CONO.trim() + "', '" + DIVI.trim() + "', '" + BNNO.trim() + "', '" + INVNO.trim() + "', '" + INVDT.replaceAll("-", "").trim() + "',\n"
                        + "'" + INVYEAR.trim() + "', '" + INVAMT.trim() + "', '" + WTTAX.trim() + "', '" + TAX + "', '20')";
                System.out.println(query);
                stmt.execute(query);
//                UPDATE.UpdateStatus(CONO, CUNO, Start, Stop, BNNO);

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

    public static void InsertLineJSON(String CONO, String DIVI, String BNNO, String JSONARRAY) throws Exception {

        UpdateDB2 UPDATE = new UpdateDB2();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);

        Double TAX = 0.00;

        try (
                 PreparedStatement stmt = conn.prepareStatement(
                        "INSERT INTO BRLDTA0100.LN_BILLNOTE\n"
                        + "(LB_CONO, LB_DIVI, LB_BNNO, LB_INVNO, LB_INVDT, \n"
                        + "LB_INVYEAR, LB_INVAMT, LB_WHTAX, LB_TAXAMT, LB_STS)\n"
                        + "VALUES(?,?,?,?,?,?,?,?,?,?)")) {
            
            JSONArray arr = new JSONArray(JSONARRAY);
            for (int i = 0; i < arr.length(); i++) {
                JSONObject obj = arr.getJSONObject(i);
                try {



                    stmt.setInt(1, Integer.parseInt(CONO));
                    stmt.setString(2, DIVI);
                    stmt.setString(3, BNNO);
                    stmt.setString(4, obj.getString("ESCINO"));
                    stmt.setString(5, obj.getString("ESIVDT").replaceAll("-", ""));
                    stmt.setString(6, obj.getString("ESINYR"));
                    stmt.setString(7, obj.getString("ESCUAM"));
                    stmt.setString(8, obj.getString("WHTAX"));
                    stmt.setDouble(9, TAX);
                    stmt.setString(10, "20");
                    stmt.executeUpdate();
                } catch (Exception e) {
                    System.out.println(e.toString());
                    continue;
//                            break;
                }
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

    public static String Get_RNNO(String CONO, String DIVI, String YEAR) {
        String RNNO = "0";

        try {
            Connection conn = ConnectDB2.ConnectionDB();
            conn.setAutoCommit(true);
            Statement stmt = conn.createStatement();
            String sql = "SELECT TO_CHAR(max(RN_RNNO)+1,'0000') AS RN_RNNO\n"
                    + "FROM BRLDTA0100.running_BILLNOTE\n"
                    + "WHERE RN_CONO = '" + CONO.trim() + "'\n"
                    + "AND RN_DIVI = '" + DIVI.trim() + "'\n"
                    + "AND RN_YEAR = '" + YEAR.trim() + "'";

            ResultSet mRes = stmt.executeQuery(sql);
            if (mRes.next()) {
                RNNO = mRes.getString("RN_RNNO").trim();
            }

            return RNNO;
        } catch (Exception ex) {
            Logger.getLogger(InsertDB2.class.getName()).log(Level.SEVERE, null, ex);
        }

        return RNNO;
    }
}
