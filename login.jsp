<%-- 
    Document   : login
    Created on : Jun 19, 2017, 7:11:18 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
         <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" type="text/css" href="home.css">
        <link rel="stylesheet" type="text/css" href="form.css">
        <script src="validateLogin.js"></script>
    </head>

    <body>
        <div class="header-block" style="margin-top: 0px;">
            <div class="left-block">
                <div class="logotext"><img src="scms1.png" width="401px"></div>
            </div>

        </div>
        <div  class="header-block1">    
            <div id="loginMessage">&nbsp;</div>
            <div class="loginWrap">
                <div class="loginBox">
                    <h3>Log In</h3>
                    <form name="loginForm" id="loginForm" action="authenticateLogin.jsp" onsubmit="<% session.setAttribute("postType","login"); %>"  method="post">
                        <input type="text" name="uname" id="username"  placeholder="username" />
                        <div class="loginErrorText" id="let1">&nbsp;</div>

                        <input type="password" name="password" id="password" placeholder="password" />
                        <div class="loginErrorText" id="let2">&nbsp;</div>
                         
                        <select name="course_year" >
                            <option name="default" disabled selected>Course  year</option>
                            <option name="Admin">Admin</option>                       
                            <option name="c1" > I year</option>
                            <option name="c2">II year</option>
                            <option name="c3">III year</option>
                            <option name="c4">IV year</option>
                        </select>
                        <div class="loginErrorText" id="let3">&nbsp;</div>
                        <div>
                            <input type="submit" value="Log In" />
                        </div>

                        <div class="center">
                            <a href="/" class="subtext">Forgot your password?</a>
                        </div>

                    </form>
                </div>
            </div>
            <div  style="">
            </div>
        </div>   
    </body>
</html>