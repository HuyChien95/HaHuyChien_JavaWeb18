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
    <title>Trang Chủ</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</head>
<body onscroll="fixMenu()">
    <div class="wrapper">
        <!-- header -->
        <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
        <!-- //header -------------------->
        <!-- slide ------------------->
        <div class="images_slide_container" id="images_slide">
            <div class="images_slide">
                <img src="${base}/images/main/slide/aaa.jpg" id="slider_item_1" class="slider_item">
                <img src="${base}/images/main/slide/bbb.jpg" id="slider_item_2" class="slider_item">
                <img src="${base}/images/main/slide/ccc.jpg" id="slider_item_3" class="slider_item">
                <img src="${base}/images/main/slide/ddd.jpg" id="slider_item_4" class="slider_item">
            </div>
        </div>
        <!-- //slide ------------------->
        <!-- slogan -->
        <div class="slogan"><img src="${base}/images/main/slogan/slogan.jpg" alt=""></div>
        <!-- //slogan -->
        <!-- hot_product -->
        <div class="warraper_products">
            <div class="text_product">
                <p>SẢN PHẨM BÁN CHẠY</p>
                <img src="images/main/content/arrow_head.jpg" alt="">
            </div>
            <div class="products" id="hot_products">
                <div class="wrapper_product" id="wrapper_product">
                	<c:forEach items="${product}" var="product">
	                	<c:if test="${product.isHot }">
		                    <div id="start_slide" class="slide-item">
		                        <a href="${base}/detail/${product.seo}"><img src="${base}/upload/${product.avatar}" alt=""></a>
		                        <p id="name_product"><a href="${base}/detail/${product.seo}">${product.title}</a></p>
		                        <p id="peace"><fmt:formatNumber type="currency" value="${product.price}" /></p>
		                        <button id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">Thêm vào giỏ</button>
		                    </div>
	                    </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- //hot_product -->
        <!-- decor_light -->
        <div class="warraper_products">
            <div class="text_product">
                <p>ĐÈN TRANG TRÍ</p>
                <img src="${base}/images/main/content/arrow_head.jpg" alt="">
            </div>
            <div class="products" id="decor_light">
                <div class="wrapper_product" id="wrapper_product">
                <c:choose>
                	<c:when test="${productSize > 15}">
                		<c:forEach items="${product}" var="product" begin="${productSize - 15}">
				            <c:if test="${product.categories.parent.id == 40}">
			                    <div class="slide-item">
			                        <a href="${base}/detail/${product.seo}"><img src="${base}/upload/${product.avatar}" alt=""></a>
			                        <p id="name_product"><a href="${base}/detail/${product.seo}">${product.title}</a></p>
			                        <p id="peace"><fmt:formatNumber type="currency" value="${product.price}" /></p>
			                        <button id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">Thêm vào giỏ</button>
			                    </div> 
			                </c:if>
                		</c:forEach>     
                	</c:when>
                	<c:otherwise>
                		<c:forEach items="${product}" var="product">
				            <c:if test="${product.categories.parent.id == 40}">
			                    <div class="slide-item">
			                        <a href="${base}/detail/${product.seo}"><img src="${base}/upload/${product.avatar}" alt=""></a>
			                        <p id="name_product"><a href="${base}/detail/${product.seo}">${product.title}</a></p>
			                        <p id="peace"><fmt:formatNumber type="currency" value="${product.price}" /></p>
			                        <button id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">Thêm vào giỏ</button>
			                    </div> 
			                </c:if>
                		</c:forEach>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <c:forEach items="${category}" var="category">
	            <c:if test="${category.id == 40}">
	            	<p><a href="${base}/productslist/${category.seo}">Xem Tất Cả >></a></p>
	            </c:if>
            </c:forEach>
        </div>
        <!-- decor_light -->
        <!-- decor_funiture -->
        <div class="warraper_products">
            <div class="text_product">
                <p>ĐỒ TRANG TRÍ NỘI THẤT</p>
                <img src="${base}/images/main/content/arrow_head.jpg" alt="">
            </div>
            <div class="products" id="decor_funiture_products">
                <div class="wrapper_product" id="wrapper_product">
                    <c:choose>
                	<c:when test="${productSize > 15}">
                		<c:forEach items="${product}" var="product" begin="${productSize - 15}">
				            <c:if test="${product.categories.parent.id == 41}">
			                    <div class="slide-item">
			                        <a href="${base}/detail/${product.seo}"><img src="${base}/upload/${product.avatar}" alt=""></a>
			                        <p id="name_product"><a href="${base}/detail/${product.seo}">${product.title}</a></p>
			                        <p id="peace"><fmt:formatNumber type="currency" value="${product.price}" /></p>
			                        <button id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">Thêm vào giỏ</button>
			                    </div> 
			                </c:if>
                		</c:forEach>     
                	</c:when>
                	<c:otherwise>
                		<c:forEach items="${product}" var="product">
				            <c:if test="${product.categories.parent.id == 41}">
			                    <div class="slide-item">
			                        <a href="${base}/detail/${product.seo}"><img src="${base}/upload/${product.avatar}" alt=""></a>
			                        <p id="name_product"><a href="${base}/detail/${product.seo}">${product.title}</a></p>
			                        <p id="peace"><fmt:formatNumber type="currency" value="${product.price}" /></p>
			                        <button id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">Thêm vào giỏ</button>
			                    </div> 
			                </c:if>
                		</c:forEach>
                	</c:otherwise>
                </c:choose>
            	</div>
            <c:forEach items="${category}" var="category">
	            <c:if test="${category.id == 41}">
	            	<p><a href="${base}/productslist/${category.seo}">Xem Tất Cả >></a></p>
	            </c:if>
            </c:forEach>
        </div>
        <!-- decor_funiture -->
        <!-- TABLE_CHAIR -->
        <div class="warraper_products">
            <div class="text_product">
                <p>BÀN GHẾ</p>
                <img src="${base}/images/main/content/arrow_head.jpg" alt="">
            </div>
            <div class="products" id="table_chair_products">
                <div class="wrapper_product" id="wrapper_product">
                    <c:forEach items="${product}" var="product">
		                <c:forEach items="${categoryChild}" var="child">
				            <c:if test="${child.parent.id == 42 && child.id == product.categories.id}">
			                    <div class="slide-item">
			                        <a href="${base}/detail/${product.seo}"><img src="${base}/upload/${product.avatar}" alt=""></a>
			                        <p id="name_product"><a href="${base}/detail/${product.seo}">${product.title}</a></p>
			                        <p id="peace"><fmt:formatNumber type="currency" value="${product.price}" /></p>
			                        <button id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">Thêm vào giỏ</button>
			                    </div> 
			                </c:if>
		                </c:forEach>
                	</c:forEach> 
            	</div>
            <c:forEach items="${category}" var="category">
	            <c:if test="${category.id == 42}">
	            	<p><a href="${base}/productslist/${category.seo}">Xem Tất Cả >></a></p>
	            </c:if>
            </c:forEach>
        </div>
        <!-- //TABLE_CHAIR -->
        <!-- ĐỒ PHONG THỦY -->
        <div class="warraper_products">
            <div class="text_product">
                <p>ĐỒ PHONG THỦY</p>
                <img src="${base}/images/main/content/arrow_head.jpg" alt="">
            </div>
            <div class="products" id="pt_products">
                <div class="wrapper_product" id="wrapper_product">
                    <c:forEach items="${product}" var="product">
		                <c:forEach items="${categoryChild}" var="child">
				            <c:if test="${child.parent.id == 43 && child.id == product.categories.id}">
			                    <div class="slide-item">
			                        <a href="${base}/detail/${product.seo}"><img src="${base}/upload/${product.avatar}" alt=""></a>
			                        <p id="name_product"><a href="${base}/detail/${product.seo}">${product.title}</a></p>
			                        <p id="peace"><fmt:formatNumber type="currency" value="${product.price}" /></p>
			                        <button id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">Thêm vào giỏ</button>
			                    </div> 
			                </c:if>
		                </c:forEach>
                	</c:forEach> 
            	</div>
            <c:forEach items="${category}" var="category">
	            <c:if test="${category.id == 43}">
	            	<p><a href="${base}/productslist/${category.seo}">Xem Tất Cả >></a></p>
	            </c:if>
            </c:forEach>
        </div>
        <!-- //ĐỒ PHONG THỦY -->
        <!-- góc tư vấn nhà đẹp -->
        <div class="advisory">
            <h1>GÓC TƯ VẤN NHÀ ĐẸP</h1>
            <div class="advisories_news">
                <c:forEach items = "${advisories}" var = "advisory">
                    <div class="advisory_content">
                        <img src="${base}/images/main/content/goc_tu_van/1.jpg" alt="">
                        <span class="material-icons">settings_ethernet</span>
                        <div class="content">
                            <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                            <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                            <p><a href="${base}/#">XEM THÊM >></a></p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- //góc tư vấn nhà đẹp -->
        <!-- đối tác -->
        <div class="partner">
            <h1>ĐỐI TÁC CHIẾN LƯỢC</h1>
            <div class="partner_logo">
                <a href="${base}/#"><img src="${base}/images/main/content/don_vi_hop_tac/1.jpg" alt=""></a>
                <a href="${base}/#"><img src="${base}/images/main/content/don_vi_hop_tac/2.jpg" alt=""></a>
                <a href="${base}/#"><img src="${base}/images/main/content/don_vi_hop_tac/3.jpg" alt=""></a>
                <a href="${base}/#"><img src="${base}/images/main/content/don_vi_hop_tac/4.jpg" alt=""></a>
                <a href="${base}/#"><img src="${base}/images/main/content/don_vi_hop_tac/5.jpg" alt=""></a>
            </div>
        </div>
        </div>
        </div>
        </div>
        <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    </div>
</body>
</html>