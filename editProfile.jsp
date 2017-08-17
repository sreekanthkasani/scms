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
            input[type=text],input[type=password],select{
                background: initial;
                margin: 10px 0;
                padding: 5px;
                border: 3px solid rgba(24, 24, 24, 0);
                border-radius: 4px;
                width: 308px;
                height: 22px;
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
                    <h4 class="quickFade delayThree">a <%String b = rs.getString("Branch");%><%= b%> undergraduate </h4>
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

            <form action="studDB.jsp?refno=<%=refno%>" method="post" onsubmit="<%session.setAttribute("refno", refno);
             session.setAttribute("profileType", "editProfile");%>" >                                 
                <div id="mainArea" class="quickFade delayFive">
                    <section>
                        <article>
                            <div class="sectionTitle">
                                <h1>Personal Details</h1>
                            </div>

                            <div class="sectionContent">
                                <p><b>Name</b>                               :   <input type="text" name="name" value="<%=rs.getString("Name")%>"></p>
                                <p><b>Gender</b>                            :   <input type="text" name="gender" value="<%=rs.getString("Gender")%>"></p>
                                <p><b>Branch</b>                            :   <input type="text" name="branch" value="<%=rs.getString("Branch")%>"></p>
                                <p><b>Date Of Birth</b>                   :   <input type="text" name="dob" value="<%=rs.getString("D_O_B")%>"></p>
                                <p><b>Father  name</b>                   :   <input type="text" name="fname" value="<%=rs.getString("Father_Name")%>"></p>
                                <p><b>Mother name</b>                   :   <input type="text" name="mname" value="<%=rs.getString("Mother_Name")%>"></p>
                                <p><b>Parent Profession</b>             :   <input type="text" name="pp" value="<%=rs.getString("parent_profession")%>"></p>
                                <p><b>Address</b>                             :   <input type="text" name="addr" value="<%=rs.getString("Address")%>"></p>
                                <p><b>contact no.</b>                        :   <input type="text" name="mobile" value="<%=rs.getString("Contact")%>"></p>
                                <p><b>email</b>                                 :   <input type="text" name="email" value="<%=rs.getString("email")%>"></p>
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
                                <p> I semester : <input type="text" style="width:101px;" name="Iy_Isem" value="<%= Isem%>" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :<input type="text" name="Iy_IIsem" style="width:101px;" value="<%= IIsem%>" ></p>
                            </article>

                            <article>
                                <h2>Second Year</h2>
                                <% Isem = rs.getString("IIy_Isem"); %> 
                                <% IIsem = rs.getString("IIy_IIsem");%>
                                <p> I semester : <input type="text" style="width:101px;" name="IIy_Isem" value="<%= Isem%>" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :<input type="text" name="IIy_IIsem" style="width:101px;" value="<%= IIsem%>" ></p>
                            </article>

                            <article>
                                <h2>Third Year</h2>
                                <% Isem = rs.getString("IIIy_Isem"); %> 
                                <% IIsem = rs.getString("IIIy_IIsem");%>
                                <p> I semester : <input type="text" style="width:101px;" name="IIIy_Isem" value="<%= Isem%>" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :<input type="text" name="IIIy_IIsem" style="width:101px;" value="<%= IIsem%>" ></p>
                            </article>

                            <article>
                                <h2>Fourth Year</h2>
                                <% Isem = rs.getString("IVy_Isem"); %> 
                                <% IIsem = rs.getString("IVy_IIsem");%>
                                <p> I semester : <input type="text" style="width:101px;" name="IVy_Isem" value="<%= Isem%>" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :<input type="text" name="IVy_IIsem" style="width:101px;" value="<%= IIsem%>" ></p>
                            </article>    

                            <article>
                                <% String avgap = rs.getString("total_grade"); %> 
                                <p> average : <input type="text" name="avgap" value="<%= avgap%>" ></p>
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
                                <p> I semester : <input type="text" style="width:101px;" name="I_I" value="<%= Isem%>" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :<input type="text" name="I_II" value="<%= IIsem%>" ></p>
                            </article>

                            <article>
                                <h2>Second Year</h2>
                                <% Isem = rs.getString("IIy_Isem"); %> 
                                <% IIsem = rs.getString("IIy_IIsem");%>
                                <p> I semester : <input type="text"  style="width:101px;"  name="II_I" value="<%= Isem%>" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :<input type="text" name="II_II" value="<%= IIsem%>" ></p>
                            </article>

                            <article>
                                <h2>Third Year</h2>
                                <% Isem = rs.getString("IIIy_Isem"); %> 
                                <% IIsem = rs.getString("IIIy_IIsem");%>
                                <p> I semester : <input type="text"  style="width:101px;"  name="III_I" value="<%= Isem%>" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :<input type="text" name="III_II" value="<%= IIsem%>" ></p>
                            </article>

                            <article>
                                <h2>Fourth Year</h2>
                                <% Isem = rs.getString("IVy_Isem"); %> 
                                <% IIsem = rs.getString("IVy_IIsem");%>
                                <p> I semester : <input type="text"  style="width:101px;"  name="IV_I" value="<%= Isem%>" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  II semester :<input type="text" name="IV_II" value="<%= IIsem%>" ></p>
                            </article>    

                            <article>
                                <% String avgat = rs.getString("total_attendance");%>
                                <p> average : <input type="text" name="avgat" value="<%= avgat %>" ></p>
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
                            <p><b>SSC / Equivalent</b>        :    <input type="text" name="ssc" value="<%=rs.getString("ssc_equivalent")%>"></p>
                            <p><b>10+2 / Equivalent</b>       :   <input type="text" name="ipe" value="<%=rs.getString("inter_equivalent")%>"></p>
                            <p><b>Eamcet Rank</b>             :   <input type="text" name="er" value="<%=rs.getString("Eamcet_Rank")%>"></p>
                            <h3> Intrests </h3>
                            <p><b>Sports</b>                       :   <input type="text" name="sport" value="<%=rs.getString("sports")%>"></p>
                            <p><b>Cultural</b>                    :   <input type="text" name="cultural" value="<%=rs.getString("cultural")%>"></p>
                            <p><b>other</b>                        :   <input type="text" name="other" value="<%=rs.getString("other")%>"></p>
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
                            <p><b>Counseller name</b>        :   <input type="text" name="cname" value="<%=rs.getString("counseller_name")%>"></p>
                            <p><b>Counseller mail</b>          :   <input type="text" name="cmail" value="<%=rs.getString("counseller_email")%>"></p>
                            <p><b>Cunseller mobile</b>        :   <input type="text" name="cmobile" value="<%=rs.getString("counseller_mobile")%>"></p>
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
                                <p> Fee Paid :  <input type="text" style="width:150px;" name="If" value="<%= fp%>">  &nbsp;&nbsp;  JNTU fee : <input type="text" style="width:150px;"  name="Ij" value="<%= jntu%>">  &nbsp;&nbsp; Library  :  <input type="text" style="width:150px;"  name="Il" value="<%= lib%>">  &nbsp;&nbsp;  Fee Due :  <input type="text" style="width:150px;"  name="Ifd" value="<%= fd%>"></p>
                            </article>

                            <article>
                                <h2>Second Year</h2>
                                <% fp = rs.getString("IIy_feepaid"); %> 
                                <% jntu = rs.getString("IIy_jntu");%>
                                <% lib = rs.getString("IIy_library"); %> 
                                <% fd = rs.getString("IIy_feeDue");%>
                                <p> Fee Paid :  <input type="text" style="width:150px;" name="IIf" value="<%= fp%>">  &nbsp;&nbsp;  JNTU fee : <input type="text" style="width:150px;"  name="IIj" value="<%= jntu%>">  &nbsp;&nbsp; Library  :  <input type="text" style="width:150px;"  name="IIl" value="<%= lib%>">  &nbsp;&nbsp;  Fee Due :  <input type="text" style="width:150px;"  name="IIfd" value="<%= fd%>"></p>
                            </article>

                            <article>
                                <h2>Third Year</h2>
                                <% fp = rs.getString("IIIy_feepaid"); %> 
                                <% jntu = rs.getString("IIIy_jntu");%>
                                <% lib = rs.getString("IIIy_library"); %> 
                                <% fd = rs.getString("IIIy_feeDue");%>
                                <p> Fee Paid :  <input type="text" style="width:150px;" name="IIIf" value="<%= fp%>">  &nbsp;&nbsp;  JNTU fee : <input type="text" style="width:150px;"  name="IIIj" value="<%= jntu%>">  &nbsp;&nbsp; Library  :  <input type="text" style="width:150px;"  name="IIIl" value="<%= lib%>">  &nbsp;&nbsp;  Fee Due :  <input type="text" style="width:150px;"  name="IIIfd" value="<%= fd%>"></p>
                            </article>

                            <article>
                                <h2>Fourth Year</h2>
                                <% fp = rs.getString("IVy_feepaid"); %> 
                                <% jntu = rs.getString("IVy_jntu");%>
                                <% lib = rs.getString("IVy_library"); %> 
                                <% fd = rs.getString("IVy_feeDue");%>
                                <p> Fee Paid :  <input type="text" style="width:150px;" name="IVf" value="<%= fp%>">  &nbsp;&nbsp;  JNTU fee : <input type="text" style="width:150px;"  name="IVj" value="<%= jntu%>">  &nbsp;&nbsp; Library  :  <input type="text" style="width:150px;"  name="IVl" value="<%= lib%>">  &nbsp;&nbsp;  Fee Due :  <input type="text" style="width:150px;"  name="IVfd" value="<%= fd%>"></p>
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
                                <p><input type="text" style="width:120px;"  name="ar" value="<%= aremarks%>"></p>
                            </article>

                            <article>
                                <h2>Behavioural remarks</h2>
                                <% String bremarks = rs.getString("Behavioural");%>
                                <p><input type="text" style="width:120px;"  name="br" value="<%= bremarks%>"></p>
                            </article>
                        </div>
                        <div class="clear"></div>
                    </section>

                </div>
                <input type="submit" name="update" value="update">            
            </form>              
        </div>
    </body>
</html>
