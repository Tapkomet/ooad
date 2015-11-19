<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
  <!--title>Email verification success</title-->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title><spring:message code="forgotPassword.title"/></title>
  <link href="../../../resources/img/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon"/>
  <link rel="stylesheet" href="../../../resources/css/bootstrap.css">
  <link rel="stylesheet" href="../../../resources/css/main.css" type="text/css" media="screen"/>

  <script src="../../../resources/js/jquery-1.11.3.js"></script>
  <script src="../../../resources/js/bootstrap.min.js"></script>
</head>

<body>

<div id="wrap">
  <div id="header">
    <div>
      <a href="/"><img id="logo" alt="brand" style="margin-left: 15px;"
                       src="../../../resources/img/logo.png"/></a>
    </div>
  </div>

  <div class="top-block">
    <p id="forgotPasswordSuccess" class="centralWord"><spring:message code="forgotPassword.success"/></p>
    <center><a class="btn btn-primary button-style" href="/"><spring:message code="registration.mainPage"/></a></center>
  </div>




  <div class="footer">
    <div class="thick"></div>
    <div class="thin"></div>
    <div><p class="footertext" style="padding-bottom: 10px;"><spring:message code="login.footer"/></p></div>
  </div>
</div>
</body>
</html>