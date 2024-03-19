package model;

public class UserInfo {
	private int id;
	private String name;
	private String phone;
	private String address;
	private String brand;
	private String model;
	private String user;

	public UserInfo(int id, String name, String phone, String address, String brand, String model, String user) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.brand = brand;
		this.model = model;
		this.user = user;
	}

	public UserInfo(String name, String phone, String address) {
		this.name = name;
		this.phone = phone;
		this.address = address;
	}

	public UserInfo(String name, String phone, String address, String brand, String model) {
		super();
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.brand = brand;
		this.model = model;
	}

	public UserInfo(String name, String phone, String address, String brand, String model, String user) {
		super();
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.brand = brand;
		this.model = model;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	// Add getters and setters as needed
}
