<%-- 
    Document   : advanced
    Created on : Jul 1, 2017, 6:06:15 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::WebQL::</title>
         <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" type="text/css" href="Holder.css">
        <script
            src="https://code.jquery.com/jquery-3.2.1.js"
        crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                $("#exec").on("click", function (e) {
                    var txt = $("#queryIt").val();
                    var value = txt;
                    $.get("queryhandler.jsp", {q: value}, function (data) {
                        $("#viewBlock").html(data);
                    });
                });
            });
        </script>
    </head>
    <body>
        <div class="header-block" style="margin-top: 0px;">
            <div class="left-block">
                <div class="logotext">
                    <img src="scms1.png" style="width:401px;" alt="home">
                    <a href="AdminDashboard.jsp"><img src="close.png" style="float: right;" alt="close"></a>
                </div>
            </div>
        </div>
    <center>
        <div class="search-wrapper cf">
            <input type="text" id="queryIt" placeholder="sql query here ......" required="">
            <button type="submit" id="exec">Execute</button>
        </div>
        <div id="viewBlock"> 
    </center>
</body>
</html>
