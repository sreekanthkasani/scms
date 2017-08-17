<%-- 
    Document   : rsReqhandle
    Created on : Jun 23, 2017, 5:24:41 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>request handler</title>
    </head>
    <body>
        <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.sql.DriverManager.*" %>
        <%@page import="java.util.*" %>

        <%
            String refno = null;
            int i1 = 0, i2 = 0, i3 = 0, i4 = 0, i5 = 0, i6 = 0, i7 = 0, k = 0;
            PreparedStatement ps, ps1, ps2, ps3, ps4, ps5, ps6;
            Connection conn;
            String driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String pass = "root";
            String address = "jdbc:mysql://localhost:3306/scms";
            Class.forName(driver);
            conn = DriverManager.getConnection(address, user, pass);
            String query = null;
            Statement st1 = null;
            try {
                st1 = conn.createStatement();
            } catch (NullPointerException ne) {
                out.println("exeption" + ne);
            }
            
            String htno = null;
            boolean isEdit = false;
            if (!(session.getAttribute("profileType")).equals("register")) {
                isEdit = true;
                refno = session.getAttribute("refno").toString();
                htno = refno;
                String[] tables = {"personaldetails", "academicperformance", "attendance", "achievements", "counsellerdetails", "remarks", "feedetails"};
                for (int i = 0; i < 7; i++) {
                    query = "delete from " + tables[i] + " where admission_no ='" + refno + "'";
                    k = st1.executeUpdate(query);
                    if (k != 1) {
                        response.sendRedirect("error.jsp");
                    }
                }
            }
        %>
        <%
            String query_pd = "insert into personalDetails values(?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(query_pd);

            // Fetching values from fieldset1  ---PersonalDetails
            
            if(!isEdit){
            if ((request.getParameter("htno")).equals(null)) {
                ps.setString(1, null);
            } else {
                htno = request.getParameter("htno").toString();
                ps.setString(1, htno);
            }
            }else{
                ps.setString(1, htno);
            }

            String name = null;
            if ((request.getParameter("name")).equals(null)) {
                ps.setString(2, null);
            } else {
                name = (String) request.getParameter("name");
                ps.setString(2, name);
            }

            String branch = null;
            if ((request.getParameter("branch")).equals(null)) {
                ps.setString(11, null);
            } else {
                branch = (String) request.getParameter("branch");
                ps.setString(11, branch);
            }

            String gender = null;
            if ((request.getParameter("gender")).equals(null)) {
                ps.setString(3, null);
            } else {
                gender = (String) request.getParameter("gender");
                ps.setString(3, gender);
            }

            String dob = null;
            if ((request.getParameter("dob")).equals(null)) {
                ps.setString(4, null);
            } else {
                dob = (String) request.getParameter("dob");
                ps.setString(4, dob);
            }

            String father = null;
            if ((request.getParameter("fname")).equals(null)) {
                ps.setString(5, null);
            } else {
                father = (String) request.getParameter("fname");
                ps.setString(5, father);
            }

            String mother = null;
            if ((request.getParameter("mname")).equals(null)) {
                ps.setString(6, null);
            } else {
                mother = (String) request.getParameter("mname");
                ps.setString(6, mother);
            }

            String profession = null;
            if ((request.getParameter("pp")).equals(null)) {
                ps.setString(7, null);
            } else {
                profession = (String) request.getParameter("pp");
                ps.setString(7, profession);
            }

            String mobile = null;
            if ((request.getParameter("mobile")).equals(null)) {
                ps.setString(8, null);
            } else {
                mobile = (String) request.getParameter("mobile");
                ps.setString(8, mobile);
            }

            String email = null;
            if ((request.getParameter("email")).equals(null)) {
                ps.setString(9, null);
            } else {
                email = (String) request.getParameter("email");
                ps.setString(9, email);
            }

            String addr = null;
            if ((request.getParameter("addr")).equals(null)) {
                ps.setString(10, null);
            } else {
                addr = (String) request.getParameter("addr");
                ps.setString(10, addr);
            }
            ps.setString(12, "1");
            i1 = ps.executeUpdate();

            //Fetching values from academicPerformance
            String query_ap = "insert into academicPerformance values(?,?,?,?,?,?,?,?,?,?,?)";
            ps1 = conn.prepareStatement(query_ap);

            ps1.setString(1, htno);
            ps1.setString(2, name);

            Integer Iy_Isem = null;
            String s1 = request.getParameter("Iy_Isem");
            if (s1.equals(null)) {
                ps1.setNull(3, Types.INTEGER);
            } else {
                Iy_Isem = Integer.parseInt(request.getParameter("Iy_Isem"));
                ps1.setInt(3, Iy_Isem);
            }

            Integer Iy_IIsem = null;
            String s2 = request.getParameter("Iy_IIsem");
            if (s2.equals(null)) {
                ps1.setNull(4, Types.INTEGER);
            } else {
                Iy_IIsem = Integer.parseInt(request.getParameter("Iy_IIsem"));
                ps1.setInt(4, Iy_IIsem);
            }

            Integer IIy_Isem = null;
            String s3 = request.getParameter("IIy_Isem");
            if (s3.equals(null)) {
                ps1.setNull(5, Types.INTEGER);
            } else {
                IIy_Isem = Integer.parseInt(request.getParameter("IIy_Isem"));
                ps1.setInt(5, IIy_Isem);
            }

            Integer IIy_IIsem = null;
            String s4 = request.getParameter("IIy_IIsem");
            if (s4.equals(null)) {
                ps1.setNull(6, Types.INTEGER);
            } else {
                IIy_IIsem = Integer.parseInt(request.getParameter("IIy_IIsem"));
                ps1.setInt(6, IIy_IIsem);
            }

            Integer IIIy_Isem = null;
            String s5 = request.getParameter("IIIy_Isem");
            if (s5.equals(null)) {
                ps1.setNull(7, Types.INTEGER);
            } else {
                IIIy_Isem = Integer.parseInt(request.getParameter("IIIy_Isem"));
                ps1.setInt(7, IIIy_Isem);
            }

            Integer IIIy_IIsem = null;
            String s6 = request.getParameter("IIIy_IIsem");
            if (s6.equals(null)) {
                ps1.setNull(8, Types.INTEGER);
            } else {
                IIIy_IIsem = Integer.parseInt(request.getParameter("IIIy_IIsem"));
                ps1.setInt(8, IIIy_IIsem);
            }

            Integer IVy_Isem = null;
            String s7 = request.getParameter("IVy_Isem");
            if (s7.equals(null)) {
                ps1.setNull(9, Types.INTEGER);
            } else {
                IVy_Isem = Integer.parseInt(request.getParameter("IVy_Isem"));
                ps1.setInt(9, IVy_Isem);
            }

            Integer IVy_IIsem = null;
            String s8 = request.getParameter("IVy_IIsem");
            if (s8.equals(null)) {
                ps1.setNull(10, Types.INTEGER);
            } else {
                IVy_IIsem = Integer.parseInt(request.getParameter("IVy_IIsem"));
                ps1.setInt(10, IVy_IIsem);
            }

            String avggrade = null;
            String s9 = request.getParameter("avgap");
            if (s9.equals(null)) {
                ps1.setString(11, null);
            } else {
                avggrade = (String) request.getParameter("avgap");
                ps1.setString(11, avggrade);
            }
            i2 = ps1.executeUpdate();

            //Fetching values from fieldset 3 ---Attedance            
            String query_at = "insert into attendance values(?,?,?,?,?,?,?,?,?,?,?)";
            ps2 = conn.prepareStatement(query_at);

            ps2.setString(1, htno);
            ps2.setString(2, name);

            Integer I_I = null;
            String k1 = request.getParameter("I_I");
            if (k1.equals(null)) {
                ps2.setNull(3, Types.INTEGER);
            } else {
                I_I = Integer.parseInt(request.getParameter("I_I"));
                ps2.setInt(3, I_I);
            }

            Integer I_II = null;
            String k2 = request.getParameter("I_II");
            if (k2.equals(null)) {
                ps2.setNull(4, Types.INTEGER);
            } else {
                I_II = Integer.parseInt(request.getParameter("I_II"));
                ps2.setInt(4, I_II);
            }

            Integer II_I = null;
            String k3 = request.getParameter("II_I");
            if (k3.equals(null)) {
                ps2.setNull(5, Types.INTEGER);
            } else {
                II_I = Integer.parseInt(request.getParameter("II_I"));
                ps2.setInt(5, II_I);
            }

            Integer II_II = null;
            String k4 = request.getParameter("II_II");
            if (k4.equals(null)) {
                ps2.setNull(6, Types.INTEGER);
            } else {
                II_II = Integer.parseInt(request.getParameter("II_II"));
                ps2.setInt(6, II_II);
            }

            Integer III_I = null;
            String k5 = request.getParameter("III_I");
            if (k5.equals(null)) {
                ps2.setNull(7, Types.INTEGER);
            } else {
                III_I = Integer.parseInt(request.getParameter("III_I"));
                ps2.setInt(7, III_I);
            }

            Integer III_II = null;
            String k6 = request.getParameter("III_II");
            if (k6.equals(null)) {
                ps2.setNull(8, Types.INTEGER);
            } else {
                III_II = Integer.parseInt(request.getParameter("III_II"));
                ps2.setInt(8, III_II);
            }

            Integer IV_I = null;
            String k7 = request.getParameter("IV_I");
            if (k7.equals(null)) {
                ps2.setNull(9, Types.INTEGER);
            } else {
                IV_I = Integer.parseInt(request.getParameter("IV_I"));
                ps2.setInt(9, IV_I);
            }

            Integer IV_II = null;
            String k8 = request.getParameter("IV_II");
            if (k8.equals(null)) {
                ps2.setNull(10, Types.INTEGER);
            } else {
                IV_II = Integer.parseInt(request.getParameter("IV_II"));
                ps2.setInt(10, IV_II);
            }

            String avgat = null;
            String k9 = request.getParameter("avgat");
            if (k9.equals(null)) {
                ps2.setString(11, null);
            } else {
                avgat = (String) request.getParameter("avgat");
                ps2.setString(11, avgat);
            }
            i3 = ps2.executeUpdate();

            //Fetching values from fieldset 4 ---Achievements
            String query_ac = "insert into achievements values(?,?,?,?,?,?,?,?)";
            ps3 = conn.prepareStatement(query_ac);

            ps3.setString(1, htno);
            ps3.setString(2, name);

            String ssc = null;
            if ((request.getParameter("ssc")).equals(null)) {
                ps3.setString(3, null);
            } else {
                ssc = request.getParameter("ssc").toString();
                ps3.setString(3, ssc);
            }
            String ipe = null;
            if ((request.getParameter("ipe")).equals(null)) {
                ps3.setString(4, null);
            } else {
                ipe = (String) request.getParameter("ipe");
                ps3.setString(4, ipe);
            }

            String er = null;
            if ((request.getParameter("er")).equals(null)) {
                ps3.setString(5, null);
            } else {
                er = (String) request.getParameter("er");
                ps3.setString(5, er);
            }

            String sports = null;
            if ((request.getParameter("sport")).equals(null)) {
                ps3.setString(6, null);
            } else {
                sports = (String) request.getParameter("sport");
                ps3.setString(6, sports);
            }

            String cultural = null;
            if ((request.getParameter("cultural")).equals(null)) {
                ps3.setString(7, null);
            } else {
                cultural = (String) request.getParameter("cultural");
                ps3.setString(7, cultural);
            }

            String other = null;
            if ((request.getParameter("other")).equals(null)) {
                ps3.setString(8, null);
            } else {
                other = (String) request.getParameter("other");
                ps3.setString(8, other);
            }

            i4 = ps3.executeUpdate();

            //Fetching values from fieldset 5 --Remarks
            String query_re = "insert into remarks values(?,?,?,?)";
            ps4 = conn.prepareStatement(query_re);

            ps4.setString(1, htno);
            ps4.setString(2, name);

            String aremarks = null;
            if ((request.getParameter("ar")).equals(null)) {
                ps4.setString(3, null);
            } else {
                aremarks = (String) request.getParameter("ar");
                ps4.setString(3, aremarks);
            }

            String bremarks = null;
            if ((request.getParameter("br")).equals(null)) {
                ps4.setString(4, null);
            } else {
                bremarks = (String) request.getParameter("br");
                ps4.setString(4, bremarks);
            }

            i5 = ps4.executeUpdate();

            //Fetching values from fieldset6 --Counseller Details
            String query_cd = "insert into counsellerDetails values(?,?,?,?,?)";
            ps5 = conn.prepareStatement(query_cd);

            ps5.setString(1, htno);
            ps5.setString(2, name);

            String cname = null;
            if ((request.getParameter("cname")).equals(null)) {
                ps5.setString(3, null);
            } else {
                cname = (String) request.getParameter("cname");
                ps5.setString(3, cname);
            }

            String cmail = null;
            if ((request.getParameter("cmail")).equals(null)) {
                ps5.setString(4, null);
            } else {
                cmail = (String) request.getParameter("cmail");
                ps5.setString(4, cmail);
            }

            String cmobile = null;
            if ((request.getParameter("cmobile")).equals(null)) {
                ps5.setString(5, null);
            } else {
                cmobile = (String) request.getParameter("cmobile");
                ps5.setString(5, cmobile);
            }

            i6 = ps5.executeUpdate();

            //Fetching values from fieldset7 --FeeDetails
            String query_fd = "insert into feeDetails values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps6 = conn.prepareStatement(query_fd);

            ps6.setString(1, htno);
            ps6.setString(2, name);

            Integer Iy_feepaid = null;
            String m1 = request.getParameter("If");
            if (m1.equals(null)) {
                ps6.setNull(3, Types.INTEGER);
            } else {
                Iy_feepaid = Integer.parseInt(request.getParameter("If"));
                ps6.setInt(3, Iy_feepaid);
            }

            Integer Iy_jntu = null;
            String m2 = request.getParameter("Ij");
            if (m2.equals(null)) {
                ps6.setNull(4, Types.INTEGER);
            } else {
                Iy_jntu = Integer.parseInt(request.getParameter("Ij"));
                ps6.setInt(4, Iy_jntu);
            }

            Integer Iy_library = null;
            String m3 = request.getParameter("Il");
            if (m3.equals(null)) {
                ps6.setNull(5, Types.INTEGER);
            } else {
                Iy_library = Integer.parseInt(request.getParameter("Il"));
                ps6.setInt(5, Iy_library);
            }

            Integer Iy_feedue = null;
            String m4 = request.getParameter("Ifd");
            if (m4.equals(null)) {
                ps6.setNull(6, Types.INTEGER);
            } else {
                Iy_feedue = Integer.parseInt(request.getParameter("Ifd"));
                ps6.setInt(6, Iy_feedue);
            }

            Integer IIy_feepaid = null;
            String m5 = request.getParameter("IIf");
            if (m5.equals(null)) {
                ps6.setNull(7, Types.INTEGER);
            } else {
                IIy_feepaid = Integer.parseInt(request.getParameter("IIf"));
                ps6.setInt(7, IIy_feepaid);
            }

            Integer IIy_jntu = null;
            String m6 = request.getParameter("IIj");
            if (m6.equals(null)) {
                ps6.setNull(8, Types.INTEGER);
            } else {
                IIy_jntu = Integer.parseInt(request.getParameter("IIj"));
                ps6.setInt(8, IIy_jntu);
            }

            Integer IIy_library = null;
            String m7 = request.getParameter("IIl");
            if (m7.equals(null)) {
                ps6.setNull(9, Types.INTEGER);
            } else {
                IIy_library = Integer.parseInt(request.getParameter("IIl"));
                ps6.setInt(9, IIy_library);
            }

            Integer IIy_feedue = null;
            String m8 = request.getParameter("IIfd");
            if (m8.equals(null)) {
                ps6.setNull(10, Types.INTEGER);
            } else {
                IIy_feedue = Integer.parseInt(request.getParameter("IIfd"));
                ps6.setInt(10, IIy_feedue);
            }

            Integer IIIy_feepaid = null;
            String m9 = request.getParameter("IIIf");
            if (m9.equals(null)) {
                ps6.setNull(11, Types.INTEGER);
            } else {
                IIIy_feepaid = Integer.parseInt(request.getParameter("IIIf"));
                ps6.setInt(11, IIIy_feepaid);
            }

            Integer IIIy_jntu = null;
            String m10 = request.getParameter("IIIj");
            if (m10.equals(null)) {
                ps6.setNull(12, Types.INTEGER);
            } else {
                IIIy_jntu = Integer.parseInt(request.getParameter("IIIj"));
                ps6.setInt(12, IIIy_jntu);
            }

            Integer IIIy_library = null;
            String m11 = request.getParameter("IIIl");
            if (m11.equals(null)) {
                ps6.setNull(13, Types.INTEGER);
            } else {
                IIIy_library = Integer.parseInt(request.getParameter("IIIl"));
                ps6.setInt(13, IIIy_library);
            }

            Integer IIIy_feedue = null;
            String m12 = request.getParameter("IIIfd");
            if (m12.equals(null)) {
                ps6.setNull(14, Types.INTEGER);
            } else {
                IIIy_feedue = Integer.parseInt(request.getParameter("IIIfd"));
                ps6.setInt(14, IIIy_feedue);
            }

            Integer IVy_feepaid = null;
            String m13 = request.getParameter("IVf");
            if (m13.equals(null)) {
                ps6.setNull(15, Types.INTEGER);
            } else {
                IVy_feepaid = Integer.parseInt(request.getParameter("IVf"));
                ps6.setInt(15, IVy_feepaid);
            }

            Integer IVy_jntu = null;
            String m14 = request.getParameter("IVj");
            if (m14.equals(null)) {
                ps6.setNull(16, Types.INTEGER);
            } else {
                IVy_jntu = Integer.parseInt(request.getParameter("IVj"));
                ps6.setInt(16, IVy_jntu);
            }

            Integer IVy_library = null;
            String m15 = request.getParameter("IVl");
            if (m15.equals(null)) {
                ps6.setNull(17, Types.INTEGER);
            } else {
                IVy_library = Integer.parseInt(request.getParameter("IVl"));
                ps6.setInt(17, IVy_library);
            }

            Integer IVy_feedue = null;
            String m16 = request.getParameter("IVfd");
            if (m16.equals(null)) {
                ps6.setNull(18, Types.INTEGER);
            } else {
                IVy_feedue = Integer.parseInt(request.getParameter("IVfd"));
                ps6.setInt(18, IVy_feedue);
            }

            i7 = ps6.executeUpdate();
        %>

        <%   /* try {
                out.println("in the try block");
                 i1 = st1.executeUpdate(query_pd);
                session.setAttribute("i1", i1);
                i2 = st2.executeUpdate(query_ap);
                session.setAttribute("i2", i2);
                i3 = st3.executeUpdate(query_at);
                session.setAttribute("i3", i3);
                i4 = st4.executeUpdate(query_ac);
                session.setAttribute("i4", i4);
                i5 = st5.executeUpdate(query_re);
                session.setAttribute("i5", i5);
                i6 = st6.executeUpdate(query_cd);
                session.setAttribute("i6", i6);
                i7 = st7.executeUpdate(query_fd);
                session.setAttribute("i7", i7);
            } catch (SQLException e) {
                System.err.println("hello boss some exception had raised");
                out.println("might be this one" + e);
            } catch (NullPointerException ne) {
                System.err.println("hello boss some exception had raised");
                out.println("might be this one" + ne);
            } */
        %>
        <%
            int j = i1 + i2 + i3 + i4 + i5 + i6 + i7;
            if (j >= 7) {
        %>
        <jsp:forward page="dashboard.jsp" />
        <%} else {%> 
        <jsp:forward page="error.jsp" />
        <%}%>

    </body>
</html>
