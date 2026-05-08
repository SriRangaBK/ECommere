<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>Products</title>

    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
    </script>

    <style>

        /* ── Dark theme (default) ── */
        :root {
            --bg:             #0c0c0e;
            --surface:        #131316;
            --card:           #18181c;
            --border:         rgba(255, 255, 255, 0.07);
            --accent:         #c9a96e;
            --accent-dim:     rgba(201, 169, 110, 0.12);
            --text-primary:   #f0ede8;
            --text-secondary: #8a8882;
            --text-muted:     #555450;
            --navbar-bg:      rgba(12, 12, 14, 0.88);
            --shadow-card:    rgba(0, 0, 0, 0.4);
            --btn-text:       #0c0c0e;
        }

        /* ── Light theme ── */
        body.light {
            --bg:             #f7f4ef;
            --surface:        #edeae4;
            --card:           #ffffff;
            --border:         rgba(0, 0, 0, 0.08);
            --accent:         #a8782e;
            --accent-dim:     rgba(168, 120, 46, 0.10);
            --text-primary:   #1a1814;
            --text-secondary: #6b6660;
            --text-muted:     #a09c98;
            --navbar-bg:      rgba(247, 244, 239, 0.90);
            --shadow-card:    rgba(0, 0, 0, 0.10);
            --btn-text:       #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: var(--bg);
            font-family: 'DM Sans', sans-serif;
            color: var(--text-primary);
            padding-top: 68px;        /* exactly navbar height — no gap */
            min-height: 100vh;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        /* Subtle grain overlay */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
            pointer-events: none;
            z-index: 0;
            opacity: 0.4;
        }

        /* ── Navbar ── */
        .navbar {
            background: var(--navbar-bg) !important;
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border);
            padding: 0 32px;
            height: 68px;
            transition: background 0.3s ease, border-color 0.3s ease;
        }

        /* Align all right-side navbar items vertically */
        .navbar-collapse {
            align-items: center;
        }

        .navbar-right {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-left: auto;
        }

        .navbar-brand {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.6rem;
            font-weight: 600;
            letter-spacing: 0.12em;
            color: var(--accent) !important;
            text-transform: uppercase;
            line-height: 1;
        }

        .nav-link {
            font-size: 0.78rem;
            font-weight: 500;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--text-secondary) !important;
            transition: color 0.2s;
            padding: 6px 14px !important;
            line-height: 1.4;
        }

        .nav-link:hover,
        .nav-link.active {
            color: var(--text-primary) !important;
        }

        .dropdown-menu {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 8px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
            transition: background 0.3s ease;
        }

        .dropdown-item {
            font-size: 0.78rem;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--text-secondary);
            border-radius: 4px;
            padding: 8px 12px;
            transition: all 0.15s;
        }

        .dropdown-item:hover {
            background: var(--accent-dim);
            color: var(--accent);
        }

        /* Theme toggle button */
        .theme-btn {
            border: 1px solid var(--border);
            background: var(--surface);
            color: var(--text-secondary);
            font-size: 1rem;
            width: 36px;
            height: 36px;
            border-radius: 8px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            transition: color 0.2s, background 0.2s, border-color 0.2s, transform 0.15s;
        }

        .theme-btn:hover {
            color: var(--accent);
            border-color: var(--accent);
            transform: rotate(20deg);
        }

        /* Cart + search row */
        .cart-area {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .cart-icon {
            font-size: 0.78rem;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--text-secondary);
            display: flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
            transition: color 0.2s;
            white-space: nowrap;
        }

        .cart-icon:hover {
            color: var(--accent);
        }

        .search-input {
            background: var(--surface) !important;
            border: 1px solid var(--border) !important;
            color: var(--text-primary) !important;
            border-radius: 6px !important;
            font-size: 0.78rem;
            letter-spacing: 0.05em;
            padding: 7px 14px !important;
            width: 190px;
            height: 36px;
            transition: border-color 0.2s, box-shadow 0.2s, background 0.3s;
        }

        .search-input::placeholder {
            color: var(--text-muted) !important;
        }

        .search-input:focus {
            border-color: var(--accent) !important;
            box-shadow: 0 0 0 3px rgba(201, 169, 110, 0.10) !important;
            outline: none;
        }

        .navbar-toggler {
            border-color: var(--border) !important;
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28201, 169, 110, 0.75%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e") !important;
        }

        /* ── Section header ── */
        .section-header {
            padding: 44px 48px 8px;
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .section-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.2rem;
            font-weight: 300;
            letter-spacing: 0.04em;
            color: var(--text-primary);
            white-space: nowrap;
            line-height: 1;
        }

        .section-line {
            flex: 1;
            height: 1px;
            background: linear-gradient(to right, var(--border), transparent);
        }

        .section-count {
            font-size: 0.72rem;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--text-muted);
            white-space: nowrap;
        }

        /* ── Product grid ── */
        .grid {
            display: flex;
            flex-wrap: wrap;
            gap: 24px;
            padding: 28px 48px 60px;
            justify-content: flex-start;
            position: relative;
            z-index: 1;
        }

        .product-link {
            text-decoration: none;
            color: inherit;
            display: block;          /* fixes baseline shift on the <a> wrapper */
        }

        /* nth-child targets <a> wrappers inside .grid */
        .grid > .product-link:nth-child(1)  .card-custom { animation-delay: 0.05s; }
        .grid > .product-link:nth-child(2)  .card-custom { animation-delay: 0.10s; }
        .grid > .product-link:nth-child(3)  .card-custom { animation-delay: 0.15s; }
        .grid > .product-link:nth-child(4)  .card-custom { animation-delay: 0.20s; }
        .grid > .product-link:nth-child(5)  .card-custom { animation-delay: 0.25s; }
        .grid > .product-link:nth-child(6)  .card-custom { animation-delay: 0.30s; }
        .grid > .product-link:nth-child(7)  .card-custom { animation-delay: 0.35s; }
        .grid > .product-link:nth-child(8)  .card-custom { animation-delay: 0.40s; }
        .grid > .product-link:nth-child(9)  .card-custom { animation-delay: 0.45s; }
        .grid > .product-link:nth-child(10) .card-custom { animation-delay: 0.50s; }

        .card-custom {
            width: 280px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 12px;
            overflow: hidden;
            position: relative;
            cursor: pointer;
            transition: transform 0.3s ease,
                        box-shadow 0.3s ease,
                        border-color 0.3s ease,
                        background 0.3s ease;
            animation: fadeUp 0.5s ease both;
        }

        .card-custom::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, rgba(201, 169, 110, 0.06) 0%, transparent 60%);
            opacity: 0;
            transition: opacity 0.3s;
            pointer-events: none;
        }

        .card-custom:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 56px var(--shadow-card);
            border-color: rgba(201, 169, 110, 0.3);
        }

        .card-custom:hover::before {
            opacity: 1;
        }

        .card-top {
            padding: 22px 22px 0;
        }

        .product-tag {
            font-size: 0.60rem;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            color: var(--accent);
            margin-bottom: 8px;
            display: block;
        }

        .product-name {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.3rem;
            font-weight: 400;
            letter-spacing: 0.02em;
            color: var(--text-primary);
            line-height: 1.3;
            margin-bottom: 5px;
        }

        .product-brand {
            font-size: 0.72rem;
            letter-spacing: 0.06em;
            color: var(--text-muted);
            font-style: italic;
        }

        .card-divider {
            margin: 16px 22px;
            border: none;
            border-top: 1px solid var(--border);
        }

        .card-bottom {
            padding: 0 22px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
        }

        .price {
            display: flex;
            align-items: baseline;
            gap: 2px;
            flex-shrink: 0;
        }

        .price-symbol {
            font-size: 0.82rem;
            color: var(--accent);
            font-weight: 500;
            line-height: 1;
        }

        .price-value {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-primary);
            letter-spacing: 0.02em;
            line-height: 1;
        }

        .btn-custom {
            background: var(--accent);
            color: var(--btn-text);
            border: none;
            padding: 9px 16px;
            border-radius: 6px;
            font-family: 'DM Sans', sans-serif;
            font-size: 0.70rem;
            font-weight: 500;
            letter-spacing: 0.10em;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.2s ease;
            white-space: nowrap;
            flex-shrink: 0;
        }

        .btn-custom:hover {
            filter: brightness(1.12);
            box-shadow: 0 4px 18px rgba(201, 169, 110, 0.35);
            transform: translateY(-1px);
        }

        /* Entrance animation */
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(18px); }
            to   { opacity: 1; transform: translateY(0);    }
        }

        /* ── Responsive tweaks ── */
        @media (max-width: 768px) {
            .section-header { padding: 32px 24px 8px; }
            .grid           { padding: 20px 24px 48px; justify-content: center; }
            .navbar         { padding: 0 16px; }
            .navbar-right   { margin-top: 12px; flex-wrap: wrap; justify-content: flex-start; }
        }

    </style>

</head>

<body>

<header>

    <nav class="navbar navbar-expand-lg fixed-top">

        <div class="container-fluid">

            <a class="navbar-brand" href="/">
                CarSell
            </a>

            <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent">

                <span class="navbar-toggler-icon"></span>

            </button>

            <div
                class="collapse navbar-collapse"
                id="navbarSupportedContent">

                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <li class="nav-item">
                        <a class="nav-link active" href="/">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/add_product">Add Product</a>
                    </li>

                    <li class="nav-item dropdown">

                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown">
                            Categories
                        </a>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Cars</a></li>
                            <li><a class="dropdown-item" href="#">Electronics</a></li>
                        </ul>

                    </li>

                </ul>

                <button class="theme-btn">
                    <i class="bi bi-sun-fill"></i>
                </button>

                <div class="cart-area">

                    <div class="cart-icon">
                        <i class="bi bi-bag"></i>
                        Cart
                    </div>

                    <input
                        class="search-input form-control"
                        type="search"
                        placeholder="Search products…">

                </div>

            </div>

        </div>

    </nav>

</header>

<div class="section-header">
    <h1 class="section-title">Collection</h1>
    <div class="section-line"></div>
    <span class="section-count">${products.size()} items</span>
</div>

<div class="grid">

    <c:forEach items="${products}" var="product">

        <a href="/product/${product.id}" class="product-link">

            <div class="card-custom">

                <div class="card-top">

                    <span class="product-tag">Featured</span>

                    <div class="product-name">
                        ${product.name.toUpperCase()}
                    </div>

                    <div class="product-brand">
                        by ${product.brand}
                    </div>

                </div>

                <hr class="card-divider">

                <div class="card-bottom">

                    <div class="price">
                        <span class="price-symbol">
                            <i class="bi bi-currency-rupee"></i>
                        </span>
                        <span class="price-value">${product.price}</span>
                    </div>

                    <button class="btn-custom">Add To Cart</button>

                </div>

            </div>

        </a>

    </c:forEach>

</div>

</body>

</html>
