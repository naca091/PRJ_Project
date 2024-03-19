package model;

public class Car {
	private int id;
	private String brand;
	private String model;
	private double price;
	private String imageUrl;
	private int quantity;
	private boolean isPurchased;
	private int TopSpeed;
	private double Acceleration;
	private int MaxHorsepower;
	public Car() {

	}
	
	public Car(String brand, String model, double price, String imageUrl) {
		super();
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.imageUrl = imageUrl;
	}

	public Car(int id, String brand, String model, double price, String imageUrl, int quantity, boolean isPurchased) {
		super();
		this.id = id;
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.imageUrl = imageUrl;
		this.quantity = quantity;
		this.isPurchased = isPurchased;
	}
	public Car(int id, String brand, String model, double price, String imageUrl, int quantity) {
		super();
		this.id = id;
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.imageUrl = imageUrl;
		this.quantity = quantity;
	}
	public Car(int id, String brand, String model, double price, String imageUrl) {
		super();
		this.id = id;
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.imageUrl = imageUrl;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean getIsPurchased() {
		return isPurchased;
	}
	
	public void setIsPurchased(boolean isPurchased) {
		this.isPurchased = isPurchased;
	}

	public int getTopSpeed() {
		return TopSpeed;
	}

	public void setTopSpeed(int topSpeed) {
		TopSpeed = topSpeed;
	}

	public double getAcceleration() {
		return Acceleration;
	}

	public void setAcceleration(double acceleration) {
		Acceleration = acceleration;
	}

	public int getMaxHorsepower() {
		return MaxHorsepower;
	}

	public void setMaxHorsepower(int maxHorsepower) {
		MaxHorsepower = maxHorsepower;
	}

	public void setPurchased(boolean isPurchased) {
		this.isPurchased = isPurchased;
	}
	
	
}