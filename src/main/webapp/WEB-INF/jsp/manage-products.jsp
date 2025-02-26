<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products - Fancyfy Accessories</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
        .product-image {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 150px;
            overflow: hidden;
        }
        .product-image img {
            max-width: 100%;
            max-height: 100%;
        }
        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>
    <header class="bg-dark text-white text-center py-3">
        <img src="${pageContext.request.contextPath}/images/banner.jpg" alt="Fancyfy Accessories Banner" class="img-fluid">
        <h1 class="mt-2">Fancyfy Accessories</h1>
    </header>

    <div class="container mt-4">
        <h2 class="text-center">Manage Products</h2>

        <div class="row mb-3">
            <div class="col-md-6">
                <a href="${pageContext.request.contextPath}/product-form" class="btn btn-primary">Add New Product</a>
            </div>
            <div class="col-md-6">
                <form id="search-form" class="d-flex">
                    <input type="text" id="search-input" class="form-control me-2" placeholder="Search by product name or description" required>
                    <button type="submit" class="btn btn-outline-success">Search</button>
                </form>
            </div>
        </div>

        <div class="row" id="product-list">
            <c:forEach var="product" items="${productList}">
                <div class="col-md-4 mb-4 product-item" data-name="${product.name}" data-description="${product.description}">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body">
                            <div id="carousel-${product.id}" class="carousel slide product-image mb-3" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <c:forEach var="imageUrl" items="${product.imageUrls}" varStatus="status">
                                        <div class="carousel-item ${status.first ? 'active' : ''}">
                                            <img src="${pageContext.request.contextPath}/${imageUrl}" alt="${product.name}" class="d-block w-100">
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
                            <h5 class="card-title text-center">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p><strong>Price:</strong> $${product.price}</p>
                            <p><strong>Quantity:</strong> ${product.quantity}</p>
                        </div>
                        <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" class="btn btn-info btn-sm">View Details</a>
                            <button class="btn btn-danger btn-sm delete-btn" data-id="${product.id}">Delete</button>
                        </div>
                        <form action="${pageContext.request.contextPath}/update-quantity" method="post" class="d-flex align-items-center mt-3">
                            <input type="hidden" name="id" value="${product.id}">
                            <input type="number" name="quantity" class="form-control me-2" value="${product.quantity}" min="0" required style="width: 80px;">
                            <button type="submit" class="btn btn-warning btn-sm">Update</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- jQuery for Delete Confirmation and Search Functionality -->
    <script>
        $(document).ready(function() {
            $(".delete-btn").click(function() {
                let productId = $(this).data("id");
                if (confirm("Are you sure you want to delete this product?")) {
                    $("<form>", {
                        "method": "post",
                        "action": "${pageContext.request.contextPath}/delete-product"
                    })
                    .append($("<input>", {
                        "type": "hidden",
                        "name": "id",
                        "value": productId
                    }))
                    .appendTo("body")
                    .submit();
                }
            });

            $("#search-form").submit(function(event) {
                event.preventDefault();
                var searchInput = $("#search-input").val().toLowerCase();
                $(".product-item").each(function() {
                    var productName = $(this).data("name").toLowerCase();
                    var productDescription = $(this).data("description").toLowerCase();
                    if (productName.includes(searchInput) || productDescription.includes(searchInput)) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            });
        });
    </script>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>