<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products - Fancyfy Accessories</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
        body {
            background: #121212;
            font-family: 'Roboto', sans-serif;
            color: #e0e0e0;
        }
        .header {
            background: #1f1f1f;
            color: #ffd700;
            padding: 20px;
            text-align: center;
            position: relative;
        }
        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        .header {
            font-size: 1.2rem;
            margin-top: 10px;
        }
        .message {
            font-size: 1.2rem;
            margin-top: 123px;
        }
        .banner {
            background: #333;
            color: #ffd700;
            padding: 20px;
            text-align: center;
            margin: 20px 0;
            font-size: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .container {
            margin-top: 40px;
        }
        .card {
            background: #1f1f1f;
            color: #e0e0e0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card img {
            max-height: 150px;
            object-fit: cover;
        }
        .card-title {
            color: #ffd700;
        }
        footer {
            background: #1f1f1f;
            color: #e0e0e0;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
            left: 0;
        }
        .btn-primary {
            background-color: #ffd700;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e6c200;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Fancyfy Accessories</h1>
        <div id="messages" style="color: aquamarine;" class="message"></div>
    </div>
    
    <div class="container mt-4">
        <h2 class="text-center">Product Listing</h2>
        <div class="row">
            <c:forEach var="product" items="${productList}" varStatus="status">
                <c:if test="${status.index % 3 == 0 && status.index > 0}">
                    <div class="col-12">
                        <div class="banner" id="banner-${status.index / 3}">
                            <p> <span class="dynamic-offer"></span></p>
                        </div>
                    </div>
                </c:if>
                <div class="col-md-4 col-sm-6 mb-4">
                    <div class="card h-100 shadow-sm">
                        <div id="carousel-${product.id}" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach var="imageUrl" items="${product.imageUrls}" varStatus="imageStatus">
                                    <div class="carousel-item ${imageStatus.first ? 'active' : ''}">
                                        <img src="${pageContext.request.contextPath}/${imageUrl}" alt="${product.name}" class="d-block w-100" style="max-height: 300px; object-fit: cover;">
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
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p><strong>Price:</strong> $${product.price}</p>
                            <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <footer>
        <p>&copy; 2025 Fancyfy Accessories. All rights reserved.</p>
    </footer>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const messages = [
                "50% Off on All Accessories!",
                "Buy One Get One Free!",
                "Free Shipping on Orders Over RS50!"
            ];
            let index = 0;
            const messageContainer = document.getElementById('messages');

            function showMessage() {
                messageContainer.textContent = messages[index];
                index = (index + 1) % messages.length;
                setTimeout(showMessage, 3000); // Change message every 5 seconds
            }

            showMessage();

            // Dynamic offers for banners
            const offers = [
                "Fancyfy offers a wide selection of elegant chains that add a touch of sophistication to any outfit.",
                "Discover our stylish bracelets designed to complement your look with a sense of charm and grace.",
                "Beautiful bangles from Fancyfy are crafted to adorn your wrist with elegance and style.",
                "Fancyfy's accessories are the perfect blend of quality and affordability, making luxury accessible to everyone.",
                "Our unique and fashionable jewelry pieces are designed to make you stand out on any occasion.",
                "At Fancyfy, we believe in offering exceptional customer service and a seamless shopping experience."
            ];
            const banners = document.querySelectorAll('.dynamic-offer');
            banners.forEach((banner, i) => {
                banner.textContent = offers[i % offers.length];
            });
        });
    </script>
</body>
</html>