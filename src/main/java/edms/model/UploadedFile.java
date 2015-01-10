package edms.model;


import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class UploadedFile {
	
	private List<MultipartFile> filedata;
	public List<MultipartFile> getFiledata() {
		return filedata;
	}
	public void setFiledata(List<MultipartFile> filedata) {
		this.filedata = filedata;
	}
	
	/*
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiledetails() {
		return filedetails;
	}
	public void setFiledetails(String filedetails) {
		this.filedetails = filedetails;
	}


	//@NotEmpty(message="{NotEmpty.uploadedFile.albumname}")
	//@NotBlank(message="{NotBlank.uploadedFile.albumname}")
	private String filename;
	private String filedetails;*/

	
}
