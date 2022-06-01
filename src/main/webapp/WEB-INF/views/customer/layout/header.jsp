<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header -->
<div class="header">
	<!-- header_about -->
	<div class="header_about">
		<div class="hotline">
			<i class="material-icons">call</i>
			<p>
				Hotline: <span>19001234</span>
			</p>
		</div>
		<div class="location">
			<i class="material-icons">location_on</i>
			<p>Tòa B5, Nguyễn Cơ Thạch, Mỹ Đình 2, Nam Từ Liêm, Hà Nội</p>
		</div>
		<div class="gmail">
			<i class="material-icons">email</i>
			<p>h2cdecor@gmail.com</p>
		</div>
		<div>
			<a href="${base}#"><h4>contact</h4></a>
		</div>
		<c:choose>
			<c:when test="${isLogined}">
				<div>
					<a href="${base}/#"><h4>${userLogined.username}</h4></a>
				</div>
				<div>
					<a href="${base}/logout"><h4>Đăng Xuất</h4></a>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<a href="${base}/login"><h4>Đăng Nhập</h4></a>
				</div>
				<div>
					<a href="${base}/signup"><h4>Đăng Ký</h4></a>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	<!-- /header_about -->
	<!-- header_banner -->
	<div class="header_banner">
		<img src="${base}images/header_banner/logo.jpg" alt="">
		<h1>
			<span>H2C.</span>DECOR
		</h1>
	</div>
	<!-- /header_banner -->
	<div class="header_menu">
		<ul>
			<li><a href="${base}/">TRANG CHỦ</a></li>
			<c:forEach items="${categoryParent}" var="parent">
				<c:if test="${parent.id == 40}">
					<li><a href="${base}/productslist/${parent.seo}">ĐÈN TRANG
							TRÍ</a>
				</c:if>
			</c:forEach>
			<ul class="header_menu_submenu">
				<c:forEach items="${categoryChild}" var="child">
					<c:if test="${child.parent.id == 40}">
						<li><a href="${base}/productslist/${child.seo}">${child.name}</a></li>
					</c:if>
				</c:forEach>
			</ul>
			</li>
			<c:forEach items="${categoryParent}" var="parent">
				<c:if test="${parent.id == 41}">
					<li><a href="${base}/productslist/${parent.seo}">ĐỒ DECOR
							NỘI THẤT</a>
				</c:if>
			</c:forEach>
			<ul class="header_menu_submenu">
				<c:forEach items="${categoryChild}" var="child">
					<c:if test="${child.parent.id == 41}">
						<li><a href="${base}/productslist/${child.seo}">${child.name}</a></li>
					</c:if>
				</c:forEach>
			</ul>
			</li>
			<c:forEach items="${categoryParent}" var="parent">
				<c:if test="${parent.id == 42}">
					<li><a href="${base}/productslist/${parent.seo}">BÀN GHẾ</a>
				</c:if>
			</c:forEach>
			<ul class="header_menu_submenu">
				<c:forEach items="${categoryChild}" var="child">
					<c:if test="${child.parent.id == 42}">
						<li><a href="${base}/productslist/${child.seo}">${child.name}</a></li>
					</c:if>
				</c:forEach>
			</ul>
			</li>
			<c:forEach items="${categoryParent}" var="parent">
				<c:if test="${parent.id == 43}">
					<li><a href="${base}/productslist/${parent.seo}">ĐỒ PHONG
							THỦY</a>
				</c:if>
			</c:forEach>
			<ul class="header_menu_submenu">
				<c:forEach items="${categoryChild}" var="child">
					<c:if test="${child.parent.id == 43}">
						<li><a href="${base}/productslist/${child.seo}">${child.name}</a></li>
					</c:if>
				</c:forEach>
			</ul>
			</li>
			<li><a href="${base}#">HỢP TÁC-PHÂN PHỐI</a>
				<ul class="header_menu_submenu">
					<li><a href="${base}#">Hợp Tác</a></li>
					<li><a href="${base}#">Phân Phối</a></li>
					<li><a href="${base}#">Chính Sách Đổi Trả</a></li>
					<li><a href="${base}#">Chính Sách Bảo Mật</a></li>
					<li><a href="${base}#">Điều Khoản Dịch Vụ</a></li>
					<li><a href="${base}#">Chính Sách Vận Chuyển</a></li>
					<li><a href="${base}#">Chính Sách Thanh Toán</a></li>
					<li><a href="${base}#">Chính Sách Bảo Hành</a></li>
				</ul></li>
			<li><a href="${base}#">GÓC TƯ VẤN NHÀ ĐẸP</a>
				<ul class="header_menu_submenu">
					<li><a href="${base}#">Cách Chọn Bàn Ghế</a></li>
					<li><a href="${base}#">Cách Chọn Đồ Trang Trí</a></li>
					<li><a href="${base}#">Cách Chọn Đèn Trang Trí</a></li>
					<li><a href="${base}#">Cách Chọn Lò Sưởi Trang Trí</a></li>
				</ul></li>
			<div class="search">
				<form class="form-inline" action="${base }/productslist/search"
					method="get">
					<input type="text" id="keyword" name="keyword"
						value="${searchModel.keyword}" placeholder="Nhập Đồ Muốn Tìm...">
					<button type="submit" value="Search">
						<span class="material-icons">search</span>
					</button>
				</form>
			</div>
			<div class="cart">
				<a href="${base}/cart/view">
					<p class="material-icons">shopping_cart</p>
					<p>Giỏ Hàng
						<span id="iconShowTotalItemsInCart">
							<c:choose>
								<c:when test="${totalItems == null || totalItems <= 0}">0</c:when>
								<c:otherwise>
									<c:if test="${totalItems > 0}">${totalItems}</c:if>
								</c:otherwise>
							</c:choose>
						</span>
					</p>
				</a>
			</div>
		</ul>
	</div>
</div>
<!-- //header -------------------->