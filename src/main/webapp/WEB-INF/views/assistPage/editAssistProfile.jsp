<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Edit Profile</title>
    <link rel="Shortcut Icon" href="" type="image/x-icon"/>
    <link rel="stylesheet" href="../../../resources/css/bootstrap.css">
    <link rel="stylesheet" href="../../../resources/css/main.css" type="text/css" media="screen"/>
    <script src="../../../resources/js/jquery-1.11.3.js"></script>
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <script>
        jQuery(function ($) {
            $('tbody tr[data-href]').addClass('clickable').click(function () {
                window.location = $(this).attr('data-href');
            });
        });
    </script>
</head>

<body>

<div id="wrap">
    <nav id="header">
        <div class="container-fluid">

            <div class="navbar-header">
                <a href="/assistHome"><img id="logo" alt="brand" src="../../../resources/img/logo.png"></a>
            </div>

            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle menu-element" data-toggle="dropdown" href="/assistHome"> My orders<b
                                class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li class="drop-menu-element"><a class="menu-element-li"
                                                             href="/myComplOrders">My Completed orders</a></li>
                            <li class="drop-menu-element"><a class="menu-element-li"
                                                             href="/myUncomplOrders">My Uncompleted orders</a></li>
                            <li class="drop-menu-element"><a class="menu-element-li"
                                                             href="/ComplOrders">User Completed orders</a></li>
                            <li class="drop-menu-element"><a class="menu-element-li"
                                                             href="/UncomplOrders">User Uncompleted orders</a></li>
                        </ul>
                    </li>
                    <li><a id="editProfile" class="menu-element" href="/editAssistProfile">Edit profile</a></li>
                    <li><a class="menu-element" href="#">Log out</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <div id="profEdit" class="bottom-block top-block">
        <form:form id="passChangeForm" action="editAssistProfile" method="post" commandName="passChangeForm">
            <table border="0">
                <tr>
                    <td class="centralWord" colspan="2" align="center">Password change</td>
                </tr>
                <tr>
                    <td><label class="labels">First Name:</label></td>
                    <td><form:input id="firstName" path="firstName" name="firstName" type="text" value=""
                                    class="form-control form-style" READONLY="true"/></td>
                    <td><form:errors path="firstName" class="regErrors" id="firstName.errors"
                                     cssStyle="color: #ff0000;"/></td>
                </tr>
                <tr>
                    <td><label class="labels">Last Name:</label></td>
                    <td><form:input id="lastName" path="lastName" name="lastName" type="text" value=""
                                    class="form-control form-style" READONLY="true"/></td>
                    <td><form:errors path="lastName" class="regErrors" id="lastName.errors"
                                     cssStyle="color: #ff0000;"/></td>
                </tr>
                <tr>
                    <td><label class="labels">E-mail:</label></td>
                    <td><form:input id="email" path="email" name="email" type="text" value=""
                                    class="form-control form-style" READONLY="true"/></td>
                    <td><form:errors path="email" class="regErrors" id="email.errors" cssStyle="color: #ff0000;"/></td>
                </tr>
                <tr>
                    <td><label class="labels">Old password:</label></td>
                    <td><form:input path="oldPassword" type="password" value=""
                                    class="form-control form-style"/></td>
                    <td><form:errors path="oldPassword" class="regErrors" id="oldPassword.errors"
                                     cssStyle="color: #ff0000;"/></td>
                </tr>
                <tr>
                    <td><label class="labels">New password:</label></td>
                    <td><form:input path="password" type="password" value=""
                                    class="form-control form-style"/></td>
                    <td><form:errors path="password" class="regErrors" id="password.errors"
                                     cssStyle="color: #ff0000;"/></td>
                </tr>
                <tr>
                    <td><label class="labels">Confirm new password:</label></td>
                    <td><form:input path="confPassword" type="password" value=""
                                    class="form-control form-style"/></td>
                    <td><form:errors path="confPassword" class="regErrors" id="confPassword.errors"
                                     cssStyle="color: #ff0000;"/></td>
                </tr>
            </table>
            <div class="form-group">
                <div class="col-md-offset-7  col-md-4">
                    <button id="change-pass-button" type="submit" value="editAssistProfile"
                            class="btn btn-primary btn-block button-style">Submit
                    </button>
                </div>
            </div>
        </form:form>
    </div>

    <div class="footer">
        <div class="thick"></div>
        <div class="thin"></div>
        <div><p class="footertext"> © 2015 All Rights Reserved</p></div>
    </div>
</div>
</body>
</html>