<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${categorySeo.name}</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css2.jsp"></jsp:include>
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
                <p>${fn:toUpperCase(categorySeo.name)}</p>
                <div class="wrapper_products">
                	<form class="form-inline" action="${base }/productlist/${categorySeo.seo}" method="get">
                	<input type="hidden" id="page" name="page" class="form-control">
		                <c:forEach items="${productView.data}" var="product">
		                	<div class="product" id="product">
		                        <img src="${base}/upload/${product.avatar}" alt="">
		                        <p><a href="${base}/detail/${product.seo}">${product.title}</a></p>
		                        <p id="price">
		                        <fmt:setLocale value="vi_VN" scope="session" />
		                        <fmt:formatNumber type="currency" value="${product.price}" />
		                        </p>
		                        <button type="button" id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">Thêm vào giỏ</button>
			                 </div>
		                </c:forEach>
	                </form>
                <!-- Paging -->
			<div class="row">
				<div class="col-12 d-flex justify-content-center" style="margin-top: 1.625rem">
					<div id="paging"></div>
				</div>
			</div>
        </div>
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
        <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    <!-- Core JS paging-->
		<script type="text/javascript">	
				$(document).ready(function() {
				$("#paging").pagination({
					currentPage: ${productView.currentPage},
			        items: ${productView.totalItems},
			        itemsOnPage: 6,
			        cssStyle: 'light-theme',
			        hrefTextPrefix: "?page=",
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
					},
			    });
				
			});
		
		</script>
</body>

</html>