package com.planit.backend.service;

import java.util.List;
import java.util.Map;

public interface PhotoBookService {
	
	List<PhotoBookDTO> selectPhotoList(Map map);

	int getTotalCount(Map map);

}
