package com.devpro.javaweb18.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb18.dto.AdvisoriesDataPageModel;
import com.devpro.javaweb18.entities.Advisories;
import com.github.slugify.Slugify;

@Service
public class AdvisoriesService extends BaseService<Advisories>{

	@Override
	protected Class<Advisories> clazz(){
		return Advisories.class;
	}
	
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	@Transactional
	public Advisories add(Advisories ad, MultipartFile advisoryAvatar)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(advisoryAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = "C:/upload/advisories/avatar/" + advisoryAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			advisoryAvatar.transferTo(new File(pathToFile));

			ad.setAvatar("advisories/avatar/" + advisoryAvatar.getOriginalFilename());
		}

		// tạo seo
		ad.setSeo(new Slugify().slugify(ad.getTitle() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(ad);
	}
	
	@Transactional
	public Advisories update(Advisories ad, MultipartFile advisoryAvatar)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Advisories adInDb = super.getById(ad.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(advisoryAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/" + adInDb.getAvatar()).delete();

			// add avartar moi
			advisoryAvatar.transferTo(new File("C:/upload/advisories/avatar/" + advisoryAvatar.getOriginalFilename()));
			ad.setAvatar("advisories/avatar/" + advisoryAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			ad.setAvatar(adInDb.getAvatar());
		}

		// tạo seo
		ad.setSeo(new Slugify().slugify(ad.getTitle() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(ad);
	}
	
//	page data
	public PagerData<Advisories> search(AdvisoriesDataPageModel advisoryModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_advisory ad WHERE 1=1";

		if (advisoryModel != null) {
			// tìm kiếm theo category
			if (advisoryModel.categoryId != null && advisoryModel.categoryId > 0) {
				sql += " and category_id = " + advisoryModel.categoryId;
			}
		}
			// tìm kiếm theo categoryParent
			if (advisoryModel.categoryParentId != null && advisoryModel.categoryParentId > 0) {
				sql += " AND category_id = ANY (SELECT id FROM tbl_category WHERE parent_id = " + advisoryModel.categoryParentId + " )";}

				sql += " and ad.status=1 ";
				return executeByNativeSQL(sql, advisoryModel == null ? 0 : advisoryModel.getPage());

			}

}
