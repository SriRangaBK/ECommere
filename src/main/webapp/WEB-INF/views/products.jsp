<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${selectedCategory} | ClickNBuy Luxury</title>

    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;1,400&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --bg: #09090b;
            --surface: #141417;
            --card: #18181c;
            --border: rgba(255, 255, 255, 0.06);
            --accent: #e5c158; 
            --accent-glow: rgba(229, 193, 88, 0.15);
            --text-primary: #f4f4f5;
            --text-secondary: #a1a1aa;
            --navbar-blur: rgba(9, 9, 11, 0.8);
        }

        body.light {
            --bg: #faf9f6;
            --surface: #f4f3ee;
            --card: #ffffff;
            --border: rgba(0, 0, 0, 0.05);
            --accent: #8b6e2a;
            --accent-glow: rgba(139, 110, 42, 0.1);
            --text-primary: #18181b;
            --text-secondary: #71717a;
            --navbar-blur: rgba(250, 249, 246, 0.9);
        }
	
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background: var(--bg);
            color: var(--text-primary);
            font-family: 'DM Sans', sans-serif;
            transition: background 0.6s cubic-bezier(0.16, 1, 0.3, 1), color 0.6s cubic-bezier(0.16, 1, 0.3, 1);
            overflow-x: hidden;
            letter-spacing: -0.01em;
        }

        /* --- Luxury Scrollbar --- */
        ::-webkit-scrollbar { width: 5px; }
        ::-webkit-scrollbar-track { background: var(--bg); }
        ::-webkit-scrollbar-thumb { background: var(--border); border-radius: 2px; }

        h1, h2, h3, h4, h5, h6, .product-name, .section-title {
            color: var(--text-primary);
            font-weight: 400;
        }

        /* --- Navbar Upgrade --- */
        .navbar {
            background: var(--navbar-blur) !important;
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border);
            padding: 1rem 3% 1rem 3%;
            z-index: 2000;
        }

        .navbar-brand {
            font-family: 'Cormorant Garamond', serif;
            font-weight: 600;
            font-size: 1.45rem;
            color: var(--text-primary) !important;
            letter-spacing: 0.12em;
            text-transform: uppercase;
        }
        .navbar-brand span {
            color: var(--accent);
        }

        .nav-link {
            color: var(--text-secondary) !important;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            padding: 0.5rem 1rem !important;
            transition: color 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--accent) !important;
        }

        .dropdown-menu {
            background: var(--surface) !important;
            border: 1px solid var(--border) !important;
            border-radius: 4px;
            padding: 0.5rem 0;
            margin-top: 10px !important;
        }

        .dropdown-item {
            color: var(--text-secondary) !important;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            padding: 0.6rem 1.5rem;
        }

        .dropdown-item:hover {
            background: var(--accent-glow) !important;
            color: var(--accent) !important;
        }

        /* --- Page Container --- */
        .page-container { 
            padding: 150px 6% 100px 6%; 
            max-width: 1600px;
            margin: 0 auto;
        }

        /* --- Asymmetric Category Intro Hero --- */
        .category-hero {
            border-bottom: 1px solid var(--border);
            padding-bottom: 3.5rem;
            margin-bottom: 4.5rem;
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 40px;
            align-items: end;
        }

        .hero-left-col .hero-subtitle {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.3em;
            color: var(--accent);
            margin-bottom: 1rem;
            display: block;
            font-weight: 500;
        }

        .section-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: clamp(2.8rem, 5.5vw, 4.5rem);
            font-weight: 300;
            line-height: 1.05;
            letter-spacing: -0.02em;
        }

        .hero-right-col {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 20px;
        }

        .section-count {
            font-size: 0.85rem;
            letter-spacing: 0.05em;
            color: var(--text-secondary);
            font-family: 'DM Sans', sans-serif;
            text-transform: uppercase;
            border-left: 2px solid var(--accent);
            padding-left: 12px;
        }

        /* --- Structural Showcase Layout Grid --- */
        .showroom-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
            gap: 45px;
        }

        /* --- Elevated Product Frame Layout --- */
        .card-custom {
            background: var(--card);
            border: 1px solid var(--border);
            padding: 35px;
            height: 100%;
            display: flex;
            flex-direction: column;
            transition: all 0.5s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
        }

        .card-custom:hover {
            border-color: rgba(255, 255, 255, 0.15);
            box-shadow: 0 30px 60px rgba(0,0,0,0.25);
            transform: translateY(-4px);
        }
        body.light .card-custom:hover {
            border-color: rgba(0, 0, 0, 0.12);
            box-shadow: 0 30px 60px rgba(0,0,0,0.06);
        }

        .card-top-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 3.5rem;
        }

        .product-tag {
            font-size: 0.65rem;
            text-transform: uppercase;
            color: var(--text-secondary);
            letter-spacing: 0.1em;
            font-weight: 500;
        }

        .product-index {
            font-family: 'Cormorant Garamond', serif;
            font-size: 0.9rem;
            color: var(--text-secondary);
            font-style: italic;
        }

        .product-details-wrap {
            margin-bottom: 4rem;
        }

        .product-brand {
            color: var(--accent);
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.15em;
            font-weight: 600;
            margin-bottom: 0.6rem;
            display: block;
        }

        .product-name {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.2rem;
            line-height: 1.15;
            font-weight: 300;
            letter-spacing: -0.01em;
        }

        .price-container {
            margin-top: auto;
            padding-top: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid var(--border);
        }

        .price-label {
            font-size: 0.65rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--text-secondary);
            display: block;
            margin-bottom: 2px;
        }

        .price-value {
            font-family: 'DM Sans', sans-serif;
            font-size: 1.35rem;
            font-weight: 500;
            color: var(--text-primary);
        }

        /* --- Action UI Components --- */
        .btn-action {
            background: var(--text-primary);
            border: 1px solid var(--text-primary);
            color: var(--bg);
            padding: 12px 26px;
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.15em;
            font-weight: 600;
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .btn-action:hover {
            background: transparent;
            color: var(--text-primary);
            border-color: var(--text-primary);
        }

        /* --- Luxury Navbar Search --- */
        .search-input {
            background: transparent !important;
            color: var(--text-primary) !important;
            border: none !important;
            border-bottom: 1px solid var(--border) !important;
            border-radius: 0 !important;
            font-size: 0.8rem;
            padding-left: 0 !important;
            width: 180px;
            transition: all 0.4s ease;
        }
        .search-input:focus {
            box-shadow: none !important;
            border-bottom-color: var(--text-primary) !important;
            width: 220px;
        }
        .search-input::placeholder {
            color: var(--text-secondary);
            opacity: 0.6;
        }

        @media (max-width: 991px) {
            .category-hero { grid-template-columns: 1fr; gap: 20px; padding-bottom: 2.5rem; margin-bottom: 3rem;}
            .hero-right-col { align-items: flex-start; }
            .search-input { width: 100%; }
            .search-input:focus { width: 100%; }
        }
        @media (max-width: 768px) {
            .page-container { padding: 120px 1.5rem 60px 1.5rem; }
            .showroom-grid { gap: 30px; }
        }
    </style>
</head>

<body>

<header>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">Click<span>N</span>Buy</a>
            
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navContent" style="color: var(--text-primary);">
                <i class="bi bi-list" style="font-size: 1.5rem;"></i>
            </button>

            <div class="collapse navbar-collapse" id="navContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                            Categories
                        </a>
                        <ul class="dropdown-menu shadow-lg">
                            <c:forEach items="${categories}" var="category">
                                <li>
                                    <a class="dropdown-item" href="/category/${category.id}">
                                        ${category.name}
                                    </a>
                                </li>
                            </c:forEach>
                            <li><hr class="dropdown-divider opacity-10" style="border-color: var(--border);"></li>
                            <li><a class="dropdown-item" href="/" style="color: var(--accent) !important;">VIEW ALL</a></li>
                        </ul>
                    </li>

                    <c:if test="${not empty user && user.role == 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="/add_product">Add Product</a></li>
                    </c:if>
                </ul>
            </div>

            <div class="navbar-right d-flex align-items-center gap-3">
                <input type="text" id="productSearch" class="form-control search-input d-none d-md-block" placeholder="Search this tier...">

                <button id="themeToggle" class="btn btn-link text-decoration-none p-0" style="color: var(--text-primary); font-size: 1.1rem;">
                    <i class="bi bi-brightness-high"></i>
                </button>

                <!-- Cart Component Wrapper -->
                <div class="cart-icon px-2 py-1" onclick="cart()" id="cartContainer" style="cursor:pointer; color: var(--text-primary); display: flex; align-items: center; gap: 6px; position: relative;">
                    <i class="bi bi-bag" style="font-size: 1.1rem;"></i>
                    <span id="cartCount" class="badge rounded-pill bg-danger text-white" style="font-size: 0.6rem; padding: 3px 6px; position: absolute; top: -4px; right: -8px; display: none;">
                        0
                    </span>
                </div>

                <c:choose>
                    <c:when test="${not empty user}">
                        <div class="dropdown">
                            <button class="btn p-0 border-0 text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" style="color: var(--text-primary); font-size: 0.8rem; text-transform: uppercase; letter-spacing: 0.05em;">
                                <i class="bi bi-person ms-1" style="font-size: 1.1rem; vertical-align: middle;"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end shadow-lg">
                                <li><a class="dropdown-item" href="/profile">My Profile</a></li>
                                <li><hr class="dropdown-divider opacity-10" style="border-color: var(--border);"></li>
                                <li>
                                    <form action="/logout" method="post" class="m-0">
                                        <button class="dropdown-item text-danger">Logout</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="/login" class="nav-link p-0" style="font-size: 0.8rem;">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>

<main class="page-container">
    <!-- Asymmetrical Category Header -->
    <div class="category-hero">
        <div class="hero-left-col">
            <span class="hero-subtitle">Tier Segment Showcase</span>
            <h1 class="section-title">${selectedCategory}</h1>
        </div>
        <div class="hero-right-col">
            <span class="section-count" id="countDisplay">${products.size()} Models Found</span>
        </div>
    </div>

    <!-- Dynamic Architectural Grid Layout -->
    <div class="showroom-grid" id="productGrid">
        <c:forEach items="${products}" var="product" varStatus="status">
            <div class="product-item" data-name="${product.name.toLowerCase()}" data-brand="${product.brand.toLowerCase()}">
                <div class="card-custom">
                    <div class="card-top-meta">
                        <span class="product-tag">Collection // ${selectedCategory}</span>
                        <span class="product-index">0${status.index + 1}</span>
                    </div>
                    
                    <div class="product-details-wrap">
                        <a href="/product/${product.id}" class="text-decoration-none text-reset">
                            <span class="product-brand">${product.brand}</span>
                            <h2 class="product-name">${product.name.toUpperCase()}</h2>
                        </a>
                    </div>
                    
                    <div class="price-container">
                        <div>
                            <span class="price-label">Value</span>
                            <div class="price-value">₹ ${product.price}</div>
                        </div>
                        <button class="btn-action" onclick="addToCart('${product.id}')">
                            Inquire
                        </button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    /**
     * Theme Controller Context
     */
    const themeController = {
        init() {
            const saved = localStorage.getItem('carsell_theme');
            if (saved === 'light') document.body.classList.add('light');
            
            document.getElementById('themeToggle').addEventListener('click', () => {
                const isLight = document.body.classList.toggle('light');
                localStorage.setItem('carsell_theme', isLight ? 'light' : 'dark');
            });
        }
    };

    /**
     * Client Filtering System
     */
    const searchController = {
        init() {
            const input = document.getElementById('productSearch');
            const items = document.querySelectorAll('.product-item');
            const counter = document.getElementById('countDisplay');

            if (!input) return;

            input.addEventListener('input', (e) => {
                const query = e.target.value.toLowerCase();
                let visible = 0;

                items.forEach(item => {
                    const match = item.dataset.name.includes(query) || item.dataset.brand.includes(query);
                    item.style.display = match ? 'block' : 'none';
                    if (match) visible++;
                });

                counter.innerText = `${visible} Models Found`;
            });
        }
    };

    /**
     * Pipeline Cart Interface
     */
    const cartUIController = {
        syncCount() {
            fetch("/api/cart")
                .then(response => {
                    if (!response.ok) throw new Error("Unauthenticated request configuration context");
                    return response.text();
                })
                .then(serverCount => {
                    const countBadge = document.getElementById("cartCount");
                    if (countBadge) {
                        const countInt = parseInt(serverCount) || 0;
                        countBadge.innerText = countInt;
                        
                        if (countInt > 0) {
                            countBadge.style.display = "inline-block";
                        } else {
                            countBadge.style.display = "none";
                        }
                    }
                })
                .catch(err => {
                    console.log("Cart tracking node sitting at idle condition status:", err.message);
                });
        }
    };

    function cart() {
        window.location.href = "/cart";
    }

    function addToCart(productId) {
        fetch("/cart/add/" + productId, {
            method: "POST"
        })
        .then(response => {
            if (!response.ok) throw new Error("Could not execute target modification context.");
            return response.text();
        })
        .then(data => {
            cartUIController.syncCount();
        })
        .catch(error => {
            console.error("Cart system execution context dropped:", error);
            alert("Please sign in to parse items to your luxury selection layout context.");
            window.location.href = "/login";
        });
    }

    // Fire controllers execution sequence paths
    themeController.init();
    searchController.init();
    cartUIController.syncCount();
</script>
</body>
</html>