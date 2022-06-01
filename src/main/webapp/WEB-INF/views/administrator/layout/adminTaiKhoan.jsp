<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--quản lý Tài khoản -->
<li class="menu-item">
	<a href="${base}/javascript:void(0);" class="menu-link menu-toggle"> 
		<i class="menu-icon tf-icons bx bx-dock-top"></i>
		<div data-i18n="Account Settings">Quản Lý Tài Khoản</div>
	</a>
	<ul class="menu-sub">
		<li class="menu-item">
			<a href="${base}/admin/usermanager" class="menu-link">
				<div data-i18n="Account">Cấp Quyền Admin</div>
			</a>
		</li>
		<li class="menu-item">
			<a href="${base}/pages-account-settings-notifications.html" class="menu-link">
				<div data-i18n="Notifications">Thông báo</div>
			</a>
		</li>
		<li class="menu-item">
			<a href="${base}/logout" class="menu-link">
				<div data-i18n="Connections">Đăng xuất</div>
			</a>
		</li>
	</ul>
</li>
