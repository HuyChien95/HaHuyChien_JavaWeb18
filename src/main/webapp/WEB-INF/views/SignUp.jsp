<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng ký</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/cssLogin.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</head>
<body onscroll="fixMenu()">
	<div class="wrapper">
        <!-- header -->
        <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
        <!-- //header -------------------->
        <!-- form login -->
        <sf:form action="${base}/signup" modelAttribute="user" method="post" enctype="multipart/form-data" id="signUp">
            <fieldset>
                <legend>Đăng Ký</legend>
                <div>
                    <p>Tên đăng nhập:</p>
                    <sf:input type="text" id="user" path="username" required="required"></sf:input>
                </div>
                <c:if test="${not empty userFalse}">
		            <h5 class="alertSignup">${userFalse}</h5>
                </c:if>   
                <div>
                    <p>Mật khẩu:</p>
                    <sf:input type="password" id="password" path="password" required="required"></sf:input>
                </div>
                <div>
                    <p>Email:</p>
                    <sf:input type="text" id="email" path="email" required="required"></sf:input>
                </div>
                <c:if test="${not empty emailFalse}">
		             <h5 class="alertSignup">${emailFalse}</h5>
                </c:if>
                <div>
                    <p>Địa chỉ:</p>
                    <sf:input type="text" id="password" path="address"></sf:input>
                </div>
                <div>
                    <p>Số điện thoại:</p>
                    <sf:input type="tel" id="password" path="phone"></sf:input>
                </div>
                <button type="submit" class="submitBtn">Đăng ký</button>
                <div id="fw_su">
                    <a href="${base}/login" id="sign_up">Đăng nhập</a>
                    <a href="${base}/forgotpassword" id="fogot_password">Quên mật khẩu?</a>
                </div>
            </fieldset>
        </sf:form>
        <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    </div>
</body>
</html>