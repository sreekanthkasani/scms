<%-- 
    Document   : registerStudent
    Created on : Jun 22, 2017, 9:26:02 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Details</title>
        <meta content="noindex, nofollow" name="robots">
        <link rel="stylesheet" type="text/css" href="home.css">
        <link href="reg.css" rel="stylesheet" type="text/css">
        <script src="manageSR.js" type="text/javascript"></script>
        <style>
            #first {
                margin-left: 35px;
                margin-right: 43px;
                margin-top: 23px;
                padding-right: 37px;
                float: right;
            }
        </style>
    </head>
    <body>
        <div class="header-block" style="margin-top: 0px;position:fixed;left: 80px;height: 121px;top: 0px; ">
            <div class="left-block">
                <div class="logotext"><img src="scms1.png" width="401px"></div>
            </div>

        </div>
        <div  class="header-block1">    
            <center>
                <div class="content">
                    <div class="tracker">
                        <ul id="progressbar">
                            <li id="active1">Personal Details</li>
                            <li id="active2">Educational Profiles</li>
                            <li id="active3">Attendance</li>
                            <li id="active4">Achievements</li>
                            <li id="active5">Remarks</li>
                            <li id="active6">Counseller Details</li>
                            <li id="active7">Fee Details</li>
                        </ul>
                    </div>
                    <div class="main">

                        <form action="studDB.jsp" onsubmit="<%session.setAttribute("profileType","register");%>" class="regform" method="post">

                            <%--  ........................................Personal Details .............................................    --%>

                            <fieldset id="first"> 
                                <center>
                                    <table style="height: 48px;" width="578">
                                        <tbody>

                                            <tr>
                                                <td><label>Admission number<br /> <input type="text" name ="htno" placeholder="----------------" /></label></td>
                                                <td><label>branch <br />
                                                        <select class="options" name="branch">
                                                            <option disabled selected >--Select Branch--</option>
                                                            <option>cse</option>
                                                            <option>ece</option>
                                                            <option>eee</option>
                                                            <option>civil</option>
                                                            <option>Mech</option>
                                                        </select></label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table style="height: 48px;" width="578">
                                        <tbody>
                                            <tr>
                                                <td><label>name<input type="text" name="name" placeholder="As per records" /></label></td>
                                                <td style="height: 8px;" width="200px"><center><label>male <input type="radio" name="gender" /></label> <label> female <input type="radio"  name="gender" /></label></center></td>
                                        <td><label>Date Of Birth <input type="text" name="dob"  placeholder="YYYY / MM / DD" /></label></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table style="height: 48px;" width="578">
                                        <tbody>
                                            <tr>
                                                <td><label>Father name <br /><input type="text" name="fname"  placeholder="As per records" /></label></td>
                                                <td><label>Mother name <br /><input type="text" name="mname" placeholder="As per records" /></label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table style="height: 48px;" width="578">
                                        <tbody>
                                            <tr>
                                                <td><label>parent profession<br /> <input type="text" name="pp"  placeholder="where dad works" /></label></td>
                                                <td><label>contact<br /><input type="text" name="mobile" placeholder="Personal is Preffered" /></label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table style="height: 48px;" width="578">
                                        <tbody>
                                            <tr>
                                                <td><label>Email<br /><input type="text" name="email" placeholder="someone@yourmail.com" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table style="height: 48px;" width="578">
                                        <tbody>
                                            <tr>
                                                <td><label>Address<br /><input type="text" name="addr" placeholder="Present Address" /></label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </center>
                                <input id="next_btn1" onclick="next_step1()" type="button" value="Next">
                            </fieldset>


                            <%--  ........................................ Academic Performance .............................................    --%>

                            <fieldset id="second" style="padding-right: 38px;background: ghostwhite;">
                                <center>
                                    <h3>I year</h3>
                                    <table style="height: 49px;" width="407">
                                        <tbody>
                                            <tr>
                                                <td><label>I semester<br /><input type="text" name="Iy_Isem" placeholder="in %" /> </label></td>
                                                <td><label>II semester<br /><input type="text" name="Iy_IIsem" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>II year</h3>
                                    <table style="height: 49px;" width="407">
                                        <tbody>
                                            <tr>
                                                <td><label>I semester<br /><input type="text" name="IIy_Isem" placeholder="in %" /> </label></td>
                                                <td><label>II semester<br /><input type="text" name="IIy_IIsem" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>III year</h3>
                                    <table style="height: 49px;" width="407">
                                        <tbody>
                                            <tr>
                                                <td><label>I semester<br /><input type="text" name="IIIy_Isem" placeholder="in %" /> </label></td>
                                                <td><label>II semester<br /><input type="text" name="IIIy_IIsem" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>IV year</h3>
                                    <table style="height: 49px;" width="407">
                                        <tbody>
                                            <tr>
                                                <td><label>I semester<br /><input type="text" name="IVy_Isem" placeholder="in %" /> </label></td>
                                                <td><label>II semester<br /><input type="text" name="IVy_IIsem" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3> ovear all Grade</h3> 
                                    <table style="height: 49px;" width="407">
                                        <tbody>
                                            <tr>
                                                <td><label>Average of all semesters       <input type="text" name="avgap" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </center>
                                <input id="pre_btn1" onclick="prev_step1()" type="button" value="Previous">
                                <input id="next_btn2" name="next" onclick="next_step2()" type="button" value="Next">
                            </fieldset>

                            <%--  ........................................Attendence .............................................    --%>

                            <fieldset id="third" style="padding-right: 38px;background: ghostwhite;">
                                <center>
                                    <h3>I year</h3>
                                    <table style="height: 44px;" width="448">
                                        <tbody>
                                            <tr>
                                                <td><label>I semester<br /><input type="text" name="I_I" placeholder="in %" /> </label></td>
                                                <td><label>II semester<br /><input type="text" name="I_II" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>II year</h3>
                                    <table style="height: 44px;" width="448">
                                        <tbody>
                                            <tr>
                                                <td><label>I semester<br /><input type="text" name="II_I" placeholder="in %" /> </label></td>
                                                <td><label>II semester<br /><input type="text" name="II_II" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>III year</h3>
                                    <table style="height: 44px;" width="448">
                                        <tbody>
                                            <tr>
                                                <td><label>I semester<br /><input type="text" name="III_I" placeholder="in %" /> </label></td>
                                                <td><label>II semester<br /><input type="text" name="III_II" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>IV year</h3>
                                    <table style="height: 44px;" width="448">
                                        <tbody>
                                            <tr>
                                                <td><label>I semester<br /><input type="text" name="IV_I" placeholder="in %" /> </label></td>
                                                <td><label>II semester<br /><input type="text" name="IV_II" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>ovear all Grade</h3>
                                    <table style="height: 44px;" width="448">
                                        <tbody>
                                            <tr>
                                                <td><label>Average of all semesters <input type="text" name="avgat" placeholder="in %" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </center>
                                <input id="pre_btn2" onclick="prev_step2()" type="button" value="Previous">
                                <input class="next_btn3" onclick="next_step3()" type="button" value="Next">
                            </fieldset>

                            <%--  ........................................Achievements.............................................    --%>

                            <fieldset id="fourth" style="padding-right: 43px;background: ghostwhite;">
                                <center>
                                    <h3>previous year educational</h3>
                                    <table style="height: 71px;" width="367">
                                        <tbody>
                                            <tr>
                                                <td><label>SSC/Equivalent<br /> <input type="text" name="ssc" placeholder="in GPA" /> </label></td>
                                                <td><label>Intermediate/Equivalent<br /> <input type="text" name="ipe" placeholder="in %" /> </label></td>
                                            </tr>
                                            <tr>
                                                <td><label>Eamcet Rank<br /> <input type="text" name="er" placeholder="Eamcet rank scored" /> </label></td>
                                                <td><label>JEE mains<br /> <input type="text" name="jee" placeholder="JEE rank" /> </label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>Sports</h3>
                                    <table style="height: 11px;" width="367">
                                        <tbody>
                                            <tr>
                                                <td><center><label><input type="text" name="sport" placeholder="Highly Intrested" /> </label></center></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <h3>Cultural</h3>
                                    <table style="height: 11px;" width="367">
                                        <tbody>
                                            <tr>
                                                <td><center><label><input type="text" name="cultural" placeholder="Mostly Fond Of " /> </label></center></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <h3>other</h3>
                                    <table style="height: 11px;" width="367">
                                        <tbody>
                                            <tr>
                                                <td><center><label><input type="text" name="other" placeholder="name" /> </label></center></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </center>
                                <input id="pre_btn3" onclick="prev_step3()" type="button" value="Previous">
                                <input class="next_btn4" onclick="next_step4()" type="button" value="Next">
                            </fieldset>

                            <%--  ........................................Remarks .............................................    --%>

                            <fieldset id="fifth" style="padding-right: 38px;background: ghostwhite;">
                                <center>
                                    <h3>Academic Remarks</h3>
                                    <table style="height: 67px;" width="422">
                                        <tbody>
                                            <tr>
                                                <td><center><input type="text" name="ar" placeholder="remarks here" /></center></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </center><center>
                                    <h3>Behavioural Remarks</h3>
                                    <table style="height: 67px;" width="422">
                                        <tbody>
                                            <tr>
                                                <td><center><input type="text" name="br" placeholder="remarks here" /></td>
                                            </tr>
                                            </tbody>
                                    </table>
                                    <br><br><br><br><br><br><br>
                                </center>
                                <input id="pre_btn4" onclick="prev_step4()" type="button" value="Previous">
                                <input class="next_btn5" onclick="next_step5()" type="button" value="Next">
                            </fieldset>

                            <%--  ........................................counseller Details.............................................    --%>

                            <fieldset id="sixth" style="padding-right: 38px;background: ghostwhite;" >
                                <center>
                                    <table style="height: 178px;" width="407">
                                        <tbody>
                                            <tr>
                                                <td><center><label> Counseller name<br><input type="text" name="cname" placeholder="As per college records" /></label></td>
                                            </tr>
                                            <tr>
                                                <td><center><label> Counseller mail<br><input type="text" name="cmail"   placeholder="yourname@mail.com" /><label></td>
                                                        </tr>
                                                        <tr>
                                                            <td><center><label> Counseller mobile<br><input type="text" name="cmobile"   placeholder="mobile" /><label></td>
                                                                    </tr>
                                                                    </tbody>
                                                                    </table>
                                                                    </center>
                                                                    <input id="pre_btn5" onclick="prev_step5()" type="button" value="Previous">
                                                                    <input class="next_btn6" onclick="next_step6()" type="button" value="Next">
                                                                    </fieldset>

                           <%--  ........................................Fee  Details.............................................    --%>
                           
                           
                           <fieldset id="seven" style="padding-right: 38px;background: ghostwhite;" >
                                                                        <center>
                                                                            <h3>I year</h3><h6>Fee per year : 70,000</h6>
                                                                            <table style="height: 39px;" width="494">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><label>fee paid<br><input type="text" name="If" style="width:90px" /><label></td>
                                                                                                    <td><label>JNTU fee<br><input type="text" name="Ij" style="width:90px" /><label></td>
                                                                                                                <td><label>Library fee<br><input type="text" name="Il" style="width:90px" /><label></td>
                                                                                                                            <td><label>fee Due<br><input type="text" name="Ifd" style="width:90px" /><label></td>
                                                                                                                                        </tr>
                                                                                                                                        </tbody>
                                                                                                                                        </table>
                                                                                                                                        <h3>II year</h3>
                                                                                                                                        <table style="height: 39px;" width="494">
                                                                                                                                            <tbody>
                                                                                                                                                <tr>
                                                                                                                                                    <td><label>fee paid<br><input type="text" name="IIf" style="width:90px" /><label></td>
                                                                                                                                                                <td><label>JNTU fee<br><input type="text" name="IIj" style="width:90px" /><label></td>
                                                                                                                                                                            <td><label>Library fee<br><input type="text" name="IIl" style="width:90px" /><label></td>
                                                                                                                                                                                        <td><label>fee Due<br><input type="text" name="IIfd" style="width:90px" /><label></td>
                                                                                                                                                                                                    </tr>
                                                                                                                                                                                                    </tbody>
                                                                                                                                                                                                    </table>
                                                                                                                                                                                                    <h3>III year</h3>
                                                                                                                                                                                                    <table style="height: 39px;" width="494">
                                                                                                                                                                                                        <tbody>
                                                                                                                                                                                                        <tr>
                                                                                                                                                                                                        <td><label>fee paid<br><input type="text" name="IIIf" style="width:90px" /><label></td>
                                                                                                                                                                                                        <td><label>JNTU fee<br><input type="text" name="IIIj" style="width:90px" /><label></td>
                                                                                                                                                                                                        <td><label>Library fee<br><input type="text" name="IIIl" style="width:90px" /><label></td>
                                                                                                                                                                                                        <td><label>fee Due<br><input type="text" name="IIIfd" style="width:90px" /><label></td>
                                                                                                                                                                                                        </tr>
                                                                                                                                                                                                        </tbody>
                                                                                                                                                                                                        </table>
                                                                                                                                                                                                        <h3>IV year</h3>
                                                                                                                                                                                                        <table style="height: 39px;" width="494">
                                                                                                                                                                                                        <tbody>
                                                                                                                                                                                                        <tr>
                                                                                                                                                                                                        <td><label>fee paid<br><input type="text" name="IVf" style="width:90px" /><label></td>
                                                                                                                                                                                                        <td><label>JNTU fee<br><input type="text" name="IVj" style="width:90px" /><label></td>
                                                                                                                                                                                                        <td><label>Library fee<br><input type="text" name="IVl" style="width:90px" /><label></td>
                                                                                                                                                                                                        <td><label>fee Due<br><input type="text" name="IVfd" style="width:90px" /><label></td>
                                                                                                                                                                                                        </tr>
                                                                                                                                                                                                        </tbody>
                                                                                                                                                                                                        </table>
                                                                                                                                                                                                        </center>
                                                                                                                                                                                                        <input id="pre_btn6" onclick="prev_step6()" type="button" value="Previous">
                                                                                                                                                                                                        <input class="submit_btn" onclick="validation(event)" type="submit" value="Submit">
                                                                                                                                                                                                        </fieldset>


                                                                                                                                                                                               </form>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </center>



                                                                                                                                                                                                        <div  style="">
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                               <center>
  <footer style="
                width: 1438px;
                margin-left: 2px;
                margin-bottom: 0px;
                height: 0px;
                margin-right: 111px;
                padding-top: 0px;
                padding-bottom: 20px;
                ">
      <ul style="margin:0px;">
                <li style="margin-right:120px; float: right; text-decoration: none;"><a href="misc.jsp?req=1">give a feedback </a> | <a href="misc.jsp?req=2"> about project</a> |  <a href="misc.jsp?req=3"> Contact </a> </li>
            </ul>
        </footer>
    </center>
                                                                                                                                                                                                        </body>
                                                                                                                                                                                                        </html>