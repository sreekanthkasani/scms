<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" type="text/css" href="home.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <script
            src="https://code.jquery.com/jquery-3.2.1.js"
        crossorigin="anonymous"></script>
        <script type="text/javascript">
            function openPage(pageURL)
            {
                window.location.href = pageURL;
            }

            $(document).ready(function () {
            <% session.setAttribute("status", "personalDetails"); %>
                var value = "select * from personalDetails";
                $.get("fetchDetails.jsp", {q: value}, function (data) {
                    $("#fetchData").html(data);
                });

                $("#pd").on("click", function (e) {
                    var value = "select * from personalDetails";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#ap").on("click", function (e) {
                    var value = "select * from academicPerformance";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#at").on("click", function (e) {
                    var value = "select * from attendance";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#ac").on("click", function (e) {
                    var value = "select * from achievements";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#re").on("click", function (e) {
                    var value = "select * from Remarks";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#cd").on("click", function (e) {
                    var value = "select * from counsellerDetails";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#fd").on("click", function (e) {
                    var value = "select * from feeDetails";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#btn").on("click", function (e) {
            <%
                String status = session.getAttribute("status").toString();
                session.setAttribute("temper", "true");
            %>
                    var txt = $("#searchIt").val();
                    var value = "select * from <%= status%> where admission_no ='" + txt + "'";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

            });
        </script>
        <title>KnowledgeBase</title>
    </head>
    <body>
        <%
            session.setAttribute("load", "yes");
        %>
        <div class="header-block">
            <div class="left-block">
                <div class="logotext"><a href="dashboard.jsp"><img src="scms1.png" style="width:401px;" alt="home"></a></div>
            </div>
            <div class="right-block" style="
                 width: 427px;
                 margin-top: 31px;
                 ">
                <p class="submit" style="width: 105px;">
                    <%
                        String flag = (String) session.getAttribute("isAdmin");
                        if ("yes".equals(flag)) {
                    %>
                    <input type="submit" name="commit" value="Admin" onclick ="openPage('AdminDashboard.jsp')"    style="height: 31px; width: 96px"></p>
                    <%
                        }
                    %>
                <p class="submit" style="width: 105px;"><input type="submit" name="commit" value="Add" onclick = "openPage('registerStudent.jsp')"  style="height: 31px; width: 96px"></p>
                <p class="submit"><input type="submit" name="commit" id="logOut" value="LogOut" onclick = "openPage('login.jsp')"  style="height: 33px; width: 93px"></p><br>
                <h3 style="margin-top:30px"> Welcome : <% String holder = session.getAttribute("uname").toString();%><%= holder%> </h3>
            </div> 
        </div>
    <center  style=" height: 721px;">
        <div id='cssmenu'>
            <ul style="width:1186px;">
                <li ><a href="#" onclick="<% session.setAttribute("status", "personalDetails"); %>" id="pd" ><span>PersonalDetails</span></a></li>
                <li><a href="#" onclick="<% session.setAttribute("status", "AcademicPerformance"); %>" id="ap"><span>AcademicPerformance</span></a></li>
                <li><a href="#" onclick="<% session.setAttribute("status", "Attendance"); %>" id="at" ><span>Attendance</span></a></li>
                <li><a href="#" onclick="<% session.setAttribute("status", "Achievements"); %>" id="ac" ><span>Achievements</span></a></li>
                <li><a href="#" onclick="<% session.setAttribute("status", "counsellerDetails"); %>" id="cd" ><span>counsellerDetails</span></a></li>
                <li><a href="#" onclick="<% session.setAttribute("status", "FeeDetails"); %>" id="fd" ><span>FeeDetails</span></a></li>
                <li><a href="#" onclick="<% session.setAttribute("status", "Remarks");%>" id="re" ><span>Remarks</span></a></li>
                <li>
                    <input id="searchIt" name="q" style="
                           width: 75px;
                           height: 28px;
                           padding-right: 3px;
                           font-size: 10px;
                           margin-top: 0px;" size="40" type="text" placeholder="search by id"/>
                    <input id="btn" style="
                           width: 38px;
                           height: 29px;
                           padding-left: 0px;
                           border-left-width: 0px;
                           " value="Search" type="submit"/>
                </li>
            </ul>
        </div>
          <%
           String exportToExcel = null;
            if (exportToExcel == null) {
        %>
        <a href="fetchDetails.jsp?exportToExcel=YES"><img src="xl.png" alt="XLS" style="float: right; margin-right: 69px;"></a>
        <%
            }
        %>
        <div id="fetchData"></div><br><br><br><br><br><br><br><br>
    </center>
</body>
</html>
