package com.atguigu.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class MyUploadUtil {

	public static List<String> upload_image(MultipartFile[] files) {

		List<String> list_img = new ArrayList<>();

		String path = MyPropertiesUtil.getMyProperties("upload.peoperties", "windows_path");
		for (int i = 0; i < files.length; i++) {
			if (!files[i].isEmpty()) {
				String originalFilename = files[i].getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				String filename = uuid + originalFilename;

				list_img.add(filename);
				try {
					files[i].transferTo(new File(path + "/" + filename));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return list_img;
	}
}