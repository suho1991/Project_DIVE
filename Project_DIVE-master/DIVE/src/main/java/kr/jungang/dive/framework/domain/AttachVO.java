package kr.jungang.dive.framework.domain;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import lombok.Data;

@Data
public class AttachVO {
	
	//uuid, uploadPath, fileName, fileType, ownerId, ownerType
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private long ownerId;
	private String ownerType;
	
	private String thumbnailHeader = AttachFileDTO.THUMBNAIL_HEADER;
	private char fileNameSeparatorUuid = AttachFileDTO.FILE_NAME_SEPARATOR_UUID;
	
	public String getOringinPathName() {
		return uploadPath + File.separator + uuid + fileNameSeparatorUuid + fileName;
	}
	
	public Path getOriginPath() {
		return Paths.get(uploadPath + File.separator + uuid + fileNameSeparatorUuid + fileName);
	}
	
	public String getThumbnailPathName() {
		return uploadPath + File.separator + thumbnailHeader + uuid + fileNameSeparatorUuid + fileName;
	}
	
	public Path getThumbnailPath() {
		return Paths.get( uploadPath + File.separator + thumbnailHeader + uuid + fileNameSeparatorUuid + fileName);
	}
}
