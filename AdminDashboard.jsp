<%-- 
    Document   : AdminDashboard
    Created on : Jun 29, 2017, 8:41:42 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::Admin::</title>
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="home.css">
        <link rel="stylesheet" type="text/css" href="nav.css">
        <script
            src="https://code.jquery.com/jquery-3.2.1.js"
        crossorigin="anonymous"></script>
        <script type="text/javascript">
            function openPage(pageURL)
            {
                window.location.href = pageURL;
            }

            $(document).ready(function () {
            <% session.setAttribute("squery", "no"); %>
                var value = "select * from users";
                $.get("fetchDetails.jsp", {q: value}, function (data) {
                    $("#fetchData").html(data);
                });

                $("#users").on("click", function (e) {
                    var value = "select * from users";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#addusers").on("click", function (e) {
                    $.get("registerFaculty.jsp", function (data) {
                        $("#fetchData").html(data);
                    });
                });

                $("#feedback").on("click", function (e) {
                    var value = "select * from feedback";
                    $.get("fetchDetails.jsp", {q: value}, function (data) {
                        $("#fetchData").html(data);
                    });
                });

            });
        </script>
        <style>
            .header-block1 {
                margin-left: 69px;
                margin-right: 0px;
                padding-left: 0px;
            }
        </style>
    </head>

    <body>

        <div class="header-block" style="margin-top: 0px;height: 128px;">
            <div class="left-block">
                <div class="logotext"><img src="scms1.png" width="401px"></div>
            </div>
            <div class="right-block" style="
                 width: 427px;
                 margin-top: 31px;
                 ">
                <p class="submit" style="width: 105px;">
                    <input type="submit" name="commit" value="Home" onclick ="openPage('dashboard.jsp')"    style="height: 31px; width: 96px"></p>
                <p class="submit" style="width: 105px;"><input type="submit" name="commit" value="Add" onclick = "openPage('registerStudent.jsp')"  style="height: 31px; width: 96px"></p>
                <p class="submit"><input type="submit" name="commit" id="logOut" value="LogOut" onclick = "openPage('login.jsp')"  style="height: 33px; width: 93px"></p><br>
                <h3 style="margin-top:30px"> Welcome : <% String holder = session.getAttribute("uname").toString();%><%= holder%> </h3>
            </div> 
        </div>

        <div  class="header-block1">    
            <center>
                <span class="btngroup">
                    <button class="btngroup--btn" id="advanced"><a href="advanced.jsp" style="text-decoration: none;">Advanced</a></button>
                    <button class="btngroup--btn" id="users">Users</button>
                    <button class="btngroup--btn" id="addusers">Add Users</button>
                    <button class="btngroup--btn" id="feedback">View Feedback</button>
                </span>
                <div id="fetchData">    
            </center>     
        </div>

        <div  style="">
        </div>
    </body>
</html>