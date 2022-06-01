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
    <title>${product.title}</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css3.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</head>

<body onscroll="fixMenu()">
    <div class="wrapper">
        <!-- header -->
        <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
        <!-- //header -------------------->
        <div class="folder_tree">
        	
            <p class="material-icons">home</p>
            <p><a href="${base}/home">Trang Chủ</a></p>
            <p>/</p>
            <c:forEach items = "${categoryParent }" var = "cateParent">
        	<c:forEach items = "${categoryChild }" var = "cateChild">
            <c:if test="${product.categories.id == cateChild.id && cateChild.parent.id == cateParent.id}">
            <p><a href="${base}/productslist/${cateParent.seo}">${cateParent.name}</a></p>
            </c:if>
            </c:forEach>
            </c:forEach>
            <p>/</p>
            <c:forEach items = "${categoryChild }" var = "cateChild">
            <c:if test="${product.categories.id == cateChild.id }">
            <p><a href="${base}/productslist/${cateChild.seo}">${cateChild.name}</a></p>
            </c:if>
            </c:forEach>
            <p>/</p>
            <p id="subfolder"><a href="${base}/detail/${product.seo}">${product.title}</a></p>
            
        </div>
        <!-- wrapper_main -->
        <div class="wrapper_main">
            <div class="introduce">
                <div class="product_img">
                    <div class="images slider_for">
                    <c:forEach items="${product.productImages}" var="product">
                    	<img src="${base}/upload/${product.path}">
                    </c:forEach>
                    </div>
                    <div class="thumb slider_nav">
                    <c:forEach items="${product.productImages}" var="product">
                    	<img src="${base}/upload/${product.path}">
                    </c:forEach>
                    </div>
                </div>
                <div class="product_order">
                    <p id="name">${product.title}</p>
                    <p id="information">${product.shortDes}</p>
                    <p id="price">Giá Sản Phẩm: <span>
                    	<fmt:setLocale value="vi_VN" scope="session" />
                        <fmt:formatNumber type="currency" value="${product.price}"/></span></p>
                    <div class="button_order">
                        <button id="add_cart" onclick="AddToCart('${base}', ${product.id}, 1)">THÊM VÀO GIỎ</button>
                        <button id="order">MUA HÀNG</button>
                    </div>
                    <div class="box">
                        <div class="sub_box">
                            <span class="material-icons">task_alt</span>
                            <p>Cam kết chất lượng</p>
                        </div>
                        <div class="sub_box">
                            <span class="material-icons">local_shipping</span>
                            <p>Giao hàng miễn phí</p>
                        </div>
                        <div class="sub_box">
                            <span class="material-icons">payments</span>
                            <p>Thanh toán tại nhà</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- chi tiết sản phẩm -->
            <div class="wrapper_product_detail">
                <div class="product_detail">
                    <div class="detail">
                        <p>THÔNG TIN CHI TIẾT</p>
                        <div class="description">
                            ${product.details}
                        </div>
                    </div>
                    <div class="like_shared">
                        <button id="like">
                            <span class="material-icons">thumb_up</span>
                            Thích 0
                        </button>
                        <button>Chia sẻ</button>
                    </div>
                    <div class="comment_arrange">
                        <p id="comment_count">0 bình luận</p>
                        <div>
                            <p>Sắp xếp theo:</p>
                            <select name="arrange" id="arrange">
                                <option value="">Cũ nhất</option>
                                <option value="">Mới nhất</option>
                            </select>
                        </div>
                    </div>
                    <div class="avatar_comment_text">
                        <div class="avatar">avatar</div>
                        <div class="text_btn">
                            <input type="text" id="commenr_text">
                            <button>Đăng</button>
                        </div>
                    </div>
                </div>
                <div class="right">
                    <div class="why">
                        <p>TẠI SAO LỰA CHỌN CHÚNG TÔI</p>
                        <ul>
                            <li>
                                <span class="material-icons">verified</span>
                                <p>Đồ decor trang trí nhà cửa, tư vấn cách chọn đồ decor cho các phong cách nội thất</p>
                            </li>
                            <li>
                                <span class="material-icons">recommend</span>
                                <p>Đèn trang trí nội thất giá tốt, chiết khấu cao, bảo hành dài hạn</p>
                            </li>
                            <li>
                                <span class="material-icons">groups</span>
                                <p>Đèn trang trí phòng khách hiện đại - trẻ trung</p>
                            </li>
                            <li>
                                <span class="material-icons">light_mode</span>
                                <p>Đèn chùm pha lê trang trí phòng khách, đèn thả pha lê cao cấp</p>
                            </li>
                        </ul>
                    </div>
                    <div class="hot_product">
                        <p>SẢN PHẨM NỔI BẬT</p>
                        <ul>
                            <li>
                                <a href="${base}/#"><img src="${base}/images/main/content/goc_tu_van/1.jpg" alt=""></a>
                                <p><a href="${base}/#">Đồ decor trang trí nhà cửa, tư vấn cách chọn đồ decor cho các phong cách nội thất</a></p>
                            </li>
                            <li>
                                <a href="${base}/#"><img src="${base}/images/main/content/goc_tu_van/1.jpg" alt=""></a>
                                <p><a href="${base}/#">Đồ decor trang trí nhà cửa, tư vấn cách chọn đồ decor cho các phong cách nội thất</a></p>
                            </li>
                            <li>
                                <a href="${base}/#"><img src="${base}/images/main/content/goc_tu_van/1.jpg" alt=""></a>
                                <p><a href="${base}/#">Đồ decor trang trí nhà cửa, tư vấn cách chọn đồ decor cho các phong cách nội thất</a></p>
                            </li>
                            <li>
                                <a href="${base}/#"><img src="${base}/images/main/content/goc_tu_van/1.jpg" alt=""></a>
                                <p><a href="${base}/#">Đồ decor trang trí nhà cửa, tư vấn cách chọn đồ decor cho các phong cách nội thất</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- decor_funiture -->
            <div class="warraper_products">
                <p id="title">SẢN PHẨM LIÊN QUAN</p>
                <div class="products">
                    <div>
                        <a href="${base}/chitiet"><img src="${base}/images/main/content/Tranh_sat/1.jpg" alt=""></a>
                        <p id="name_product"><a href="${base}/chitiet">Trang decor trang trí treo tường TS 958</a></p>
                        <p id="price">3.800.000</p>
                    </div> 
                    <div>
                        <a href="${base}/chitiet"><img src="${base}/images/main/content/Tranh_sat/1.jpg" alt=""></a>
                        <p id="name_product"><a href="${base}/chitiet">Trang decor trang trí treo tường TS 958</a></p>
                        <p id="price">3.800.000</p>
                    </div> 
                    <div>
                        <a href="${base}/chitiet"><img src="${base}/images/main/content/Tranh_sat/1.jpg" alt=""></a>
                        <p id="name_product"><a href="${base}/chitiet">Trang decor trang trí treo tường TS 958</a></p>
                        <p id="price">3.800.000</p>
                    </div> 
                    <div>
                        <a href="${base}/chitiet"><img src="${base}/images/main/content/Tranh_sat/1.jpg" alt=""></a>
                        <p id="name_product"><a href="${base}/chitiet">Trang decor trang trí treo tường TS 958</a></p>
                        <p id="price">3.800.000</p>
                    </div> 
                    <span class="material-icons" id="prev">chevron_left</span>
                    <span class="material-icons" id="next">chevron_right</span>
                </div>
            </div>
            <!-- decor_funiture_watched -->
            <div class="warraper_products">
                <p id="title">SẢN PHẨM ĐÃ XEM</p>
                <div class="products">
                    <div>
                        <a href="${base}/chitiet"><img src="${base}/images/main/content/Tranh_sat/1.jpg" alt=""></a>
                        <p id="name_product"><a href="${base}/chitiet">Trang decor trang trí treo tường TS 958</a></p>
                        <p id="price">3.800.000</p>
                    </div> 
                    <div>
                        <a href="${base}/chitiet"><img src="${base}/images/main/content/Tranh_sat/1.jpg" alt=""></a>
                        <p id="name_product"><a href="${base}/chitiet">Trang decor trang trí treo tường TS 958</a></p>
                        <p id="price">3.800.000</p>
                    </div> 
                    <div>
                        <a href="${base}/chitiet"><img src="${base}/images/main/content/Tranh_sat/1.jpg" alt=""></a>
                        <p id="name_product"><a href="${base}/chitiet">Trang decor trang trí treo tường TS 958</a></p>
                        <p id="price">3.800.000</p>
                    </div> 
                    <div>
                        <a href="${base}/chitiet"><img src="${base}/images/main/content/Tranh_sat/1.jpg" alt=""></a>
                        <p id="name_product"><a href="${base}/chitiet">Trang decor trang trí treo tường TS 958</a></p>
                        <p id="price">3.800.000</p>
                    </div> 
                    <span class="material-icons" id="prev">chevron_left</span>
                    <span class="material-icons" id="next">chevron_right</span>
                </div>
            </div>
            <!-- góc tư vấn nhà đẹp -->
        <div class="advise">
            <h1>GÓC TƯ VẤN NHÀ ĐẸP</h1>
            <div class="advise_news">
                <div class="advise_content">
                    <img src="${base}/images/main/content/goc_tu_van/1.jpg" alt="">
                    <span class="material-icons">settings_ethernet</span>
                    <div class="content">
                        <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                        <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                        <p><a href="${base}/#">XEM THÊM >></a></p>
                    </div>
                </div>
                <div class="advise_content">
                    <img src="${base}/images/main/content/goc_tu_van/1.jpg" alt="">
                    <span class="material-icons">settings_ethernet</span>
                    <div class="content">
                        <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                        <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                        <p><a href="${base}/#">XEM THÊM >></a></p>
                    </div>
                </div>
                <div class="advise_content">
                    <img src="${base}/images/main/content/goc_tu_van/1.jpg" alt="">
                    <span class="material-icons">settings_ethernet</span>
                    <div class="content">
                            <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                            <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                            <p><a href="${base}/#">XEM THÊM >></a></p>
                        </div>
                    </div>
                    <div class="advise_content">
                        <img src="${base}/images/main/content/goc_tu_van/1.jpg" alt="">
                        <span class="material-icons">settings_ethernet</span>
                        <div class="content">
                            <p id="advise_title">Cung Cấp Lò Sưởi Trang Trí, Lò Sưởi Giả Mẫu Mã Đẹp, Đa Dạng Kích Thước</p>
                            <p id="in_content">Kiến trúc sư trực tiếp tư vấn thiết kế sẽ có con mắt nhìn đảm bảo tính hài hòa cho bố cục. Vì thế, họ sẽ đưa ra lựa chọn tốt nhất về sản phẩm cho gia chủ. Theo đó, người kiến trúc sư vừa nắm bắt giá thành, tâm lý chủ nhà và chế độ bán hàng sẽ có thể mua được hàng với mức giá hợp lý.</p>
                            <p><a href="${base}/#">XEM THÊM >></a></p>
                        </div>
                    </div>
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
        <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    </div>
</body>

</html>