<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Product - Fancyfy Accessories</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <header class="bg-dark text-white text-center py-3">
        <img src="${pageContext.request.contextPath}/images/banner.jpg" alt="Fancyfy Accessories Banner" class="img-fluid">
        <h1 class="mt-2">Fancyfy Accessories</h1>
    </header>
    
    <div class="container mt-4">
        <h2 class="text-center">Add Product</h2>
        <form action="${pageContext.request.contextPath}/add-product" method="post" enctype="multipart/form-data" class="p-4 border rounded bg-light shadow">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            
            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
            </div>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="price" class="form-label">Price:</label>
                    <input type="number" id="price" name="price" step="0.01" class="form-control" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="quantity" class="form-label">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" min="0" class="form-control" required>
                </div>
            </div>
            
            <div class="mb-3">
                <label for="images" class="form-label">Images (up to 5):</label>
                <input type="file" id="images" name="images" accept="image/*" multiple class="form-control" required>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add Product</button>
            </div>
        </form>
    </div>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- jQuery (optional, for additional interactivity if needed) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>