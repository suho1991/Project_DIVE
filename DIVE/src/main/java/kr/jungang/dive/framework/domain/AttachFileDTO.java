package kr.jungang.dive.framework.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	public static final String THUMBNAIL_HEADER = "s_";
	public static final char FILE_NAME_SEPARATOR_UUID = '_';
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	
	private String thumbnailHeader = THUMBNAIL_HEADER;
	private char fileNameSeparatorUuid = FILE_NAME_SEPARATOR_UUID;
	
	public AttachFileDTO(String fileName, String uploadPath, String uuid, boolean image) {
		this.fileName = fileName;
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.image = image;
	}
	
	
}
