package model;

public class User {
	private int userId;
	private String username;
	private String email;
	private String password;
	private String role;
	private String fullName;
    private String phone;
    private String address;
	// Getters and setters
	public User() {

	}
	
	public User(int userId, String username, String email, String password, String role, String fullName, String phone,
			String address) {
		super();
		this.userId = userId;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role = role;
		this.fullName = fullName;
		this.phone = phone;
		this.address = address;
	}

	public User(int userId, String username, String email, String password, String role) {
		super();
		this.userId = userId;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role = role;
	}
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
