<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} | CARSELL</title>
    
    <!-- External Resources -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600&family=Playfair+Display:wght@600&family=DM+Sans:wght@300;400;500&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --bg: #0c0c0e;
            --surface: #131316;
            --card: #18181c;
            --border: rgba(255,255,255,0.07);
            --accent: #c9a96e;
            --accent-dim: rgba(201,169,110,0.12);
            --text-primary: #f0ede8;
            --text-secondary: #8a8882;
            --text-muted: #555450;
            --navbar-bg: rgba(12,12,14,0.88);
            --shadow-card: rgba(0,0,0,0.45);
            --btn-text: #0c0c0e;
        }

        body.light {
            --bg: #f7f4ef;
            --surface: #edeae4;
            --card: #ffffff;
            --border: rgba(0,0,0,0.08);
            --accent: #a8782e;
            --accent-dim: rgba(168,120,46,0.10);
            --text-primary: #1a1814;
            --text-secondary: #6b6660;
            --text-muted: #a09c98;
            --navbar-bg: rgba(247,244,239,0.90);
            --shadow-card: rgba(0,0,0,0.10);
            --btn-text: #ffffff;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background: var(--bg);
            color: var(--text-primary);
            font-family: 'DM Sans', sans-serif;
            min-height: 100vh;
            padding-top: 100px;
            transition: 0.4s ease;
        }

        /* Noise Overlay */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
            pointer-events: none;
            z-index: 0;
            opacity: 0.4;
        }

        /* Navbar Styling */
        .navbar {
            background: var(--navbar-bg) !important;
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border);
            height: 70px;
            padding: 0 30px;
        }

        .navbar-brand {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.7rem;
            font-weight: 600;
            color: var(--accent) !important;
            letter-spacing: 0.12em;
            text-transform: uppercase;
        }

        .nav-link {
            color: var(--text-secondary) !important;
            font-size: 0.78rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        .navbar-right { display: flex; align-items: center; gap: 12px; margin-left: auto; }

        /* Product Detail Styles */
        .product-container {
            position: relative;
            z-index: 1;
            max-width: 900px;
            margin: 0 auto 60px;
            background: var(--card);
            padding: 50px;
            border-radius: 14px;
            border: 1px solid var(--border);
            box-shadow: 0 20px 40px var(--shadow-card);
        }

        .category-label {
            color: var(--accent);
            font-size: 0.7rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-weight: 600;
            margin-bottom: 10px;
            display: block;
        }

        h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem;
            margin-bottom: 5px;
            color: var(--text-primary);
        }

        .brand-subtitle {
            font-style: italic;
            color: var(--text-secondary);
            font-size: 1rem;
            margin-bottom: 30px;
        }

        .description-text {
            color: var(--text-secondary);
            line-height: 1.8;
            border-left: 2px solid var(--accent);
            padding-left: 20px;
            margin: 30px 0;
        }

        .price-section {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.5rem;
            font-weight: 600;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 30px;
        }

        /* Buttons */
        .btn-gold {
            background: var(--accent);
            color: var(--btn-text);
            border: none;
            padding: 14px 40px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 1px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-gold:hover:not(:disabled) {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px var(--accent-dim);
        }

        .btn-outline-custom {
            border: 1px solid var(--border);
            color: var(--text-secondary);
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 0.8rem;
            text-transform: uppercase;
        }

        .btn-outline-custom:hover {
            border-color: var(--accent);
            color: var(--accent);
        }

        .meta-info {
            font-size: 0.85rem;
            color: var(--text-muted);
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid var(--border);
        }

        /* Utilities */
        .theme-btn { width: 38px; height: 38px; border-radius: 8px; border: 1px solid var(--border); background: var(--surface); color: var(--text-secondary); display: flex; align-items: center; justify-content: center; cursor: pointer; }
        .cart-icon { position: relative; display: flex; align-items: center; gap: 8px; padding: 8px 14px; border-radius: 8px; border: 1px solid var(--border); background: var(--surface); cursor: pointer; color: var(--text-secondary); }
        .cart-badge { position: absolute; top: -6px; right: -6px; width: 18px; height: 18px; border-radius: 50%; background: var(--accent); color: var(--btn-text); font-size: 0.65rem; font-weight: bold; display: none; align-items: center; justify-content: center; }
        
        #cartModal { display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.8); z-index: 2000; backdrop-filter: blur(10px); padding: 20px; }
        .cart-modal-content { max-width: 500px; margin: 80px auto; background: var(--surface); border: 1px solid var(--border); border-radius: 14px; padding: 35px; }
        .modal-title { font-family: 'Cormorant Garamond', serif; font-size: 2rem; color: var(--accent); margin-bottom: 20px; }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">CarSell</a>
            
            <div class="collapse navbar-collapse" id="navContent">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">Categories</a>
                        <ul class="dropdown-menu border-0 shadow" style="background: var(--surface); border: 1px solid var(--border) !important;">
                            <c:forEach items="${categories}" var="category">
                                <li><a class="dropdown-item" href="/category/${category.id}" style="color: var(--text-secondary); font-size: 0.8rem; text-transform: uppercase;">${category.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="navbar-right">
                <button id="themeToggle" class="theme-btn"><i class="bi bi-sun-fill"></i></button>

                <div class="cart-icon" onclick="viewCart()">
                    <i class="bi bi-bag-handle"></i>
                    <span class="cart-badge" id="cartCount">0</span>
                </div>

                <c:choose>
                    <c:when test="${not empty user}">
                        <div class="d-flex align-items-center gap-3 ms-2">
                            <span style="color: var(--text-secondary); font-size: 0.8rem;">
                                <i class="bi bi-person-circle"></i> ${user.name}
                            </span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="/login" class="nav-link">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>

<div class="product-container">
    <span class="category-label">Luxury Collection</span>
    <h1>${product.name}</h1>
    <div class="brand-subtitle">Exclusive masterpiece by ${product.brand}</div>

    <p class="description-text">${product.description}</p>

    <div class="price-section">
        <span>₹ ${product.price}</span>
        
        <button class="btn-gold" 
                onclick="addToCart('${product.id}', '${product.name}', '${product.price}', this)"
                ${!product.productAvailable ? 'disabled' : ''}>
            ${product.productAvailable ? 'Acquire Now' : 'Sold Out'}
        </button>
    </div>

    <div class="meta-info">
        <div class="row">
            <div class="col-6">
                Status: <span style="color: ${product.productAvailable ? '#4caf50' : '#ff5c5c'}">
                    ${product.productAvailable ? product.stockQuantity += ' Units Available' : 'Out of Stock'}
                </span>
            </div>
            <div class="col-6 text-end">Listed: ${product.releaseDate}</div>
        </div>
    </div>

<c:if test="${not empty user && user.role == 'admin'}">
    <div class="mt-5 d-flex gap-3">
        <!-- Update Button -->
        <a href="/edit_product/${product.id}" class="btn btn-outline-custom px-4">
            <i class="bi bi-pencil-square me-2"></i>Update Details
        </a>

        <!-- Delete Button -->
        <button type="button" 
                class="btn btn-outline-danger btn-sm opacity-75" 
                onclick="deleteListing('${product.id}')">
            <i class="bi bi-trash3 me-2"></i>Delete Listing
        </button>
    </div>
</c:if>
</div>

<!-- Cart Modal -->
<div id="cartModal">
    <div class="cart-modal-content">
        <h2 class="modal-title">Your Selection</h2>
        <div id="cartItems"></div>
        <div class="d-flex justify-content-between mt-4 pt-3" style="border-top: 1px solid var(--border)">
            <span style="color:var(--text-secondary);">Subtotal</span>
            <span id="cartTotal" style="font-weight:bold;">₹ 0</span>
        </div>
        <div class="mt-4 d-flex gap-2">
            <button class="btn-gold w-100" onclick="alert('Proceeding...')">Checkout</button>
            <button class="btn-outline-custom w-100" onclick="closeCart()">Close</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Theme Logic
    const themeToggle = document.getElementById('themeToggle');
    const icon = themeToggle.querySelector('i');

    if (localStorage.getItem('theme') === 'light') {
        document.body.classList.add('light');
        icon.classList.replace('bi-sun-fill', 'bi-moon-stars-fill');
    }

    themeToggle.addEventListener('click', () => {
        document.body.classList.toggle('light');
        const isLight = document.body.classList.contains('light');
        icon.classList.replace(isLight ? 'bi-sun-fill' : 'bi-moon-stars-fill', isLight ? 'bi-moon-stars-fill' : 'bi-sun-fill');
        localStorage.setItem('theme', isLight ? 'light' : 'dark');
    });

    // Cart Logic
    let cart = JSON.parse(localStorage.getItem('carsell_cart')) || [];

    function updateCartUI() {
        const countElement = document.getElementById('cartCount');
        countElement.innerText = cart.length;
        countElement.style.display = cart.length > 0 ? 'flex' : 'none';
        localStorage.setItem('carsell_cart', JSON.stringify(cart));
    }

    function addToCart(id, name, price, button) {
        const existingItem = cart.find(item => item.id === id);
        if (existingItem) { existingItem.quantity += 1; } 
        else { cart.push({ id, name, price: Number(price), quantity: 1 }); }
        updateCartUI();
        const originalText = button.innerText;
        button.innerText = 'Added to Cart';
        setTimeout(() => { button.innerText = originalText; }, 1500);
    }

    function viewCart() {
        const itemsContainer = document.getElementById('cartItems');
        const totalElement = document.getElementById('cartTotal');
        itemsContainer.innerHTML = '';
        let total = 0;

        if (cart.length === 0) {
            itemsContainer.innerHTML = '<p class="text-muted italic">Your collection is empty.</p>';
        } else {
            cart.forEach((item, index) => {
                total += item.price * item.quantity;
                const row = document.createElement('div');
                row.className = "d-flex justify-content-between align-items-center py-2 border-bottom border-secondary border-opacity-10";
                row.innerHTML = `
                    <div>
                        <div style="font-weight:600; color:var(--text-primary);">\${item.name}</div>
                        <small class="text-secondary">Qty: \${item.quantity}</small>
                    </div>
                    <div class="text-end">
                        <div style="color:var(--text-primary);">₹ \${(item.price * item.quantity).toFixed(2)}</div>
                        <i class="bi bi-trash text-danger" style="cursor:pointer" onclick="removeFromCart(\${index})"></i>
                    </div>`;
                itemsContainer.appendChild(row);
            });
        }
        totalElement.innerText = '₹ ' + total.toFixed(2);
        document.getElementById('cartModal').style.display = 'block';
    }

    function removeFromCart(index) {
        cart.splice(index, 1);
        updateCartUI();
        viewCart();
    }

    function closeCart() { document.getElementById('cartModal').style.display = 'none'; }
    
    async function deleteListing(productId) {
        if (confirm("Permanently remove this masterpiece from the collection?")) {
            const response = await fetch('/api/products/' + productId, { method: 'DELETE' });
            if (response.ok) window.location.href = "/";
        }
    }

    updateCartUI();
</script>
</body>
</html>