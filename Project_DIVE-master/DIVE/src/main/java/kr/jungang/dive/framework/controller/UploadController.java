package kr.jungang.dive.framework.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.jungang.dive.framework.domain.AttachFileDTO;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j2
@Controller
public class UploadController {

	private static final String UPLOAD_FOLDER = "C:\\productDive";

	@GetMapping("/displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> getThumbnailFile(String absoluteFileName) {
		File file = new File(absoluteFileName);
		ResponseEntity<byte[]> ret = null;
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			ret = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		for (MultipartFile aFile : uploadFile) {
			File saveFile = new File(UPLOAD_FOLDER, aFile.getOriginalFilename());
			try {
				aFile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String absoluteFileName) {
		File file = new File(absoluteFileName);
		Resource resource = new FileSystemResource(file);
		if (!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		String resourceOriginalName = resourceName.substring(resourceName.lastIndexOf("_") + 1);
		
		HttpHeaders header = new HttpHeaders();
		try {
			String downloadName = null;

			if (userAgent.contains("Trident")) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			} else if (userAgent.contains("Edge")) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			header.add("Content-Disposition",
					"attachment;filename=" + downloadName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
	

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFileAjax(String deleteTargetFileName, String delteTargetFileType) {
			try {
				File file = new File(URLDecoder.decode(deleteTargetFileName, "UTF-8"));
				file.delete();
				if(delteTargetFileType.equals("image")) {
					//c:\\upload\2020\05\12\s_6e108df6-42c7-4ba4-a64d-9829d7c0af4d_img_the_scream.jpg
					String absolutePath = file.getAbsolutePath();
					int lastIndex = absolutePath.lastIndexOf(File.separator);
					String prevPath = absolutePath.substring(0, lastIndex + 1); 
					String postPath = absolutePath.substring(lastIndex + 1 + AttachFileDTO.THUMBNAIL_HEADER.length());
					String originalAbsolutePath = prevPath + postPath;
					File originalFile = new File(originalAbsolutePath);
					originalFile.delete();
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	@PostMapping("/uploadAjaxAction")
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxAction(MultipartFile[] uploadFile) {
		List<AttachFileDTO> ret = new ArrayList<>();
		
		File uploadPath = new File(UPLOAD_FOLDER, getFolder());
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile aFile : uploadFile) {
			if (aFile.getSize() == 0)
				continue;
			String uploadFileName = extractLastFileName(aFile.getOriginalFilename());
			UUID uuid = UUID.randomUUID();
			File saveFile = new File(uploadPath, uuid.toString() + AttachFileDTO.FILE_NAME_SEPARATOR_UUID + uploadFileName);
			try {
				aFile.transferTo(saveFile);
				if (isImgType(saveFile)) {
					//이미지 파일의 경우에 썸네일 만들기
					File thumbnailFile = new File(uploadPath, AttachFileDTO.THUMBNAIL_HEADER + extractLastFileName(saveFile.getName()));
					FileOutputStream thumbnailOutStream = new FileOutputStream(thumbnailFile);
					//100, 100. 이미지 크기
					Thumbnailator.createThumbnail(aFile.getInputStream(), thumbnailOutStream, 150, 150);
					thumbnailOutStream.close();
					ret.add(new AttachFileDTO(uploadFileName, uploadPath.getAbsolutePath(), uuid.toString(), true));
				} else {
					ret.add(new AttachFileDTO(uploadFileName, uploadPath.getAbsolutePath(), uuid.toString(), false));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(ret, HttpStatus.OK);
	}

	private String extractLastFileName(String aFileName) {
		return aFileName.substring(aFileName.lastIndexOf("\\") + 1);
	}

	private String getFolder() {
		// File.separator : 운영체제 별 구분자가 다를 수 있다. 이식성(portability)이란 품질 속성에서 다루는 주제
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd");
		Date date = new Date();
		return sdf.format(date);
	}

	private boolean isImgType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
