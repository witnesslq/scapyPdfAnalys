package DataBase;

// Generated 2015-6-24 20:13:35 by Hibernate Tools 3.4.0.CR1

/**
 * User generated by hbm2java
 */
public class User implements java.io.Serializable {

	private Integer id;
	private String account;
	private String passwd;
	private String name;
	private int auth;
	private int status;
	private String qq;
	private String phone;
	private String email;

	public User() {
	}

	public User(String account, String passwd, String name, int auth, int status) {
		this.account = account;
		this.passwd = passwd;
		this.name = name;
		this.auth = auth;
		this.status = status;
	}

	public User(String account, String passwd, String name, int auth,
			int status, String qq, String phone, String email) {
		this.account = account;
		this.passwd = passwd;
		this.name = name;
		this.auth = auth;
		this.status = status;
		this.qq = qq;
		this.phone = phone;
		this.email = email;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAuth() {
		return this.auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
