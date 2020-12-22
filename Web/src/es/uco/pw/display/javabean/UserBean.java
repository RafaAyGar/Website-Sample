package es.uco.pw.display.javabean;

public class UserBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String name;
	private String surNames;
	private String birthDate;
	private String interests;
	
	private String emailUser = "";
	private String password;

	public UserBean() {	}
	
	public String getEmailUser() {
		return emailUser;
	}
	
	public void setEmailUser(String newEmail)
	{
		emailUser = newEmail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurNames() {
		return surNames;
	}

	public void setSurNames(String surNames) {
		this.surNames = surNames;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getInterests() {
		return interests;
	}

	public void setInterests(String interests) {
		this.interests = interests;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
