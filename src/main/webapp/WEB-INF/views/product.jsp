<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} | CARSELL</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --bg-dark: #0a0a0a;
            --card-bg: #111111;
            --accent-gold: #d4af37; /* Match the gold buttons in your image */
            --text-muted: #888888;
            --text-light: #e0e0e0;
        }

        body {
            background-color: var(--bg-dark);
            color: var(--text-light);
            font-family: 'Poppins', sans-serif;
            padding: 60px 20px;
        }

        .product-container {
            max-width: 800px;
            margin: 0 auto;
            background: var(--card-bg);
            padding: 40px;
            border-radius: 4px;
            border: 1px solid #222;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        /* Category Label (Featured style) */
        .category-label {
            color: var(--accent-gold);
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-weight: 600;
            display: block;
            margin-bottom: 10px;
        }

        /* Product Title (Serif style) */
        h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3rem;
            margin-bottom: 5px;
            color: #fff;
        }

        .brand-subtitle {
            font-style: italic;
            color: var(--text-muted);
            font-size: 0.9rem;
            margin-bottom: 25px;
        }

        .description-text {
            color: #bbb;
            line-height: 1.8;
            border-left: 2px solid var(--accent-gold);
            padding-left: 20px;
            margin: 30px 0;
        }

        .price-section {
            font-size: 2rem;
            font-weight: 300;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 20px;
        }

        /* Gold Button Styling */
        .btn-gold {
            background-color: var(--accent-gold);
            color: #000;
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .btn-gold:hover {
            background-color: #e5c05b;
            transform: translateY(-2px);
        }

        .btn-outline-custom {
            border: 1px solid #444;
            color: var(--text-muted);
            text-transform: uppercase;
            font-size: 0.8rem;
        }

        .btn-outline-custom:hover {
            border-color: var(--accent-gold);
            color: var(--accent-gold);
        }

        .meta-info {
            font-size: 0.85rem;
            color: var(--text-muted);
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #222;
        }

        .stock-count {
            color: #4caf50;
            font-weight: 600;
        }

        .out-of-stock {
            background-color: #333 !important;
            color: #777 !important;
            cursor: not-allowed;
        }
    </style>
</head>
<body>

<div class="product-container">
    <div class="row">
        <div class="col-12">
            <span class="category-label">${product.category}</span>
            <h1>${product.name}</h1>
            <div class="brand-subtitle">by ${product.brand}</div>

            <p class="description-text">
                ${product.description}
            </p>

            <div class="price-section">
                <span>₹ ${product.price}</span>
                
                <button class="btn btn-gold ${!product.productAvailable ? 'out-of-stock' : ''}" 
                        ${!product.productAvailable ? 'disabled' : ''}>
                    ${product.productAvailable ? 'Add to Cart' : 'Sold Out'}
                </button>
            </div>

            <div class="meta-info">
                <div class="row">
                    <div class="col-6">
                        Availability: <span class="stock-count">${product.stockQuantity} Units In Stock</span>
                    </div>
                    <div class="col-6 text-end">
                        Listed on: ${product.releaseDate}
                    </div>
                </div>
            </div>

            <div class="mt-5 d-flex gap-3">
                <button class="btn btn-outline-custom px-4">Update Details</button>
                <button class="btn btn-outline-danger btn-sm opacity-50">Delete Listing</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>