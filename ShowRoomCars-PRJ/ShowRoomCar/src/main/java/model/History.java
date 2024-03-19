package model;

public class History {
    private int purchaseId;
    private String userName;
    private String phone;
    private String address;
    private String brand;
    private String model;
    private int currentQuantity;
    private boolean isPurchased;
    private double price;
    private String name;
    private String imageUrl;
    private double totalPrice;

    public History() {
        // Default constructor
    }
    
    public History(int purchaseId ,String userName, String name, String phone, String address, String brand, String model,
			int currentQuantity, boolean isPurchased, double price, String imageUrl, double totalPrice) {
		super();
		this.userName = userName;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.brand = brand;
		this.model = model;
		this.currentQuantity = currentQuantity;
		this.price = price;
		this.imageUrl = imageUrl;
		this.totalPrice = totalPrice;
		this.isPurchased = isPurchased;
		this.purchaseId = purchaseId;
}



    // Getters and Setters for each field
	
    public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(int purchaseId) {
        this.purchaseId = purchaseId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public int getCurrentQuantity() {
        return currentQuantity;
    }

    public void setCurrentQuantity(int currentQuantity) {
        this.currentQuantity = currentQuantity;
    }

    public boolean isPurchased() {
        return isPurchased;
    }

    public void setPurchased(boolean purchased) {
        isPurchased = purchased;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
    
}
