<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GIỎ HÀNG</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css2.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</head>

<body onscroll="fixMenu()">
    <div class="wrapper">
        <!-- header -->
        <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
        <!-- //header -------------------->
        <div class="folder_tree">
            <p class="material-icons">home</p>
            <p id="parentfolder"><a href="${base}/home">Trang Chủ</a></p>
            <p>/</p>
            <c:forEach items="${categoryParent}" var="parent">
		    	<c:if test="${parent.id == categorySeo.parent.id || parent.id == categorySeo.id}">
            		<p id="subfolder"><a href="${base}/productslist/${parent.seo}">${parent.name}</a></p>
            	</c:if>
            </c:forEach>
        </div>
        <div class="wrapper_content">
            <div class="wrapper_left">
                <ul>
                    <li>
                        <p>ĐÈN TRANG TRÍ</p>
                        <ul>
                        	<c:forEach items="${categoryChild}" var="child">
		                        <c:if test="${child.parent.id == 40 }">
		                            <li><a href="${base}/productslist/${child.seo}">» ${child.name}</a></li>
		                        </c:if>
		                    </c:forEach>    
                        </ul>
                    </li>
                    <li>
                        <p>ĐỒ DECOR NỘI THẤT</p>
                        <ul>
                            <c:forEach items="${categoryChild}" var="child">
		                        <c:if test="${child.parent.id == 41 }">
		                            <li><a href="${base}/productslist/${child.seo}">» ${child.name}</a></li>
		                        </c:if>
		                    </c:forEach>
                        </ul>
                    </li>
                    <li>
                        <p>BÀN GHẾ</p>
                        <ul>
                            <c:forEach items="${categoryChild}" var="child">
		                        <c:if test="${child.parent.id == 42 }">
		                            <li><a href="${base}/productslist/${child.seo}">» ${child.name}</a></li>
		                        </c:if>
		                    </c:forEach>
                        </ul>
                    </li>
                    <li>
                        <p>ĐỒ PHONG THỦY</p>
                        <ul>
                            <c:forEach items="${categoryChild}" var="child">
		                        <c:if test="${child.parent.id == 43 }">
		                            <li><a href="${base}/productslist/${child.seo}">» ${child.name}</a></li>
		                        </c:if>
		                    </c:forEach>
                        </ul>
                    </li>
                    <li>
                        <p>KẾT NỐI VỚI CHÚNG TÔI</p>
                        <ul id="connect">
                            <li><a href="${base}#"><i class="fa-brands fa-facebook"></i></a></li>
                            <li><a href="${base}#"><i class="fa-brands fa-google-plus"></i></a></li>
                            <li><a href="${base}#"><i class="fa-brands fa-pinterest"></i></a></li>
                        </ul>
                    </li>
                    <li>
                        <p>GÓC TƯ VẤN NHÀ ĐẸP</p>
                        <ul>
                            <li id="advise_content">
                                <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                                <p>
                                    <a href="${base}#">Lò Sưởi Gỉa, Máy Tạo Lửa 3D, 4D Làn Sóng Trang Trí Nội Thất</a>
                                    <span>04/02/2022</span>
                                </p>
                            </li>
                            <li id="advise_content">
                                <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                                <p>
                                    <a href="${base}#">Lò Sưởi Gỉa, Máy Tạo Lửa 3D, 4D Làn Sóng Trang Trí Nội Thất</a>
                                    <span>04/02/2022</span>
                                </p>
                            </li>
                            <li id="advise_content">
                                <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                                <p>
                                    <a href="${base}#">Lò Sưởi Gỉa, Máy Tạo Lửa 3D, 4D Làn Sóng Trang Trí Nội Thất</a>
                                    <span>04/02/2022</span>
                                </p>
                            </li>
                            <li id="advise_content">
                                <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                                <p>
                                    <a href="${base}#">Lò Sưởi Gỉa, Máy Tạo Lửa 3D, 4D Làn Sóng Trang Trí Nội Thất</a>
                                    <span>04/02/2022</span>
                                </p>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <p>SẢN PHẨM NỔI BẬT</p>
                        <ul>
                            <li id="advise_content">
                                <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                                <p>
                                    <a href="${base}/chitiet">Lò Sưởi Gỉa, Máy Tạo Lửa 3D, 4D Làn Sóng Trang Trí Nội Thất</a>
                                    <span>04/02/2022</span>
                                </p>
                            </li>
                            <li id="advise_content">
                                <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                                <p>
                                    <a href="${base}/chitiet">Lò Sưởi Gỉa, Máy Tạo Lửa 3D, 4D Làn Sóng Trang Trí Nội Thất</a>
                                    <span>04/02/2022</span>
                                </p>
                            </li>
                            <li id="advise_content">
                                <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                                <p>
                                    <a href="${base}/chitiet">Lò Sưởi Gỉa, Máy Tạo Lửa 3D, 4D Làn Sóng Trang Trí Nội Thất</a>
                                    <span>04/02/2022</span>
                                </p>
                            </li>
                            <li id="advise_content">
                                <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                                <p>
                                    <a href="${base}/chitiet">Lò Sưởi Gỉa, Máy Tạo Lửa 3D, 4D Làn Sóng Trang Trí Nội Thất</a>
                                    <span>04/02/2022</span>
                                </p>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="wrapper_main">
                <table class="table">
					<thead>
						<tr>
							<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">image</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">Name</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Price</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Quantity</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Remove</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cart.cartItems }" var="ci">
							<tr class="${ci.productId}">
								<td scope="row" class="border-0">
									<div class="p-2">
									<c:forEach items="${productsList}" var="product">
										<c:if test="${product.title == ci.productName}">
		                    					<img src="${base}/upload/${product.avatar}" width="70px" class="img-fluid rounded shadow-sm">
										</c:if>
									</c:forEach>
									</div>
								</td>
								<td class="border-0 align-middle">
									<div class="ml-3 d-inline-block align-middle">
											<h5 class="mb-0">
											<c:forEach items="${productsList}" var="product">
												<c:if test="${product.title == ci.productName}">
													<a href="${base }/detail/${product.seo}" class="text-dark d-inline-block align-middle" style="font-size: 12px; text-decoration: none; color: #6a0a0b;">
														${ci.productName }
													</a>
												</c:if>
											</c:forEach>
											</h5>
											<c:forEach items="${category}" var="category">
												<c:forEach items="${productsList}" var="product">
													<c:if test="${product.title == ci.productName && product.categories.id == category.id}">
														<span class="text-muted font-weight-normal font-italic d-block">Category: ${category.name}</span>
													</c:if>
												</c:forEach>
											</c:forEach>
											
										</div>
								</td>
								<td class="border-0 align-middle">
									<strong style = "color:red;">
										<fmt:setLocale value="vi_VN" scope="session" />
                        				<fmt:formatNumber type="currency" value="${ci.priceUnit }"/>
                        			</strong>
								</td>
								<td class="border-0 align-middle">
									<button onclick="UpdateQuanlityCart('${base}', ${ci.productId}, -1)" value="-">-</button>
									<strong><span id="quanlity_${ci.productId}">${ci.quanlity }</span></strong>
									<button onclick="UpdateQuanlityCart('${base}', ${ci.productId}, 1)" value="+">+</button>
								</td>
								<td class="border-0 align-middle">
									<button onclick="DeleteCart('${base}', ${ci.productId}, ${ci.quanlity })">
										<i class="fa fa-trash"></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td><strong>Total Price</strong></td>
							<td colspan = 4><strong style = "color:red;" id="totalPrice">
								<fmt:setLocale value="vi_VN" scope="session" />
                        		<fmt:formatNumber type='currency' currencySymbol='VNĐ' value='${cart.totalPrice }'/></strong>
							</td>
						</tr>
					</tfoot>
				</table>
				<!-- form điền thông tin khách -->
				<form action="${base }/cart/checkout" method="post">
					<div class="row py-5 p-4 bg-white rounded shadow-sm">
						<div class="col-lg-6">
							<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold customerInfor">Thông tin khách hàng </div>
							<c:if test="${isLogined}">
										<div class="form-group">
											<label for="customerPhone">Tên khách hàng</label>
											<input type="text" class="form-control" id="customerFullName" value="${userLogined.username}" placeholder="Full name">
										</div>
										<div class="form-group">
											<label for="customerEmail">Email</label>
											<input type="email" class="form-control" id="customerEmail" value="${userLogined.email}" placeholder="Enter email">
										</div>
										<div class="form-group">
											<label for="customerPhone">Số điện thoại</label>
											<input type="tel" class="form-control" id="customerPhone" value="${userLogined.phone}" placeholder="Phone">
										</div>
										<div class="form-group">
											<label for="customerAddress">Địa chỉ nhận hàng</label>
											<input type="text" class="form-control" id="customerAddress" value="${userLogined.address}" placeholder="Address">
										</div>
							</c:if>
						</div>
						<div class="col-lg-6">
							<div
								class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order
								summary</div>
							<div class="p-4">
								<p class="font-italic mb-4">Shipping and additional costs are
									calculated based on values you have entered.</p>
								<ul class="list-unstyled mb-4">
									<li class="d-flex justify-content-between py-3 border-bottom"><strong
										class="text-muted">Order Subtotal </strong><strong id="totalPrice">${cart.totalPrice }</strong></li>
									<li class="d-flex justify-content-between py-3 border-bottom"><strong
										class="text-muted">Shipping and handling</strong><strong>$0.00</strong></li>
									<li class="d-flex justify-content-between py-3 border-bottom"><strong
										class="text-muted">Tax</strong><strong>$0.00</strong></li>
									<li class="d-flex justify-content-between py-3 border-bottom"><strong
										class="text-muted">Total</strong>
										<h5 class="font-weight-bold" id="totalPrice">${cart.totalPrice}</h5></li>
								</ul>
								<button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">Procceed to checkout</button>
							</div>
						</div>
					</div>
				</form>
				
         <!-- góc tư vấn nhà đẹp -->
         <div class="advise">
            <h1>GÓC TƯ VẤN NHÀ ĐẸP</h1>
            <div class="advise_news">
                <div class="advise_content">
                    <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                    <span class="material-icons">settings_ethernet</span>
                    <div class="content">
                        <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                        <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                        <p><a href="${base}#">XEM THÊM >></a></p>
                    </div>
                </div>
                <div class="advise_content">
                    <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                    <span class="material-icons">settings_ethernet</span>
                    <div class="content">
                        <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                        <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                        <p><a href="${base}#">XEM THÊM >></a></p>
                    </div>
                </div>
                <div class="advise_content">
                    <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                    <span class="material-icons">settings_ethernet</span>
                    <div class="content">
                        <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                        <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                        <p><a href="${base}#">XEM THÊM >></a></p>
                    </div>
                </div>
                <div class="advise_content">
                    <img src="${base}images/main/content/goc_tu_van/1.jpg" alt="">
                    <span class="material-icons">settings_ethernet</span>
                    <div class="content">
                        <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                        <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                        <p><a href="${base}#">XEM THÊM >></a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- //góc tư vấn nhà đẹp -->
        <!-- đối tác -->
        <div class="partner">
            <h1>ĐỐI TÁC CHIẾN LƯỢC</h1>
            <div class="partner_logo">
                <a href="${base}#"><img src="${base}images/main/content/don_vi_hop_tac/1.jpg" alt=""></a>
                <a href="${base}#"><img src="${base}images/main/content/don_vi_hop_tac/2.jpg" alt=""></a>
                <a href="${base}#"><img src="${base}images/main/content/don_vi_hop_tac/3.jpg" alt=""></a>
                <a href="${base}#"><img src="${base}images/main/content/don_vi_hop_tac/4.jpg" alt=""></a>
                <a href="${base}#"><img src="${base}images/main/content/don_vi_hop_tac/5.jpg" alt=""></a>
            </div>
        </div>
    </div>
    </div>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    </div>
    <!-- Core JS paging-->
		<script type="text/javascript">
		window.addEventListener("load", function(){
			const products = document.querySelectorAll(".product");
			
				$( document ).ready(function() {
				$("#paging").pagination({
					currentPage: ${products.currentPage},
			        items: products.length,
			        itemsOnPage:15,
			        cssStyle: 'light-theme', 
			        hrefTextPrefix: "?page=",
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
					},
			    });
				
			});
		})
		
		</script>
</body>

</html>