<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.devpro.javaweb18.dto.Employee"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Newsletter Subscribe Form with  Animation</title>
  <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
  <link rel="stylesheet" href="${base}css/style.css">
</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
  <div class="content">
    <form class="subscription" method="POST">
      <input class="add-email" type="email" placeholder="subscribe@me.now" id="email">
      <button class="submit-email" type="button" onclick="submit_email('${base}')">
       	<span class="before-submit">Subscribe</span>
      </button>
    </form>
  </div>
</div>
<!-- partial -->
  <script  src="./script.js"></script>
</body>
</html>
