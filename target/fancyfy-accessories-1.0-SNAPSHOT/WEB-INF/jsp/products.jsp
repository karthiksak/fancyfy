<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <header>
        <img src="${pageContext.request.contextPath}/images/banner.jpg" alt="Fashion Jewelry Banner" class="banner">
    </header>
    <h1>Product Listing</h1>
    <div class="product-list">
        <c:forEach var="product" items="${productList}">
            <div class="product">
                <img src="${product.imageUrl}" alt="${product.name}">
                <h2>${product.name}</h2>
                <p>${product.description}</p>
                <p>Price: $${product.price}</p>
                <a href="product-detail.jsp?id=${product.id}">View Details</a>
            </div>
        </c:forEach>
    </div>
</body>
</html>