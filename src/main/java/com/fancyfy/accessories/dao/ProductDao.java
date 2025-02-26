package com.fancyfy.accessories.dao;

import com.fancyfy.accessories.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private String jdbcURL = "jdbc:oracle:thin:@localhost:1521:orcl";
    private String jdbcUsername = "system";
    private String jdbcPassword = "password";

    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM products WHERE id = ?";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products (id, name, description, price, image_urls, quantity) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM products WHERE id = ?";
    private static final String UPDATE_PRODUCT_QUANTITY_SQL = "UPDATE products SET quantity = ? WHERE id = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String imageUrls = rs.getString("image_urls");
                int quantity = rs.getInt("quantity");
                List<String> imageUrlList = List.of(imageUrls.split(","));
                products.add(new Product(id, name, description, price, imageUrlList, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product selectProductById(int id) {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String imageUrls = rs.getString("image_urls");
                int quantity = rs.getInt("quantity");
                List<String> imageUrlList = List.of(imageUrls.split(","));
                product = new Product(id, name, description, price, imageUrlList, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public void insertProduct(Product product) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setInt(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, String.join(",", product.getImageUrls()));
            preparedStatement.setInt(6, product.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProductById(int id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProductQuantity(int id, int quantity) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_QUANTITY_SQL)) {
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}