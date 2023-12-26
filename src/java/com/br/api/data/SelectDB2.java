/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.api.data;

import com.br.api.connect.ConnectDB2;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.codehaus.jettison.json.JSONArray;

/**
 *
 * @author Wattana
 */
public class SelectDB2 {

    public static JSONArray GridBP(String user) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();

                String query = " \n"
                        + " \n"
                        + " SELECT DISTINCT  h.HB_BNNO , COALESCE(d.LB_BNNO,'-') AS LB_BNNO , H.HB_CUNO ,\n"
                        + " CASE WHEN d.LB_BNNO IS NULL THEN 'NO INVOICE'\n"
                        + " ELSE 'INVOICE'\n"
                        + " END AS STATUS , HB_TRDT, HB_PO , m.BPM_RINV, h.HB_STS \n"
                        + " FROM (\n"
                        + " SELECT *  FROM BRLDTA0100.H_BILLNOTE \n"
                        + " ) AS h\n"
                        + " LEFT JOIN \n"
                        + " (\n"
                        + " SELECT * FROM  BRLDTA0100.LN_BILLNOTE\n"
                        + " ) AS d\n"
                        + " ON   d.LB_BNNO = h.HB_BNNO\n"
                        + "\n"
                        + " LEFT  JOIN  \n"
                        + " (\n"
                        + " SELECT * FROM BRLDTA0100.BP_MASTER \n"
                        + " ) AS m\n"
                        + " ON  h.hb_CUNO = m.BPM_CUNO\n"
                        + "  WHERE h.HB_USER = '" + user + "'\n"
                        + " AND h.HB_STS != '20' AND  h.HB_STS != '90' ";

//                                String query = " SELECT DISTINCT  h.HB_BNNO , COALESCE(d.LB_BNNO,'-') AS LB_BNNO , H.HB_CUNO ,\n"
//                                        + " CASE WHEN d.LB_BNNO IS NULL THEN 'NOT COMPLETE'\n"
//                                        + " ELSE 'COMPLETE'\n"
//                                        + " END AS STATUS , HB_TRDT, HB_PO\n"
//                                        + " FROM (\n"
//                                        + " SELECT *  FROM BRLDTA0100.H_BILLNOTE \n"
//                                        + " ) AS h\n"
//                                        + " LEFT JOIN \n"
//                                        + " (\n"
//                                        + " SELECT * FROM  BRLDTA0100.LN_BILLNOTE\n"
//                                        + " ) AS d\n"
//                                        + " ON   d.LB_BNNO = h.HB_BNNO\n"
//                                        + " WHERE h.HB_USER = '" + user + "' \n"
//                                        + " AND d.LB_BNNO IS NULL ";
                //                       + " WHERE h.HB_USER = '" + user + "' \n"
                //                        + " AND d.lb_BNNO IS  NULL ";
                System.out.println(query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

//                    mMap.put("ESPYNO", mRes.getString(1).trim());
                    mMap.put("HB_BNNO", mRes.getString(1).trim());
                    mMap.put("LB_BNNO", mRes.getString(2).trim());
                    mMap.put("HB_CUNO", mRes.getString(3).trim());
                    mMap.put("STATUS", mRes.getString(4).trim());
                    mMap.put("HB_TRDT", mRes.getString(5).trim());
                    mMap.put("HB_PO", mRes.getString(6).trim());

                    if (mRes.getString(7) != null) {
                        mMap.put("BPM_RINV", mRes.getString(7).trim());
                    } else {
                        mMap.put("BPM_RINV", "-");
                    }
                    mMap.put("HB_STS", mRes.getString(8).trim());

                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static JSONArray checkGrid_ARS200(String cono, String divi, String payer, String type, String ENDDATE) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT C.*,SUBSTR(D.ESIVDT,1,4) || '-' || SUBSTR(D.ESIVDT,5,2)|| '-' || SUBSTR(D.ESIVDT,7,2) as ESIVDT,'false' as WHTAX\n"
                        + "FROM \n"
                        + "(\n"
                        + "SELECT  " + type + ",ESCINO,ESINYR,ESCUCD,SUM(ESCUAM) as ESCUAM\n"
                        + "FROM M3FDBPRD.FSLEDG\n"
                        + "WHERE ESCONO = '" + cono.trim() + "'\n"
                        + "AND ESDIVI = '" + divi.trim() + "'\n"
                        + "AND " + type + " = '" + payer.trim() + "'\n"
                        + "AND ESCINO NOT IN (\n"
                        + "SELECT LB_INVNO\n"
                        + "FROM BRLDTA0100.H_BILLNOTE,BRLDTA0100.LN_BILLNOTE\n"
                        + "WHERE HB_CONO = LB_CONO\n"
                        + "AND HB_DIVI = LB_DIVI\n"
                        + "AND HB_BNNO = LB_BNNO\n"
                        + "AND HB_CONO = '" + cono.trim() + "'\n"
                        + "AND HB_DIVI = '" + divi.trim() + "'\n"
                        + "AND HB_CUNO = '" + payer.trim() + "'\n"
                        //                        + "AND LB_STS = '20' \n"
                        + "AND LB_STS IS NOT NULL \n"
                        + ")\n"
                        + "GROUP BY " + type + ",ESCINO,ESINYR,ESCUCD\n"
                        + "HAVING  SUM(ESCUAM) <> 0\n"
                        + ") C LEFT JOIN (\n"
                        + " SELECT  DISTINCT " + type + ",ESCINO,ESIVDT,ESINYR,ESCUCD\n"
                        + "FROM M3FDBPRD.FSLEDG \n"
                        + "WHERE ESCONO =  '" + cono.trim() + "'\n"
                        + "AND ESDIVI = '" + divi.trim() + "'\n"
                        + ") D ON D." + type + " = C." + type + " AND D.ESCINO = C.ESCINO\n "
                        + "WHERE  ESIVDT  <=  '" + ENDDATE + "' \n"
                        + "ORDER  BY ESCINO ASC,ESIVDT \n";

                System.err.println(query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

//                    mMap.put("ESPYNO", mRes.getString(1).trim());
                    mMap.put("ESCUNO", mRes.getString(1).trim());
                    mMap.put("ESCINO", mRes.getString(2).trim());
                    mMap.put("ESINYR", mRes.getString(3).trim());
                    mMap.put("ESCUCD", mRes.getString(4).trim());
                    mMap.put("ESCUAM", mRes.getString(5).trim());
                    mMap.put("ESIVDT", mRes.getString(6).trim());
                    mMap.put("WHTAX", mRes.getBoolean(7));

                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static JSONArray GetPaymentDate2(String CONO, String CUNO,String PYDATE) throws Exception {

        JSONArray mJSonArr = new JSONArray();

        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
String DD = ""; 
        try {
            if (conn != null) {

                Statement stmt2 = conn.createStatement();
                String query2 = " SELECT HB_TRDT FROM BRLDTA0100.H_BILLNOTE\n"
                        + " WHERE  HB_BNNO  ='"+PYDATE+"'";
                ResultSet mRes2 = stmt2.executeQuery(query2);
                while (mRes2.next()) {
                    DD = mRes2.getString("HB_TRDT");
                }
                

                Statement stmt = conn.createStatement();
                String query = " \n"
                        + " SELECT  BPH_BPDT as DATE ,BPH_STDT as START ,  BPH_FNDT as END   FROM BRLDTA0100.BP_HBILL bh \n"
                        + " WHERE BPH_CUNO  = '" + CUNO + "'\n"
                        + " AND BPH_CONO  = '" + CONO + "' AND BPH_BPDT = '" + DD + "' ";
                ResultSet mRes = stmt.executeQuery(query);

                System.out.println(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("DATE", mRes.getString(1).trim());
                    mMap.put("START", mRes.getString(2).trim());
                    mMap.put("END", mRes.getString(3).trim());

                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static JSONArray GetPaymentDate(String CONO, String CUNO) throws Exception {

        JSONArray mJSonArr = new JSONArray();

        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = " \n"
                        + " SELECT  BPH_BPDT as DATE ,BPH_STDT as START ,  BPH_FNDT as END   FROM BRLDTA0100.BP_HBILL bh \n"
                        + " WHERE BPH_CUNO  = '" + CUNO + "'\n"
                        + " AND BPH_CONO  = '" + CONO + "'";
                ResultSet mRes = stmt.executeQuery(query);

                System.out.println(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("DATE", mRes.getString(1).trim());
                    mMap.put("START", mRes.getString(2).trim());
                    mMap.put("END", mRes.getString(3).trim());

                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static JSONArray Company() throws Exception {

        JSONArray mJSonArr = new JSONArray();

        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT CCCONO,CCDIVI,CCCONM,'\"'|| TRIM(CCCONO) || ' : ' || TRIM(CCDIVI) || ' : ' || TRIM(CCCONM) || '\"' AS COMPANY\n"
                        + "FROM M3FDBPRD.CMNDIV\n"
                        + "WHERE CCDIVI NOT IN  ('','120','130')\n"
                        + "AND CCCONO IN ('10','300')\n"
                        + "ORDER BY CCCONO";
//                System.out.println("SelectCompany\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("CCCONO", mRes.getString(1).trim());
                    mMap.put("CCDIVI", mRes.getString(2).trim());
                    mMap.put("CCCONM", mRes.getString(3).trim());
                    mMap.put("COMPANY", mRes.getString(4).trim());
                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static JSONArray SetnamePayer(String cono, String divi, String code) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        String PAYERNAME = "NOT FOUND";
        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT COALESCE(OKCUNM,'-') AS PAYERNAME FROM M3FDBPRD.OCUSMA WHERE OKCONO = '" + cono.trim() + "'  AND OKCUNO = '" + code.trim() + "'";
//                System.out.println(query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    PAYERNAME = mRes.getString(1).trim();
                }
                Map<String, Object> mMap = new HashMap<>();
                mMap.put("PAYERNAME", PAYERNAME);
                mJSonArr.put(mMap);
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

        return mJSonArr;

    }

    public static JSONArray Grid_ARS200(String cono, String divi, String payer, String type, String ENDDATE) throws Exception {

        System.out.println("PPPPPPPPPPPPPPPPPPPPPPPP");

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT C.*,SUBSTR(D.ESIVDT,1,4) || '-' || SUBSTR(D.ESIVDT,5,2)|| '-' || SUBSTR(D.ESIVDT,7,2) as ESIVDT,'false' as WHTAX\n"
                        + "FROM \n"
                        + "(\n"
                        + "SELECT  " + type + ",ESCINO,ESINYR,ESCUCD,SUM(ESCUAM) as ESCUAM\n"
                        + "FROM M3FDBPRD.FSLEDG\n"
                        + "WHERE ESCONO = '" + cono.trim() + "'\n"
                        + "AND ESDIVI = '" + divi.trim() + "'\n"
                        + "AND " + type + " = '" + payer.trim() + "'\n"
                        + "AND ESCINO NOT IN (\n"
                        + "SELECT LB_INVNO\n"
                        + "FROM BRLDTA0100.H_BILLNOTE,BRLDTA0100.LN_BILLNOTE\n"
                        + "WHERE HB_CONO = LB_CONO\n"
                        + "AND HB_DIVI = LB_DIVI\n"
                        + "AND HB_BNNO = LB_BNNO\n"
                        + "AND HB_CONO = '" + cono.trim() + "'\n"
                        + "AND HB_DIVI = '" + divi.trim() + "'\n"
                        + "AND HB_CUNO = '" + payer.trim() + "'\n"
                        //                        + "AND LB_STS = '20' \n"
                        + "AND LB_STS IS NOT NULL \n"
                        + ")\n"
                        + "GROUP BY " + type + ",ESCINO,ESINYR,ESCUCD\n"
                        + "HAVING  SUM(ESCUAM) <> 0\n"
                        + ") C LEFT JOIN (\n"
                        + " SELECT  DISTINCT " + type + ",ESCINO,ESIVDT,ESINYR,ESCUCD\n"
                        + "FROM M3FDBPRD.FSLEDG \n"
                        + "WHERE ESCONO =  '" + cono.trim() + "'\n"
                        + "AND ESDIVI = '" + divi.trim() + "'\n"
                        + ") D ON D." + type + " = C." + type + " AND D.ESCINO = C.ESCINO\n "
                        + "WHERE  ESIVDT  <=  '" + ENDDATE + "' \n"
                        + "AND  c.ESCINO NOT LIKE '85%'  \n"
                        + "ORDER  BY ESCINO ASC,ESIVDT \n";

                System.err.println(query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

//                    mMap.put("ESPYNO", mRes.getString(1).trim());
                    mMap.put("ESCUNO", mRes.getString(1).trim());
                    mMap.put("ESCINO", mRes.getString(2).trim());
                    mMap.put("ESINYR", mRes.getString(3).trim());
                    mMap.put("ESCUCD", mRes.getString(4).trim());
                    mMap.put("ESCUAM", mRes.getString(5).trim());
                    mMap.put("ESIVDT", mRes.getString(6).trim());
                    mMap.put("WHTAX", mRes.getBoolean(7));

                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static JSONArray ShowBillingNO(String BBNO) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        try {
            Map<String, Object> mMap = new HashMap<>();
            mMap.put("BBNO", BBNO);
            mJSonArr.put(mMap);
        } catch (Exception e) {
            e.printStackTrace();

            throw e;
        }
        return mJSonArr;

    }

    public static JSONArray Search_BillingNote(String CONO, String DIVI, String BNNO, String USER) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT HB_CONO, HB_DIVI, HB_BNNO, SUBSTRING(HB_TRDT,1,4)  || SUBSTRING(HB_TRDT,5,2)  || SUBSTRING(HB_TRDT,7,2) AS HB_TRDT, HB_CUNO, HB_PO, HB_USER, HB_STS\n"
                        + "FROM BRLDTA0100.H_BILLNOTE\n"
                        + "WHERE HB_CONO = '" + CONO.trim() + "'\n"
                        + "AND HB_DIVI = '" + DIVI.trim() + "'\n"
                        + "AND HB_BNNO = '" + BNNO.trim() + "'\n"
                        + "AND HB_USER = '" + USER.trim() + "'";

                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("HB_CONO", mRes.getString(1).trim());
                    mMap.put("HB_DIVI", mRes.getString(2).trim());
                    mMap.put("HB_BNNO", mRes.getString(3).trim());
                    mMap.put("HB_TRDT", mRes.getString(4).trim());
                    mMap.put("HB_CUNO", mRes.getString(5).trim());
                    mMap.put("HB_PO", mRes.getString(6).trim());
                    mMap.put("HB_USER", mRes.getString(7).trim());
                    mMap.put("HB_STS", mRes.getBoolean(8));

                    mJSonArr.put(mMap);

                }
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

        return mJSonArr;

    }

    public static JSONArray Search_BillingNote2(String CONO, String DIVI, String BNNO, String USER) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT HB_CONO, HB_DIVI, HB_BNNO, SUBSTRING(HB_TRDT,1,4)  || SUBSTRING(HB_TRDT,5,2)  || SUBSTRING(HB_TRDT,7,2) AS HB_TRDT, HB_CUNO, HB_PO, HB_USER, HB_STS\n"
                        + "FROM BRLDTA0100.H_BILLNOTE\n"
                        + "WHERE HB_CONO = '" + CONO.trim() + "'\n"
                        + "AND HB_DIVI = '" + DIVI.trim() + "'\n"
                        + "AND HB_BNNO = '" + BNNO.trim() + "'\n"
                        + "AND HB_USER = '" + USER.trim() + "'"
                        + "AND HB_STS = '20'";

                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("HB_CONO", mRes.getString(1).trim());
                    mMap.put("HB_DIVI", mRes.getString(2).trim());
                    mMap.put("HB_BNNO", mRes.getString(3).trim());
                    mMap.put("HB_TRDT", mRes.getString(4).trim());
                    mMap.put("HB_CUNO", mRes.getString(5).trim());
                    mMap.put("HB_PO", mRes.getString(6).trim());
                    mMap.put("HB_USER", mRes.getString(7).trim());
                    mMap.put("HB_STS", mRes.getBoolean(8));

                    mJSonArr.put(mMap);

                }
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

        return mJSonArr;

    }

    public static JSONArray Grid_BillingNote(String cono, String divi, String billnote) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT LB_CONO, LB_DIVI, LB_BNNO, LB_INVNO, LB_INVDT, LB_INVYEAR, LB_INVAMT, LB_WHTAX, LB_TAXAMT,"
                        + " CASE WHEN LB_STS = '20' THEN 'true' ELSE 'false' END AS LB_STS, LB_INVAMT - LB_TAXAMT as BL,SUBSTR(LB_INVDT,1,4) || '-' || SUBSTR(LB_INVDT,5,2)|| '-' || SUBSTR(LB_INVDT,7,2) as INVDATE\n"
                        + "FROM BRLDTA0100.LN_BILLNOTE\n"
                        + "WHERE LB_CONO = '" + cono.trim() + "'\n"
                        + "AND LB_DIVI = '" + divi.trim() + "'\n"
                        + "AND LB_BNNO = '" + billnote.trim() + "' \n "
                        + "ORDER BY LB_INVNO asc,INVDATE ";

//                System.err.println(query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("LB_CONO", mRes.getString(1).trim());
                    mMap.put("LB_DIVI", mRes.getString(2).trim());
                    mMap.put("LB_BNNO", mRes.getString(3).trim());
                    mMap.put("LB_INVNO", mRes.getString(4).trim());
                    mMap.put("LB_INVDT", mRes.getString(5).trim());
                    mMap.put("LB_INVYEAR", mRes.getString(6).trim());
                    mMap.put("LB_INVAMT", mRes.getString(7).trim());
                    mMap.put("LB_WHTAX", mRes.getBoolean(8));
                    mMap.put("LB_TAXAMT", mRes.getString(9).trim());
                    mMap.put("LB_STS", mRes.getBoolean(10));
                    mMap.put("BL", mRes.getString(11).trim());
                    mMap.put("INVDATE", mRes.getString(12).trim());

                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static JSONArray Monitoring(String cono, String divi, String user) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        conn.setAutoCommit(true);
        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT HB_CONO, HB_DIVI, HB_BNNO, HB_TRDT, HB_CUNO, HB_PO, HB_USER, HB_STS,SUBSTRING(HB_TRDT,7,2) || '-' || SUBSTRING(HB_TRDT,5,2) || '-' ||SUBSTRING(HB_TRDT,1,4) AS H_DATE \n"
                        + ",HB_CUNO || ' ' || COALESCE(TRIM(OKCUNM),'-') AS ENAME,COALESCE(TRIM(OKCUNM),'-') as OKCUNM  \n"
                        + "FROM BRLDTA0100.H_BILLNOTE\n"
                        + "LEFT JOIN M3FDBPRD.OCUSMA ON OKSTAT = '20' AND  HB_CUNO = OKCUNO AND OKCONO = HB_CONO \n"
                        + "WHERE HB_CONO  = '" + cono.trim() + "'\n"
                        + "AND HB_DIVI = '" + divi.trim() + "'\n"
                        + "AND HB_USER = '" + user.trim() + "'\n"
                        + "ORDER  BY HB_BNNO ASC";

                System.err.println(query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("HB_CONO", mRes.getString(1).trim());
                    mMap.put("HB_DIVI", mRes.getString(2).trim());
                    mMap.put("HB_BNNO", mRes.getString(3).trim());
                    mMap.put("HB_TRDT", mRes.getString(4).trim());
                    mMap.put("HB_CUNO", mRes.getString(5).trim());
                    mMap.put("HB_PO", mRes.getString(6).trim());
                    mMap.put("HB_USER", mRes.getString(7).trim());
                    mMap.put("HB_STS", mRes.getString(8));
                    mMap.put("H_DATE", mRes.getString(9).trim());
                    mMap.put("E_NAME", mRes.getString(10).trim());
                    mMap.put("OKCUNM", mRes.getString(11).trim());
                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static JSONArray CheckInvoice(String CONO, String DIVI, String Invoice) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        String BBNO = "";
        int count = 0;
        try {
            if (conn != null) {
                Statement stmt = conn.createStatement();
                String query = "SELECT LB_BNNO\n"
                        + "FROM BRLDTA0100.LN_BILLNOTE lb  \n"
                        + "WHERE LB_CONO = '" + CONO.trim() + "'\n"
                        + "AND LB_DIVI  = '" + DIVI.trim() + "'\n"
                        + "AND LB_INVNO = '" + Invoice.trim() + "'";

                ResultSet mRes = stmt.executeQuery(query);
                while (mRes.next()) {
                    BBNO += mRes.getString(1).trim() + " ";
                    count++;
                }

                Map<String, Object> mMap = new HashMap<>();
                mMap.put("BBNO", BBNO);
                mMap.put("Count", count);

                mJSonArr.put(mMap);
            } else {
                System.out.println("Server can't connect.");
            }
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
        return mJSonArr;

    }

}
