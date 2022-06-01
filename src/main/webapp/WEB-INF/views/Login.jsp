<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng nhập</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/cssLogin.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</head>
<body onscroll="fixMenu()">
	<div class="wrapper">
        <!-- header -->
        <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
        <!-- //header -------------------->
        <form action="${base }/perform_login" method="Post" class="Login_form">
        	<fieldset>
                <legend>Đăng nhập</legend>
                	<c:if test="${not empty param.login_error}">
                		<div role="alert" style="color: red;">
                		Đăng nhập thất bại, hãy thử lại!
                		</div>
                	</c:if>
                <div>
                    <p>Tên đăng nhập:</p>
                    <input type="text" id="user" name="username">
                </div>
                <div>
                    <p>Mật khẩu:</p>
                    <input type="password" id="password" name="password">
                </div>
                <div style="font-weight: normal;">
                    <input type="checkbox" id="remember-me" name="remember-me"> Remember me
                </div>
                <button type="submit" class="submitBtn">Đăng nhập</button>
                <div id="fw_su">
                    <a href="${base}/forgotpassword" id="forgot_password">Quên mật khẩu?</a>
                    <a href="${base}/signup" id="sign_up">Đăng ký</a>
                </div>  
            </fieldset>
        </form>
        <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    </div>
</body>
</html>