package DataBase;

// Generated 2015-6-18 23:48:40 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Company generated by hbm2java
 */
public class Company implements java.io.Serializable {

	private Integer id;
	private String num;
	private String name;
	private String kind;
	private String trade;
	private Set<FileCompany> fileCompanies = new HashSet<FileCompany>(0);

	public Company() {
	}

	public Company(String num, String name) {
		this.num = num;
		this.name = name;
	}

	public Company(String num, String name, String kind, String trade,
			Set<FileCompany> fileCompanies) {
		this.num = num;
		this.name = name;
		this.kind = kind;
		this.trade = trade;
		this.fileCompanies = fileCompanies;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKind() {
		return this.kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getTrade() {
		return this.trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public Set<FileCompany> getFileCompanies() {
		return this.fileCompanies;
	}

	public void setFileCompanies(Set<FileCompany> fileCompanies) {
		this.fileCompanies = fileCompanies;
	}

}
