<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} | CARSELL</title>
    
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

        /* Product Detail Layout Overhaul */
        .product-container {
            position: relative;
            z-index: 1;
            max-width: 1100px;
            margin: 0 auto 60px;
            background: var(--card);
            padding: 45px;
            border-radius: 14px;
            border: 1px solid var(--border);
            box-shadow: 0 20px 40px var(--shadow-card);
        }

        /* Image Display Grid Styles */
        .gallery-showcase {
            width: 100%;
            height: 420px;
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            padding: 20px;
        }

        .gallery-showcase img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            transition: opacity 0.2s ease-in-out;
        }

        .thumbnail-strip {
            display: flex;
            gap: 12px;
            overflow-x: auto;
            padding: 5px 0;
        }

        .thumb-box {
            width: 75px;
            height: 75px;
            background: var(--surface);
            border: 2px solid var(--border);
            border-radius: 8px;
            cursor: pointer;
            overflow: hidden;
            flex-shrink: 0;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 4px;
        }

        .thumb-box img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .thumb-box:hover, .thumb-box.active {
            border-color: var(--accent);
            transform: translateY(-2px);
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
            font-size: 2.8rem;
            margin-bottom: 5px;
            color: var(--text-primary);
            line-height: 1.2;
        }

        .brand-subtitle {
            font-style: italic;
            color: var(--text-secondary);
            font-size: 1rem;
            margin-bottom: 25px;
        }

        .description-text {
            color: var(--text-secondary);
            line-height: 1.8;
            border-left: 2px solid var(--accent);
            padding-left: 20px;
            margin: 25px 0;
        }

        .price-section {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.5rem;
            font-weight: 600;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 25px;
        }

        /* Buttons */
        .btn-gold {
            background: var(--accent);
            color: var(--btn-text);
            border: none;
            padding: 12px 35px;
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
            margin-top: 35px;
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

<div 
    class="cart-icon px-3 py-2"
    onclick="cart()"
    id="cartContainer"
    style="
        cursor:pointer;
        color: var(--text-primary);
        border: 1px solid var(--border);
        display: flex;
        align-items: center;
        gap: 8px;
        border-radius: 8px;
    ">

    <i class="bi bi-bag"></i>

    <span 
        id="cartCount"
        class="badge rounded-pill bg-danger text-white"
        style="
            font-size: 0.7rem;
            padding: 4px 7px;
            <c:if test='${cartSize == 0}'>display:none;</c:if>">
        ">
        ${cartSize}
    </span>

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
    <div class="row g-5">
        <div class="col-md-6">
            <div class="gallery-showcase mb-3">
                <c:choose>
                    <c:when test="${not empty product_images}">
                        <img id="primaryDisplay" src="${product_images[0].imageUrl}" alt="${product.name}">
                    </c:when>
                    <c:otherwise>
                        <img id="primaryDisplay" src="https://images.unsplash.com/photo-1531403009284-440f080d1e12?q=80&w=500" alt="No Showcase Image Available">
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="thumbnail-strip">
                <c:forEach items="${product_images}" var="img" varStatus="loop">
                    <div class="thumb-box ${loop.first ? 'active' : ''}" onclick="swapDisplayImage('${img.imageUrl}', this)">
                        <img src="${img.imageUrl}" alt="Product Aspect Presentation View">
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="col-md-6 d-flex flex-column justify-content-between">
            <div>
                <span class="category-label">Luxury Collection</span>
                <h1>${product.name}</h1>
                <div class="brand-subtitle">Exclusive masterpiece by ${product.brand}</div>

                <p class="description-text">${product.description}</p>

                <div class="price-section">
                    <span>₹ ${product.price}</span>
                    
                    <button class="btn-gold" 
                            onclick="addToCart('${product.id}')"
                            ${!product.productAvailable ? 'disabled' : ''}>
                        ${product.productAvailable ? 'Acquire Now' : 'Sold Out'}
                    </button>
                </div>
            </div>

            <div class="meta-info">
                <div class="row">
                    <div class="col-7">
                        Status: <span style="color: ${product.productAvailable ? '#4caf50' : '#ff5c5c'}">
                            ${product.productAvailable ? product.stockQuantity += ' Units Available' : 'Out of Stock'}
                        </span>
                    </div>
                    <div class="col-5 text-end">Listed: ${product.releaseDate}</div>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${not empty user && user.role == 'admin'}">
        <div class="mt-5 d-flex gap-3 pt-4" style="border-top: 1px solid var(--border)">
            <a href="/edit_product/${product.id}" class="btn btn-outline-custom px-4 d-inline-flex align-items-center">
                <i class="bi bi-pencil-square me-2"></i>Update Details
            </a>

            <button type="button" 
                    class="btn btn-outline-danger btn-sm opacity-75 px-4 d-inline-flex align-items-center" 
                    onclick="deleteListing('${product.id}')">
                <i class="bi bi-trash3 me-2"></i>Delete Listing
            </button>
        </div>
    </c:if>
</div>

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
    // Image Switcher Logic
    function swapDisplayImage(targetUrl, thumbnailElement) {
        const primaryImg = document.getElementById('primaryDisplay');
        
        // Add smooth operational layout fade transition effect
        primaryImg.style.opacity = '0.3';
        
        setTimeout(() => {
            primaryImg.src = targetUrl;
            primaryImg.style.opacity = '1';
        }, 150);

        // Manage active structural border indicators
        document.querySelectorAll('.thumb-box').forEach(box => {
            box.classList.remove('active');
        });
        thumbnailElement.classList.add('active');
    }

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
        function cart(){
    	window.location.href = "/cart"
    }
	    function addToCart(productId) {

        fetch("/cart/add/" + productId, {
            method: "POST"
        })
        .then(response => response.text())
        .then(data => {

            let count = document.getElementById("cartCount");

            let current = parseInt(count.innerText || "0");

            updateCartIndicator(current + 1);

        })
        .catch(error => {
            console.error(error);
        });
    }


    updateCartUI();
</script>
</body>
</html>