package com.devpro.javaweb18.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb18.dto.OrderSearchModel;
import com.devpro.javaweb18.entities.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

	public PagerData<SaleOrder> search(OrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder so WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			if (searchModel.orderStatustId != null && searchModel.orderStatustId > 0) {
				sql += " and order_status_id = " + searchModel.orderStatustId;
			}
		
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (so.code like '%" + searchModel.keyword + "%'" + " or so.customer_name like '%"
						+ searchModel.keyword + "%'" + " or so.customer_phone like '%" + searchModel.keyword + " or so.customer_email like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());

	}
}
