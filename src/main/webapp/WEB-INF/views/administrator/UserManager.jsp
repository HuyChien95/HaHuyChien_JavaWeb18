<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template-free">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Quản lý sản phẩm</title>

<meta name="description" content="" />

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/administrator/layout/fonts_css.jsp"></jsp:include>
<!-- Helpers -->
<script src="${base}/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="${base}/assets/js/config.js"></script>
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<aside id="layout-menu"
				class="layout-menu menu-vertical menu bg-menu-theme">
				<jsp:include
					page="/WEB-INF/views/administrator/layout/adminlogo.jsp"></jsp:include>

				<ul class="menu-inner py-1">
					<!-- Dashboard -->
					<jsp:include
						page="/WEB-INF/views/administrator/layout/adminDashboard.jsp"></jsp:include>
					<!--quản lý giao diện-->
					<jsp:include
						page="/WEB-INF/views/administrator/layout/adminGiaoDien.jsp"></jsp:include>
					<!--quản lý đơn hàng -->
					<li class="menu-item active open"><a
						href="${base}/javascript:void(0);" class="menu-link menu-toggle">
							<i class="menu-icon tf-icons bx bx-detail"></i>
							<div data-i18n="Form Elements">Quản lý hàng hóa</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item active"><a
								href="${base}/admin/productlist/" class="menu-link">
									<div data-i18n="Basic Inputs">Quản lý sản phẩm</div>
							</a></li>
							<li class="menu-item"><a
								href="${base}/admin/ordermanager" class="menu-link">
									<div data-i18n="Input groups">Quản lý đơn hàng</div>
							</a></li>
							<li class="menu-item"><a
								href="${base}/admin/contact" class="menu-link">
									<div data-i18n="Vertical Form">Khách hàng liên hệ</div>
							</a></li>
						</ul></li>
					<!-- Quản lý nhân sự  -->
					<jsp:include
						page="/WEB-INF/views/administrator/layout/adminNhanSu.jsp"></jsp:include>
					<!-- Quản lý tài khoản  -->
					<jsp:include
						page="/WEB-INF/views/administrator/layout/adminTaiKhoan.jsp"></jsp:include>
				</ul>
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<jsp:include page="/WEB-INF/views/administrator/layout/navBar.jsp"></jsp:include>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<form class="form-inline" action="${base}/admin/usermanager" method="get">
							<div class="d-flex flex-row">
								<input type="hidden" id="page" name="page" class="form-control">
								<input type="hidden" id="status" name="status" class="form-control">
								
								<input type="text" id="keyword" name="keyword"
									class="form-control" placeholder="Search"
									value="${searchModel.keyword }" style="margin-right: 5px;">
								<select class="form-control" name="categoryId" id="categoryId"
									style="margin-right: 5px; width: 200px">
									<option value="0">All</option>
									<c:forEach var="ro" items="${roles}">
									<option value="${ro.id}">${ro.name}</option>
									</c:forEach>
								</select>
								<button type="submit" id="btnSearch" value="Search" class="btn btn-primary">Seach</button>
								<div>
									<a class="btn btn-primary" id="btnAdd"
										href="${base }/admin/addproduct" role="button"
										style="width: 200px; margin-left: 5px;">+ Thêm Sản Phẩm</a>
								</div>
							</div>
						
						<!-- Basic Bootstrap Table -->
						<div class="card">
							<h5 class="card-header">Danh Sách Tài Khoản</h5>
							<div class="table-responsive text-nowrap">
								<table class="table">
									<thead>
										<tr>
											<th>Tên Tài Khoản</th>
											<th>Email</th>
											<th>Số Điện Thoại</th>
											<th>Địa Chỉ</th>
											<th>Vai Trò</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<c:forEach var="user" items="${user.data}">
											<tr>
												<td>${user.username}</td>
												<td>${user.email}</td>
												<td>${user.phone}</td>
												<td>${user.address}</td>
												<td>
													<c:forEach items = "${user.roles}" var = "us">
														${us.name}
													</c:forEach>
												</td>
												<td>
													<div class="dropdown-item" onclick="setRole(${user.id})"><i class="bx bx-hide me-2"></i> Cấp Quyền Admin</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>	
							</div>
						</div>
						</form>
						<!-- Paging -->
								<div class="row">
									<div class="col-12 d-flex justify-content-center" style="margin-top: 1.625rem">
										<div id="paging"></div>
									</div>
								</div>
						<!--/ Basic Bootstrap Table -->
						<hr class="my-5" />
						<div class="content-backdrop fade"></div>
					</div>
					<!-- Content wrapper -->
				</div>
				<!-- / Layout page -->
			</div>

			<!-- Overlay -->
			<div class="layout-overlay layout-menu-toggle"></div>

			<!-- add products -->
			<div class="wrapper_add"></div>
		</div>
		<!-- / Layout wrapper -->
		
		<!-- core JS -->
		
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		
		<!-- Core JS paging-->
		<script type="text/javascript">
		$( document ).ready(function() {
			$("#categoryId").val(${searchModel.categoryId});
			
			$("#paging").pagination({
				currentPage: ${products.currentPage},
		        items: ${products.totalItems},
		        itemsOnPage: 15,
		        cssStyle: 'light-theme', 
		        onPageClick: function(pageNumber, event) {
		        	$('#page').val(pageNumber);
		        	$('#btnSearch').trigger('click');
				},
		    });
			
		});
		</script> 
		<!-- core delete -->
		
		<script type="text/javascript">
		/*set role user*/
		function setRole(userId){
					//javascript object.  
					var data = {
						id: userId,
					};
					
					// $ === jQuery
					// json == javascript object
					jQuery.ajax({
						url: "${base}" + "/ajax/rolesAdmin", //->request mapping
						type: "post",					//-> method type của Request Mapping	
						contentType: "application/json",//-> nội dung gửi lên dạng json
						data: JSON.stringify(data),
						dataType: "json", // kiểu dữ liệu trả về từ Controller
						success: function(jsonResult) {
							alert(jsonResult.success);
							window.location.reload();
						},
						error: function(jqXhr, textStatus, errorMessage) {
							alert("error");
						}
					});
				}
		</script>
</body>

</html>
