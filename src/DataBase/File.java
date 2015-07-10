package DataBase;

// Generated 2015-6-24 20:13:35 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * File generated by hbm2java
 */
public class File implements java.io.Serializable {
	public static final int SUCCESS=1;
	public static final int NODEAL=0;
	public static final int FAIL=-1;
	
	private Integer id;
	private String filename;
	private String pdfpath;
	private String htmlpath;
	private Date time;
	private int status;
	private Set<FileCompany> fileCompanies = new HashSet<FileCompany>(0);
	private Set<FileTag> fileTags = new HashSet<FileTag>(0);

	public File() {
	}

	public File(String filename, String pdfpath, Date time, int status) {
		this.filename = filename;
		this.pdfpath = pdfpath;
		this.time = time;
		this.status = status;
	}

	public File(String filename, String pdfpath, String htmlpath, Date time,
			int status, Set<FileCompany> fileCompanies, Set<FileTag> fileTags) {
		this.filename = filename;
		this.pdfpath = pdfpath;
		this.htmlpath = htmlpath;
		this.time = time;
		this.status = status;
		this.fileCompanies = fileCompanies;
		this.fileTags = fileTags;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getPdfpath() {
		return this.pdfpath;
	}

	public void setPdfpath(String pdfpath) {
		this.pdfpath = pdfpath;
	}

	public String getHtmlpath() {
		return this.htmlpath;
	}

	public void setHtmlpath(String htmlpath) {
		this.htmlpath = htmlpath;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Set<FileCompany> getFileCompanies() {
		return this.fileCompanies;
	}

	public void setFileCompanies(Set<FileCompany> fileCompanies) {
		this.fileCompanies = fileCompanies;
	}

	public Set<FileTag> getFileTags() {
		return this.fileTags;
	}

	public void setFileTags(Set<FileTag> fileTags) {
		this.fileTags = fileTags;
	}

}