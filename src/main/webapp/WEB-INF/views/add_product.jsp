<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Your Vehicle | CARSELL</title>
    
    <!-- Fonts & Bootstrap (Matching Home Page) -->
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --bg: #0c0c0e;
            --surface: #131316;
            --border: rgba(255, 255, 255, 0.07);
            --accent: #c9a96e;
            --text-primary: #f0ede8;
            --text-secondary: #8a8882;
        }

        body {
            background-color: var(--bg);
            color: var(--text-primary);
            font-family: 'DM Sans', sans-serif;
            padding: 100px 20px;
        }

        .form-container {
            max-width: 700px;
            margin: 0 auto;
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.5);
        }

        .form-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .form-header h1 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.5rem;
            letter-spacing: 0.05em;
            color: var(--accent);
        }

        /* Luxury Input Styling */
        .form-group { margin-bottom: 25px; }

        label {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.15em;
            color: var(--text-secondary);
            margin-bottom: 8px;
            display: block;
        }

        .form-control, .form-select {
            background: #1a1a1e !important;
            border: 1px solid var(--border) !important;
            color: var(--text-primary) !important;
            border-radius: 8px;
            padding: 12px 16px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--accent) !important;
            box-shadow: 0 0 0 4px rgba(201, 169, 110, 0.1);
        }

        .btn-gold {
            background: var(--accent);
            color: #0c0c0e;
            border: none;
            width: 100%;
            padding: 15px;
            border-radius: 8px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .btn-gold:hover {
            filter: brightness(1.1);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(201, 169, 110, 0.2);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: var(--text-secondary);
            text-decoration: none;
            font-size: 0.8rem;
            letter-spacing: 0.1em;
        }

        .back-link:hover { color: var(--accent); }
    </style>
</head>
<body>

<div class="form-container">
    <div class="form-header">
        <h1>New Listing</h1>
        <p style="color: var(--text-secondary); font-style: italic;">Enter the details of the vehicle below</p>
    </div>

    <form action="/api/products" method="POST">
        <div class="row">
            <div class="col-md-6 form-group">
                <label>Product Name</label>
                <input type="text" name="name" class="form-control" placeholder="e.g. TATA NEXON" required>
            </div>
            <div class="col-md-6 form-group">
                <label>Brand</label>
                <input type="text" name="brand" class="form-control" placeholder="e.g. Tata Motors" required>
            </div>
        </div>

        <div class="form-group">
            <label>Category</label>
            <select name="category" class="form-select">
                <option value="Luxury">Luxury</option>
                <option value="SUV">SUV</option>
                <option value="Sedan">Sedan</option>
                <option value="Hatchback">Hatchback</option>
            </select>
        </div>

        <div class="form-group">
            <label>Description</label>
            <textarea name="description" class="form-control" rows="3" placeholder="Describe the vehicle's features..."></textarea>
        </div>

        <div class="row">
            <div class="col-md-4 form-group">
                <label>Price (₹)</label>
                <input type="number" name="price" class="form-control" placeholder="0.00" required>
            </div>
            <div class="col-md-4 form-group">
                <label>Stock Quantity</label>
                <input type="number" name="stockQuantity" class="form-control" placeholder="1" required>
            </div>
            <div class="col-md-4 form-group">
                <label>Release Date</label>
                <input type="date" name="releaseDate" class="form-control" required>
            </div>
        </div>

        <div class="form-check mb-4">
            <input class="form-check-input" type="checkbox" name="productAvailable" value="true" id="available" checked>
            <label class="form-check-label" for="available" style="text-transform: none; letter-spacing: 0;">
                Available for immediate sale
            </label>
        </div>

        <button type="submit" class="btn btn-gold">Publish Listing</button>
    </form>

    <a href="/" class="back-link"><i class="bi bi-arrow-left"></i> Return to Collection</a>
</div>

</body>
</html>