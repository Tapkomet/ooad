<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><spring:message code="admin.auditoriums.title"/></title>
    <link href="../../../resources/img/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon"/>
    <link rel="stylesheet" href="../../../resources/css/bootstrap.css">
    <link rel="stylesheet" href="../../../resources/css/main.css" type="text/css" media="screen"/>
    <script src="../../../resources/js/jquery-1.11.3.js"></script>
    <script src="../../../resources/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrap">
    <nav id="header">
        <div class="container-fluid">
            <div class="navbar-header" style="width: 290px;">
                <a href=""><img id="logo" alt="brand" src="../../../resources/img/logo.png"></a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="menu-element active" href="/admin/auditoriums"><spring:message
                            code="admin.auditoriums"/></a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle menu-element" data-toggle="dropdown" href="#"><spring:message
                                code="admin.users"/><b
                                class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a class="menu-element-li" href="/admin/allUsers"><spring:message
                                    code="admin.allUsers"/></a></li>
                            <li><a class="menu-element-li" href="/admin/users"><spring:message code="admin.users"/></a>
                            </li>
                            <li><a class="menu-element-li" href="/admin/assistants"><spring:message
                                    code="admin.assistants"/></a></li>
                            <li><a class="menu-element-li" href="/admin/professors"><spring:message
                                    code="admin.professors"/></a></li>
                            <li><a class="menu-element-li" href="/admin/blockedUsers"><spring:message
                                    code="admin.blocked"/></a>
                            </li>
                        </ul>
                    </li>
                    <li><a id="orders" class="menu-element" href="/admin/allOrders"><spring:message
                            code="admin.orders"/></a></li>
                    <li><a id="editProfile" class="menu-element" href="/admin/editProfile"><spring:message
                            code="admin.edit"/></a></li>
                    <li><a class="menu-element" href="/logout"><spring:message code="admin.logout"/></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="table-align bottom-block top-table">
        <div id="tableContainer" class="tableContainer">
            <table class="tbl table table_auditorium table-striped" style="max-width: 100%; width: 430px; ">
                <thead class="fixedHeader">
                <tr>
                    <th width="187px"><spring:message code="admin.auditoriums.number"/></th>
                    <th width="230px"><spring:message code="admin.auditoriums.assistantName"/></th>
                </tr>
                </thead>
                <tbody class="scrollContent">
                <c:forEach items="${auditoriums}" var="item" varStatus="count">
                    <tr data-href="#">
                        <td width="200px"><a href="/admin/auditoriums/${item.number}">${item.number}</a></td>
                        <td width="230px">${item.assistantName}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <center><a data-toggle="modal" data-target="#addAuditorium" class="btn btn-primary button-style" ><spring:message
                    code="admin.addAuditorium"/></a></center>
        </div>
    </div>
    <div class="footer">
        <div class="thick"></div>
        <div class="thin"></div>
        <div><p class="footertext" style="padding-bottom: 10px;"><spring:message code="login.footer"/></p></div>

        <div class="text-center">
            <a href="?lang=en" class="language"><spring:message code="language.en"/></a>
            <a href="?lang=ua" class="language"><spring:message code="language.ua"/></a>
        </div>

        <div class="modal fade" id="addAuditorium" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width:300px;" >
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <center><h4 class="modal-title" id="myModalLabel">Add auditorium</h4></center>
                    </div>
                    <div class="modal-body">
                        <center><input type="email" class="form-control form-style form-auditorium" placeholder="" style="text-align: center;"></center>
                    </div>
                    <div class="modal-footer">
                        <center>  <button type="button" class="btn btn-default" data-dismiss="modal">Add auditorium</button></center>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
