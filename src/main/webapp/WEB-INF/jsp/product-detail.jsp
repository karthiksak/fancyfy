<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Detail - Fancyfy Accessories</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header class="bg-dark text-white text-center py-3">
        <img src="${pageContext.request.contextPath}/images/banner.jpg" alt="Fancyfy Accessories Banner" class="img-fluid">
        <h1 class="mt-2">Fancyfy Accessories</h1>
    </header>
    
    <div class="container mt-4">
        <h2 class="text-center">Product Detail</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <c:if test="${not empty product}">
                    <div class="card shadow-sm">
                        <div id="carousel-${product.id}" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach var="imageUrl" items="${product.imageUrls}" varStatus="status">
                                    <div class="carousel-item ${status.first ? 'active' : ''}">
                                        <img src="${pageContext.request.contextPath}/${imageUrl}" alt="${product.name}" class="d-block w-100" style="max-height: 400px; object-fit: cover;">
                                    </div>
                                </c:forEach>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel-${product.id}" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carousel-${product.id}" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="card-body text-center">
                            <h3 class="card-title">${product.name}</h3>
                            <p class="card-text">${product.description}</p>
                            <p class="fs-5"><strong>Price:</strong> $${product.price}</p>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty product}">
                    <p class="text-center text-danger">Product not found.</p>
                </c:if>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
