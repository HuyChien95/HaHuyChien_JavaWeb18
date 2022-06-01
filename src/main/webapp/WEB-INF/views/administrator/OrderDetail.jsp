<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa hoặc cập nhật sản phẩm</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/administrator/layout/fonts_css.jsp"></jsp:include>
</head>
<body>
	<!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->
            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
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
							<li class="menu-item"><a
								href="${base}/admin/productlist/" class="menu-link">
									<div data-i18n="Basic Inputs">Quản lý sản phẩm</div>
							</a></li>
							<li class="menu-item active"><a
								href="${base}/admin/ordermanager" class="menu-link">
									<div data-i18n="Input groups">Quản lý đơn hàng</div>
							</a></li>
							<li class="menu-item"><a
								href="${base}/form-layouts-vertical.html" class="menu-link">
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

                <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar">
                    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                        <a class="nav-item nav-link px-0 me-xl-4" href="${base}/javascript:void(0)">
                            <i class="bx bx-menu bx-sm"></i>
                        </a>
                    </div>

                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">

                        <ul class="navbar-nav flex-row align-items-center ms-auto">
                            <!-- User -->
                            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                <a class="nav-link dropdown-toggle hide-arrow" href="${base}/javascript:void(0);"
                                    data-bs-toggle="dropdown">
                                    <div class="avatar avatar-online">
                                        <img src="${base}/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li>
                                        <a class="dropdown-item" href="${base}/#">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 me-3">
                                                    <div class="avatar avatar-online">
                                                        <img src="${base}/assets/img/avatars/1.png" alt
                                                            class="w-px-40 h-auto rounded-circle" />
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span class="fw-semibold d-block">Huy Chiến</span>
                                                    <small class="text-muted">Admin</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${base}/#">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle">Thông tin cá nhân</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${base}/#">
                                            <i class="bx bx-cog me-2"></i>
                                            <span class="align-middle">Cài đặt</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${base}/#">
                                            <span class="d-flex align-items-center align-middle">
                                                <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                                                <span class="flex-grow-1 align-middle">Thanh toán</span>
                                                <span
                                                    class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${base}/auth-login-basic.html">
                                            <i class="bx bx-power-off me-2"></i>
                                            <span class="align-middle">Đăng xuất</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!--/ User -->
                        </ul>
                    </div>
                </nav>

                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <h4 class="fw-bold py-3 mb-4">Chi Tiết Đơn Hàng</h4>
                        <sf:form action="${base}/admin/addproduct" modelAttribute="product" method="post" enctype="multipart/form-data">
                            <div class="form-label">Mã Đơn Hàng:
                                <h4 id="title" class="form-control">${order.code}</h4>
                            </div>
                            <div class="form-label">Tên Khách Hàng:
                                <h4 id="title" class="form-control">${order.customerName}</h4>
                            </div>
                            <div class="form-label">Email:
                                <h4 id="title" class="form-control">${order.customerEmail}</h4>
                            </div>
                            <div class="form-label">Số Điện Thoại:
                                <h4 id="title" class="form-control">${order.customerPhone}</h4>
                            </div>
                            <div class="form-label">Địa Chỉ:
                                <h4 id="title" class="form-control">${order.customerAddress}</h4>
                            </div>
                            <div class="form-label">Sản Phẩm:
                                
                                		<table>
                                			<tr>
                                				<th>avatar</th>
                                				<th>Tên Sản Phẩm</th>
                                				<th>Đơn Giá</th>
                                				<th>Số Lượng</th>
                                			</tr>
                                <c:forEach items="${order_product}" var="op">
                                <c:forEach items="${product}" var="p">
                                	<c:if test="${op.saleOrder.id == order.id && op.product.id == p.id}">
                                			<tr>
                                				<td><img src="${base}/upload/${p.avatar}" style="width: 100px; height: 100px; object-fit: cover;"></td>
                                				<td>${p.title}</td>
                                				<td>${p.price}</td>
                                				<td>${op.quality}</td>
                                			</tr>
                                	</c:if>
                                </c:forEach>
                                </c:forEach>
                                		</table>
                                	
                            </div>
                            <div class="form-label">Tình Trạng Thanh Toán:
                            	<c:forEach items="${paymentStatus}" var="ps">
                            		<c:if test="${order.paymentStatus.id == ps.id}">
                            			<h4 id="title" class="form-control">${ps.name}</h4>
                            		</c:if>
                            	</c:forEach>            
                            </div>
                            <div class="form-label">Tình Trạng Giao Hàng:
                            	<c:forEach items="${ordertStatus}" var="os">
                            		<c:if test="${order.paymentStatus.id == os.id}">
                            			<h4 id="title" class="form-control">${os.name}</h4>
                            		</c:if>
                            	</c:forEach>            
                            </div>
                            <div class="confirmBnt">
                                <input type="submit" value="Xác nhận" id="button">
                                <a role="button" href="${base}/admin/ordermanager" id="button">Quay lại</a>
                            </div>

                        </sf:form>
                    </div>
                </div>

                <!-- Content -->
                <!-- / Layout wrapper -->
                <!-- js -->
                <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
                
                <!-- summernote -->
                <script type="text/javascript">
                $(document).ready(function(){
                	$('#detail_description').summernote();
                	$('#sort_description').summernote();
                });
                </script>
                <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

</style>
</body>
</html>