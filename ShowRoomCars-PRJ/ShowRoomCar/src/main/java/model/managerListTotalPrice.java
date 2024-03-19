package model;

public class managerListTotalPrice {
	private int userID;
	private String name;
	private String phone;
	private String address;
	private String brand;
	private String model;
	private int quantity;
	private String price;
	private String nameUser;

	public managerListTotalPrice() {
		// TODO Auto-generated constructor stub
	}

	public managerListTotalPrice(int userID, String name, String phone, String address, String brand, String model,
			int quantity, String price, String nameUser) {
		super();
		this.userID = userID;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.brand = brand;
		this.model = model;
		this.quantity = quantity;
		this.price = price;
		this.nameUser = nameUser;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

}
