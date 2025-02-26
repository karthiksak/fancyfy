<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fancyfy Accessories - Home</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Custom Styles -->
    <style>
        body {
            background: #1a1a1a;
            font-family: 'Roboto', sans-serif;
            color: #fff;
        }
        .header {
            background: #000;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .header img {
            height: 80px;
            margin-bottom: 10px;
        }
        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        .container {
            margin-top: 40px;
        }
        .card {
            background: #333;
            color: #fff;
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
            background: #000;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
            left: 0;
        }
        .btn-primary {
            background-color: #000;
            border: none;
        }
        .btn-primary:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="images/banner.jpg" alt="Fancyfy Accessories Banner" class="img-fluid">
        <h1>Fancyfy Accessories</h1>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Manage Products</h5>
                        <p class="card-text">Add, edit, or delete products in your inventory.</p>
                        <a href="${pageContext.request.contextPath}/manage-products" class="btn btn-primary">Go to Manage Products</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Product Form</h5>
                        <p class="card-text">Add or edit product information.</p>
                        <a href="${pageContext.request.contextPath}/product-form" class="btn btn-primary">Go to Product Form</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Products</h5>
                        <p class="card-text">View all products in the inventory.</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Go to Products</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Fancyfy Accessories. All rights reserved.</p>
    </footer>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>