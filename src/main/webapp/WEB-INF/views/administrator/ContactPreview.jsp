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
							<li class="menu-item"><a
								href="${base}/forms-input-groups.html" class="menu-link">
									<div data-i18n="Input groups">Quản lý đơn hàng</div>
							</a></li>
							<li class="menu-item active"><a
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
                        <h4 class="fw-bold py-3 mb-4">THÊM/SỬA SẢN PHẨM</h4>
                        <sf:form action="${base}/admin/addproduct" modelAttribute="product" method="post" enctype="multipart/form-data">
                        	<sf:hidden path="id"/>
                            <label for="title" class="form-label">Tên sản phẩm:
                                <sf:input type="text" id="title" class="form-control" path="title" required="required"></sf:input>
                            </label>
                            <label for="category" class="form-label">Danh mục sản phẩm:
                            	<sf:select path="categories.id" class="form-control">
                            		<sf:options items="${categories.childs}" itemValue="id" itemLabel="name" />
                            	</sf:select>
                            </label>
                            <label for="price" class="form-label">Giá sản phẩm:
                                <sf:input type="text" id="price" class="form-control" path="price" required="required"></sf:input>
                            </label>
                            <label for="price_sale" class="form-label">Giảm giá:
                                <sf:input type="text" id="price_sale" class="form-control" path="priceSale"></sf:input>
                            </label>
                            <label for="sort_description" class="form-label">Mô tả sản phẩm:
                                <sf:textarea type="text" id="sort_description" class="form-control" path="shortDes" required="required"></sf:textarea>
                            </label>
                            <label for="detail_description" class="form-label">Chi tiết sản phẩm:
                                <sf:textarea type="text" id="detail_description" class="form-control" path="details" required="required"></sf:textarea>
                            </label>
                            <label for="hot_product" class="form-label">sản phẩm hot:
                                <sf:checkbox id="hot_product" class="form-check-input" path="isHot"></sf:checkbox>
                            </label>
                            <label for="avatar" class="form-label">ảnh đại diện:
                                <input type="file" id="avatar" class="form-control" name="productAvatar">
                            </label>
                            <label for="avatar" class="form-label">ảnh Slides:
                                <input type="file" id="avatar" multiple="multiple" class="form-control" name="productPictures">
                            </label>
                            <div>
                                <input type="submit" value="Xác nhận" id="button">
                                <a role="button" href="${base}/admin/productlist" id="button">Quay lại</a>
                            </div>

                        </sf:form>
                    </div>
                </div>

                <!-- Content -->
                <!-- / Layout wrapper -->
                <!-- js -->
                <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</html>