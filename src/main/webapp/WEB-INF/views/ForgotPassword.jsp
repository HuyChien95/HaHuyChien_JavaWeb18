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
	<title>Quên mật khẩu</title>
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
        <form action="${base}/forgotpassword" method="post" id="forgotPassword">
            <fieldset>
                <legend>Lấy lại mật khẩu</legend>
                <div>
                    <p>Email:</p>
                    <input type="text" id="email" name="email" required="required" placeholder="nhập email đã đăng ký">
                </div>
                <c:if test="${not empty message}">
		            <h5 class="alertSignup">${message}</h5>
                </c:if>
                <button type="submit" class="submitBtn">Xác nhận</button>
            </fieldset>
        </form>
        <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    </div>
</body>
</html>