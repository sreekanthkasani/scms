<%-- 
    Document   : profile
    Created on : Jun 25, 2017, 8:33:43 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::profile::</title>
        <link type="text/css" rel="stylesheet" href="profile.css">
        <link href='http://fonts.googleapis.com/css?family=Rokkitt:400,700|Lato:400,300' rel='stylesheet' type='text/css'>
        <style>
            b{
                font-family: cursive;
                font-size: 23px;
            }
        </style>
    </head>
    <body>
        <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.sql.DriverManager.*" %>
        <%
            String refno = null;
            if ((request.getParameter("refno")).equals(null)) {
                response.sendRedirect("error.jsp");
                return;
            } else {
                refno = request.getParameter("refno").toString();
            }

            String query;
            Statement st;
            PreparedStatement ps;
            Connection conn;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scms", "root", "root");
            st = conn.createStatement();
        %>
        <%
            query = "select * from personalDetails where admission_no = '" + refno + "'";
            rs = st.executeQuery(query);
            rs.next();
        %>

        <div id="cv" class="instaFade">
            <div class="mainDetails">
                <div id="headshot" class="quickFade">
                    <img src="headshot.jpg" alt="<% String n = rs.getString("Name");%><%= n %>" />
                </div>

                <div id="name">
                    <h1 class="quickFade delayTwo"><%= n%></h1>
                    <h4 class="quickFade delayThree">refno:<%String h = rs.getString("admission_no");%><%= h%></h4>
                    <h4 class="quickFade delayThree">a <%String b = rs.getString("Branch");%><%= b%> Undergraduate </h4>
                </div>

                <div id="contactDetails" class="quickFade delayFour">
                    <ul>
                        <%String e = rs.getString("email");%>
                        <li>e     :  <a href="mailto:<%= e%>" target="_blank"><%= e%></a></li>
                        <li>m    : <%String m = rs.getString("Contact");%> <%= m%> </li>
                        <li>dob : <%String dob = rs.getString("D_O_B");%> <%= dob%> </li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>

            <div id="mainArea" class="quickFade delayFive">
                <section>
                    <article>
                        <div class="sectionTitle">
                            <h1>Personal Details</h1>
                        </div>

                        <div class="sectionContent">
                            <p><b>Name</b>             :   <%= n%></p>
                            <p><b>Father  name</b> :   <%String fn = rs.getString("Father_Name");%> <%= fn%></p>
                            <p><b>Mother name</b> :   <%String mn = rs.getString("Mother_Name");%> <%= mn%></p>
                            <p><b>Address</b>          :   <%String addr = rs.getString("Address");%> <%= addr%></p>
                            <p><b>contact no.</b>     :   <%= m%></p>
                            <p><b>email</b>              :    <%= e%></p>
                        </div>
                    </article>
                    <div class="clear"></div>
                </section>

                <%
                    query = "select * from academicPerformance where admission_no = '" + refno + "'";
                    rs = st.executeQuery(query);
                    rs.next();
                %>         


                <section>
                    <div class="sectionTitle">
                        <h1>Academic performance</h1>
                    </div>

                    <div class="sectionContent">
                        <article>
                            <h2>First Year</h2>
                            <%String Isem = rs.getString("Iy_Isem"); %> 
                            <%String IIsem = rs.getString("Iy_IIsem");%>
                            <p> I semester :  <%= Isem%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :   <%= IIsem%></p>
                        </article>

                        <article>
                            <h2>Second Year</h2>
                            <% Isem = rs.getString("IIy_Isem"); %> 
                            <% IIsem = rs.getString("IIy_IIsem");%>
                            <p> I semester : <%= Isem%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester : <%= IIsem%> </p>
                        </article>

                        <article>
                            <h2>Third Year</h2>
                            <% Isem = rs.getString("IIIy_Isem"); %> 
                            <% IIsem = rs.getString("IIIy_IIsem");%>
                            <p> I semester :  <%= Isem%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester : <%= IIsem%> </p>
                        </article>

                        <article>
                            <h2>Fourth Year</h2>
                            <% Isem = rs.getString("IVy_Isem"); %> 
                            <% IIsem = rs.getString("IVy_IIsem");%>
                            <p> I semester :  <%= Isem%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester : <%= IIsem%> </p>
                        </article>    

                    </div>
                    <div class="clear"></div>
                </section>

                <%
                    query = "select * from attendance where admission_no = '" + refno + "'";
                    rs = st.executeQuery(query);
                    rs.next();
                %>


                <section>
                    <div class="sectionTitle">
                        <h1>Attendance</h1>
                    </div>

                    <div class="sectionContent">
                        <article>
                            <h2>First Year</h2>
                            <%Isem = rs.getString("Iy_Isem"); %> 
                            <%IIsem = rs.getString("Iy_IIsem");%>
                            <p> I semester :  <%= Isem%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :   <%= IIsem%></p>
                        </article>

                        <article>
                            <h2>Second Year</h2>
                            <% Isem = rs.getString("IIy_Isem"); %> 
                            <% IIsem = rs.getString("IIy_IIsem");%>
                            <p> I semester : <%= Isem%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester : <%= IIsem%> </p>
                        </article>

                        <article>
                            <h2>Third Year</h2>
                            <% Isem = rs.getString("IIIy_Isem"); %> 
                            <% IIsem = rs.getString("IIIy_IIsem");%>
                            <p> I semester :  <%= Isem%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester : <%= IIsem%> </p>
                        </article>

                        <article>
                            <h2>Fourth Year</h2>
                            <% Isem = rs.getString("IVy_Isem"); %> 
                            <% IIsem = rs.getString("IVy_IIsem");%>
                            <p> I semester :  <%= Isem%>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester : <%= IIsem%> </p>
                        </article>    

                    </div>
                    <div class="clear"></div>
                </section>

                <%
                    query = "select * from achievements where admission_no = '" + refno + "'";
                    rs = st.executeQuery(query);
                    rs.next();               
                %>         

                <section>
                    <div class="sectionTitle">
                        <h1>Achievements</h1>
                    </div>

                    <div class="sectionContent">
                        <h3> Previous Year Education </h3>
                        <p><b>SSC / Equivalent</b>        :   <%String ssc = rs.getString("ssc_equivalent");%> <%= ssc%></p>
                        <p><b>10+2 / Equivalent</b>       :   <%String inter = rs.getString("inter_equivalent");%> <%= inter%></p>
                        <p><b>Eamcet Rank</b>             :   <%String er = rs.getString("Eamcet_Rank");%> <%= er%></p>
                        <h3> Intrests </h3>
                        <p><b>Sports</b>                       :   <%String sp = rs.getString("sports");%> <%= sp%></p>
                        <p><b>Cultural</b>                    :   <%String cul = rs.getString("cultural");%> <%= cul%></p>
                        <p><b>other</b>                         :   <%String ot = rs.getString("other");%> <%= ot%></p>
                    </div>
                    <div class="clear"></div>
                </section>

                <%
                    query = "select * from counsellerdetails where admission_no = '" + refno + "'";
                    rs = st.executeQuery(query);
                    rs.next();
                %>

                <section>
                    <div class="sectionTitle">
                        <h1>Counseller Details</h1>
                    </div>

                    <div class="sectionContent">
                        <p><b>Counseller name</b>        :   <%String cn = rs.getString("counseller_name");%> <%= cn%></p>
                        <p><b>Counseller mail</b>          :   <%String ce = rs.getString("counseller_email");%> <%= ce%></p>
                        <p><b>Cunseller mobile</b>        :   <%String cm = rs.getString("counseller_mobile");%> <%= cm%></p>
                    </div>
                    <div class="clear"></div>
                </section>

                <%
                    query = "select * from feedetails where admission_no = '" + refno + "'";
                    rs = st.executeQuery(query);
                    rs.next();
                %>

                <section>
                    <div class="sectionTitle">
                        <h1>Fee Details</h1>
                    </div>

                    <div class="sectionContent">
                        <article>
                            <h2>First Year</h2>
                            <%String fp = rs.getString("Iy_feepaid"); %> 
                            <%String jntu = rs.getString("Iy_jntu");%>
                            <%String lib = rs.getString("Iy_library"); %> 
                            <%String fd = rs.getString("Iy_feeDue");%>
                            <p> Fee Paid :  <%= fp%>  &nbsp;&nbsp;  JNTU fee :  <%= jntu%>  &nbsp;&nbsp; Library  :  <%= lib%>  &nbsp;&nbsp;  Fee Due :  <%= fd%></p>
                        </article>

                        <article>
                            <h2>Second Year</h2>
                            <% fp = rs.getString("IIy_feepaid"); %> 
                            <% jntu = rs.getString("IIy_jntu");%>
                            <% lib = rs.getString("IIy_library"); %> 
                            <% fd = rs.getString("IIy_feeDue");%>
                            <p> Fee Paid :  <%= fp%>  &nbsp;&nbsp;  JNTU fee :  <%= jntu%>  &nbsp;&nbsp; Library  :  <%= lib%>  &nbsp;&nbsp;  Fee Due :  <%= fd%></p>
                        </article>

                        <article>
                            <h2>Third Year</h2>
                            <% fp = rs.getString("IIIy_feepaid"); %> 
                            <% jntu = rs.getString("IIIy_jntu");%>
                            <% lib = rs.getString("IIIy_library"); %> 
                            <% fd = rs.getString("IIIy_feeDue");%>
                            <p> Fee Paid :  <%= fp%>  &nbsp;&nbsp;  JNTU fee :  <%= jntu%>  &nbsp;&nbsp; Library  :  <%= lib%>  &nbsp;&nbsp;  Fee Due :  <%= fd%></p>
                        </article>

                        <article>
                            <h2>Fourth Year</h2>
                            <% fp = rs.getString("IVy_feepaid"); %> 
                            <% jntu = rs.getString("IVy_jntu");%>
                            <% lib = rs.getString("IVy_library"); %> 
                            <% fd = rs.getString("IVy_feeDue");%>
                            <p> Fee Paid :  <%= fp%>  &nbsp;&nbsp;  JNTU fee :  <%= jntu%>  &nbsp;&nbsp; Library  :  <%= lib%>  &nbsp;&nbsp;  Fee Due :  <%= fd%></p>
                        </article>

                    </div>
                    <div class="clear"></div>
                </section>

                <%
                    query = "select * from remarks where admission_no = '" + refno + "'";
                    rs = st.executeQuery(query);
                    rs.next();
                %>         

                <section>
                    <div class="sectionTitle">
                        <h1> Remarks</h1>
                    </div>

                    <div class="sectionContent">
                        <article>
                            <h2>Academic remarks</h2>
                            <% String aremarks = rs.getString("Educational");%>
                            <p> <%= aremarks%></p>
                        </article>

                        <article>
                            <h2>Behavioural remarks</h2>
                            <% String bremarks = rs.getString("Behavioural");%>
                            <p> <%= bremarks%></p>
                        </article>
                    </div>
                    <div class="clear"></div>
                </section>

            </div>
        </div>
    </body>
</html>
