package model;

//CartItem.java (đại diện cho một mục trong giỏ hàng)
public class CartItem {
	private int id;
	private String userName;
	private String brand;
	private String model;
	private Double price;
	private String image;
	private int quantity;
	public CartItem() {
		// TODO Auto-generated constructor stub
	}
	public CartItem(int id, String userName, String brand, String model, Double price, String image, int quantity) {
		super();
		this.id = id;
		this.userName = userName;
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
