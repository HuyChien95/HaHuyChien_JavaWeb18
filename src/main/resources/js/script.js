function fixMenu() {
    // body...
    var getY = this.scrollY;
    if (130 < getY) {
        $(".header_menu").attr("style", "position: fixed; width: 100%; top: 0px;");
    } else {
        $(".header_menu").removeAttr("style");
    }
}

// sliderIMG

$(document).ready(function () {
    $(".images_slide").slick({
        dots: true,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 2000,
        useTransform: true
      });
// slider_product_hot
    $("#hot_products #wrapper_product").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        nextArrow: '<span class="material-icons .slick-next" id="next">chevron_right</span>',
        prevArrow: '<span class="material-icons .slick-prev" id="prev">chevron_left</span>',
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover: true
    });
    // slider_product_decor_light
    $("#decor_light #wrapper_product").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        nextArrow: '<span class="material-icons .slick-next" id="next">chevron_right</span>',
        prevArrow: '<span class="material-icons .slick-prev" id="prev">chevron_left</span>',
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover: true
    });
    // slider_product_decor_light
    $("#decor_funiture_products #wrapper_product").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        nextArrow: '<span class="material-icons .slick-next" id="next">chevron_right</span>',
        prevArrow: '<span class="material-icons .slick-prev" id="prev">chevron_left</span>',
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover: true
    });
    /*slider_detail*/
    $(".slider_for").slick({
		infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        nextArrow: '<span class="material-icons .slick-next" id="next">chevron_right</span>',
        prevArrow: '<span class="material-icons .slick-prev" id="prev">chevron_left</span>',
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover: true,
		asNavFor: '.slider_nav'
	});
	$(".slider_nav").slick({
		slidesToShow: 5,
		slidesToScroll: 1,
		asNavFor: '.slider_for',
		pauseOnHover: true,
		arrows:false,
		centerMode: true,
		dots: false,
		focusOnSelect: true
	});
})

// Thêm sản phẩm vào trong giỏ hàng
function AddToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // Id sản phẩm
		quanlity: quanlity, // Số lượng cho vào giỏ hàng
	};
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			
			/*$([document.documentElement, document.body]).animate({
			    scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

// Cập nhật số lượng sản phẩm trong giỏ hàng
function UpdateQuanlityCart(baseUrl, productId, quanlity) {
	
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id	
		quanlity: quanlity
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQuanlityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quanlity_" + productId ).html(jsonResult.currentProductQuality);
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			$("#totalPrice").html(jsonResult.totalPrice.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
			if(jsonResult.currentProductQuality==0){
				window.location.reload();
			}
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

// Xóa sản phẩm trong giỏ hàng
function DeleteCart(baseUrl, productId) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id	
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/deleteCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// giảm số lượng sản phẩm trong giỏ hàng trong icon
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			window.location.reload();
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

/*cap nhat order status*/
function orderStatus(baseUrl, orderId){
	alert("ok");
}
