/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.br.api.data;

import com.br.api.connect.ConnectDB2;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author Administrator
 */
public class DeleteDB2 {

    public static void DeleteLineInvoiceJSON(String CONO, String DIVI, String BNNO, String JSONARRAY) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        Double TAX = 0.00;
        try (
                 PreparedStatement stmt = conn.prepareStatement(
                        "DELETE FROM BRLDTA0100.LN_BILLNOTE\n"
                        + "WHERE LB_CONO = ? AND LB_DIVI = ? AND LB_BNNO = ? AND LB_INVNO = ? AND  LB_INVYEAR = ? AND LB_INVDT = ?")) {

            JSONArray arr = new JSONArray(JSONARRAY);
            for (int i = 0; i < arr.length(); i++) {
                JSONObject obj = arr.getJSONObject(i);
                try {
                  

                    stmt.setInt(1, Integer.parseInt(CONO));
                    stmt.setString(2, DIVI);
                    stmt.setString(3, BNNO);
                    stmt.setString(4, obj.getString("LB_INVNO"));
                    stmt.setString(5, obj.getString("LB_INVYEAR"));
                    stmt.setString(6, obj.getString("INVDATE").replaceAll("-", ""));


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

    public static void DeleteLineInvoice(String LB_CONO, String LB_DIVI, String LB_BNNO, String LB_INVNO, String LB_INVDT, String LB_INVYEAR) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {
            if (conn != null) {
                Double TAX = 0.00;

                Statement stmt = conn.createStatement();
                String query = "DELETE FROM BRLDTA0100.LN_BILLNOTE\n"
                        + "WHERE LB_CONO = '" + LB_CONO + "' AND LB_DIVI = '" + LB_DIVI.trim() + "' AND LB_BNNO = '" + LB_BNNO.trim() + "' AND LB_INVNO = '" + LB_INVNO.trim() + "' AND  LB_INVYEAR = '" + LB_INVYEAR.trim() + "'";
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
