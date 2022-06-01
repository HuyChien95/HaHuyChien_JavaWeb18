<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>contact</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    <link rel="stylesheet" href="css/style_contact.css">
</head>
<body>
 <!-- cách 2 -->
    <div class="container">  
        <sf:form modelAttribute="model_contact" id="contact" action="${base}/contact" method="POST" enctype="multipart/form-data">
          <h3>Quick Contact</h3>
          <h4>Contact us today, and get reply with in 24 hours!</h4>
          <fieldset>
            <sf:input path="fullname" placeholder="Họ và tên" name="fullname" type="text" tabindex="1"></sf:input>
          </fieldset>
          <fieldset>
            <sf:input path="email" placeholder="Email" name="email" type="email" tabindex="2"></sf:input>
          </fieldset>
          <fieldset>
            <sf:input path="phoneNumber" placeholder="Số điện thoại" name="phoneNumber" type="tel" tabindex="3"></sf:input>
          </fieldset>
          <fieldset>
            <sf:textarea path="message" placeholder="Nội dung liên hệ" name="message" tabindex="5"></sf:textarea>
          </fieldset>
          <fieldset>
            <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
            <input type="file" class="form-control" id="idAttachment" name="attachment">
            <img alt="" src="${base }/upload/1.jpg">
          </fieldset>
        </sf:form>
      </div>
      
  <!-- cách 3 ajax--><%-- 
	<div class="container">
		<form id="contact" action="${base}/contact" method="POST">
			<h3>Quick Contact</h3>
			<h4>Contact us today, and get reply with in 24 hours!</h4>
			<fieldset>
				<input id="fullname" placeholder="Họ và tên" name="fullname"
					type="text" tabindex="1"></input>
			</fieldset>
			<fieldset>
				<input id="email" placeholder="Email" name="email" type="email"
					tabindex="2"></input>
			</fieldset>
			<fieldset>
				<input id="phoneNumber" placeholder="Số điện thoại"
					name="phoneNumber" type="tel" tabindex="3"></input>
			</fieldset>
			<fieldset>
				<textarea id="message" placeholder="Nội dung liên hệ" name="message"
					tabindex="5"></textarea>
			</fieldset>
			<fieldset>
				<button name="submit" id="contact-submit" onclick="submitBtn()">Submit</button>
			</fieldset>
		</form>
	</div> --%>
</body>
</html>