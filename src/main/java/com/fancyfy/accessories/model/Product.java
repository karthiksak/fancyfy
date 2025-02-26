package com.fancyfy.accessories.model;

import java.util.List;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private List<String> imageUrls;
    private int quantity;

    // Default constructor
    public Product() {
    }

    // Parameterized constructor
    public Product(int id, String name, String description, double price, List<String> imageUrls, int quantity) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imageUrls = imageUrls;
        this.quantity = quantity;
    }

    // Constructor without ID for new products
    public Product(String name, String description, double price, List<String> imageUrls, int quantity) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.imageUrls = imageUrls;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<String> getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(List<String> imageUrls) {
        this.imageUrls = imageUrls;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}