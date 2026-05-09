<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${selectedCategory} | CarSell</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- REUSE THE CSS FROM YOUR HOME PAGE HERE -->
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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: var(--bg);
            color: var(--text-primary);
            font-family: 'DM Sans', sans-serif;
            min-height: 100vh;
            padding-top: 70px;
            transition: 0.4s ease;
        }

        body::before {
            content: '';
            position: fixed;
            inset: 0;

            background-image:
                    url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");

            pointer-events: none;
            z-index: 0;
            opacity: 0.4;
        }

        /* Navbar */

        .navbar {
            background: var(--navbar-bg) !important;

            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);

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
            padding: 6px 14px !important;
        }

        .nav-link:hover,
        .nav-link.active {
            color: var(--text-primary) !important;
        }

        .navbar-right {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-left: auto;
        }

        /* Theme Button */

        .theme-btn {
            width: 38px;
            height: 38px;

            border-radius: 8px;
            border: 1px solid var(--border);

            background: var(--surface);
            color: var(--text-secondary);

            display: flex;
            align-items: center;
            justify-content: center;

            cursor: pointer;

            transition: 0.25s ease;
        }

        .theme-btn:hover {
            color: var(--accent);
            border-color: var(--accent);
            transform: rotate(15deg);
        }

        /* Search */

        .search-input {
            width: 220px;
            height: 38px;

            background: var(--surface) !important;
            border: 1px solid var(--border) !important;

            color: var(--text-primary) !important;

            border-radius: 8px;
            font-size: 0.8rem;
        }

        .search-input::placeholder {
            color: var(--text-secondary);
        }

        /* Cart */

        .cart-icon {
            position: relative;

            display: flex;
            align-items: center;
            gap: 8px;

            padding: 8px 14px;

            border-radius: 8px;
            border: 1px solid var(--border);

            background: var(--surface);

            cursor: pointer;

            color: var(--text-secondary);

            transition: 0.25s ease;
        }

        .cart-icon:hover {
            border-color: var(--accent);
            color: var(--accent);
        }

        .cart-text {
            font-size: 0.78rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
        }

        .cart-badge {
            position: absolute;
            top: -6px;
            right: -6px;

            width: 18px;
            height: 18px;

            border-radius: 50%;

            background: var(--accent);
            color: var(--btn-text);

            font-size: 0.65rem;
            font-weight: bold;

            display: none;
            align-items: center;
            justify-content: center;
        }

        /* Section */

        .section-header {
            padding: 40px 48px 10px;

            display: flex;
            align-items: center;
            gap: 16px;
        }

        .section-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.3rem;
            font-weight: 300;
        }

        .section-line {
            flex: 1;
            height: 1px;
            background: linear-gradient(to right, var(--border), transparent);
        }

        .section-count {
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        /* Grid */

        .grid {
            display: flex;
            flex-wrap: wrap;
            gap: 24px;

            padding: 30px 48px 60px;
        }

        /* Cards */

        .product-link {
            text-decoration: none;
            color: inherit;
        }

        .card-custom {
            width: 285px;

            background: var(--card);

            border: 1px solid var(--border);
            border-radius: 14px;

            padding: 22px;

            transition: 0.3s ease;

            animation: fadeUp 0.5s ease both;
        }

        .card-custom:hover {
            transform: translateY(-5px);

            border-color: rgba(201,169,110,0.30);

            box-shadow: 0 12px 30px var(--shadow-card);
        }

        .product-tag {
            font-size: 0.68rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;

            color: var(--accent);
        }

        .product-name {
            margin-top: 10px;

            font-family: 'Cormorant Garamond', serif;
            font-size: 1.35rem;
        }

        .product-brand {
            margin-top: 5px;

            color: var(--text-secondary);
            font-size: 0.82rem;
        }

        .card-divider {
            border-color: var(--border);
            margin: 18px 0;
        }

        .card-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .price {
            display: flex;
            align-items: center;
            gap: 2px;
        }

        .price-value {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.6rem;
            font-weight: 600;
        }

        .btn-custom {
            background: var(--accent);
            color: var(--btn-text);

            border: none;
            border-radius: 8px;

            padding: 9px 16px;

            font-size: 0.70rem;
            font-weight: 600;

            text-transform: uppercase;
            letter-spacing: 0.08em;

            transition: 0.25s ease;
        }

        .btn-custom:hover {
            transform: translateY(-2px);
        }

        /* Modal */

        #cartModal {
            display: none;

            position: fixed;
            inset: 0;

            background: rgba(0,0,0,0.8);

            z-index: 2000;

            backdrop-filter: blur(10px);

            overflow-y: auto;

            padding: 20px;
        }

        .cart-modal-content {
            max-width: 520px;

            margin: 90px auto;

            background: var(--surface);

            border: 1px solid var(--border);
            border-radius: 14px;

            padding: 35px;
        }
	.cart-product-name {
    color: var(--text-primary) !important;
    font-weight: 700;
    font-size: 1rem;
}
        .modal-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2rem;

            color: var(--accent);

            margin-bottom: 24px;
        }
        /* Dropdown Styling */
.dropdown-item:hover {
    background-color: var(--accent-dim) !important;
    color: var(--accent) !important;
}

.dropdown-menu {
    margin-top: 10px !important;
    border-radius: 10px !important;
}

/* Ensure the arrow changes color based on theme */
.nav-link.dropdown-toggle::after {
    color: var(--text-secondary);
}

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media(max-width: 768px) {

            .grid {
                justify-content: center;
                padding: 25px;
            }

            .section-header {
                padding: 30px 25px 0;
            }

            .search-input {
                width: 160px;
            }

            .navbar {
                padding: 0 15px;
            }
        }

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
                        <a class="nav-link dropdown-toggle active" href="#" data-bs-toggle="dropdown">Categories</a>
                        <ul class="dropdown-menu shadow">
                            <c:forEach items="${categories}" var="cat">
                                <li><a class="dropdown-item" href="/category/${cat.id}">${cat.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="/add_product">Add Product</a></li>
                </ul>
                <div class="navbar-right">
                    <div class="cart-icon" onclick="viewCart()">
                        <i class="bi bi-bag"></i><span id="cartCount" class="cart-badge">0</span>
                    </div>
                    <button class="theme-btn" id="themeToggle"><i class="bi bi-sun-fill"></i></button>
                    <input class="search-input form-control" id="productSearch" type="search" placeholder="Search ${selectedCategory}...">
                </div>
            </div>
        </div>
    </nav>
</header>

<div class="section-header">
    <h1 class="section-title">${selectedCategory}</h1>
    <div class="section-line"></div>
    <span class="section-count" id="countDisplay">${products.size()} items found</span>
</div>

<div class="grid" id="productGrid">
    <c:forEach items="${products}" var="product">
        <div class="product-link" data-name="${product.name.toLowerCase()}" data-brand="${product.brand.toLowerCase()}">
            <div class="card-custom">
                <a href="/product/${product.id}" style="text-decoration:none;color:inherit;">
                    <span class="product-tag">${product.brand}</span>
                    <div class="product-name">${product.name.toUpperCase()}</div>
                </a>
                <hr class="card-divider">
                <div class="card-bottom">
                    <div class="price">
                        <span><i class="bi bi-currency-rupee"></i></span>
                        <span class="price-value">${product.price}</span>
                    </div>
                    <button type="button" class="btn-custom" onclick="addToCart('${product.id}', '${product.name}', '${product.price}', this)">
                        Add To Cart
                    </button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>



<div id="cartModal">

    <div class="cart-modal-content">

        <h2 class="modal-title">Your Selection</h2>

        <div id="cartItems"
             style="max-height:300px;overflow-y:auto;margin-bottom:20px;">

        </div>

        <div style="
            border-top:1px solid var(--border);
            padding-top:16px;

            display:flex;
            justify-content:space-between;
            align-items:center;
        ">

            <span style="color:var(--text-secondary);">
                Total
            </span>

            <span id="cartTotal"
                  style="font-weight:bold;">

                ₹ 0

            </span>

        </div>

        <div class="mt-4 d-flex gap-2">

            <button class="btn-custom"
                    style="flex:1;"
                    onclick="alert('Proceeding to checkout...')">

                Checkout

            </button>

            <button class="btn-custom"
                    style="
                        flex:1;
                        background:transparent;
                        color:var(--text-secondary);
                        border:1px solid var(--border);
                    "
                    onclick="closeCart()">

                Close

            </button>

        </div>

    </div>

</div>
<!-- Cart Modal & Scripts (Theme, Cart logic) must be pasted here too -->
<script>

    // Theme

    const body = document.body;

    const themeToggle = document.getElementById('themeToggle');

    const icon = themeToggle.querySelector('i');

    if (localStorage.getItem('theme') === 'light') {

        body.classList.add('light');

        icon.classList.replace(
            'bi-sun-fill',
            'bi-moon-stars-fill'
        );
    }

    themeToggle.addEventListener('click', () => {

        body.classList.toggle('light');

        const isLight = body.classList.contains('light');

        if (isLight) {

            icon.classList.replace(
                'bi-sun-fill',
                'bi-moon-stars-fill'
            );

            localStorage.setItem('theme', 'light');

        } else {

            icon.classList.replace(
                'bi-moon-stars-fill',
                'bi-sun-fill'
            );

            localStorage.setItem('theme', 'dark');
        }
    });

    // Search

    const searchInput = document.getElementById('productSearch');

    const productLinks = document.querySelectorAll('.product-link');

    const countDisplay = document.getElementById('countDisplay');

    searchInput.addEventListener('input', (e) => {

        const query = e.target.value.toLowerCase().trim();

        let visibleCount = 0;

        productLinks.forEach(link => {

            const name = link.getAttribute('data-name');

            const brand = link.getAttribute('data-brand');

            if (
                name.includes(query) ||
                brand.includes(query)
            ) {

                link.style.display = 'block';

                visibleCount++;

            } else {

                link.style.display = 'none';
            }
        });

        countDisplay.innerText = visibleCount + ' items';
    });

    // Cart

    let cart =
        JSON.parse(
            localStorage.getItem('carsell_cart')
        ) || [];

    function saveCart() {

        localStorage.setItem(
            'carsell_cart',
            JSON.stringify(cart)
        );
    }

    function updateCartUI() {

        const countElement =
            document.getElementById('cartCount');

        countElement.innerText = cart.length;

        if (cart.length > 0) {

            countElement.style.display = 'flex';

        } else {

            countElement.style.display = 'none';
        }

        saveCart();
    }

    function addToCart(id, name, price, button) {

        const existingItem = cart.find(
            item => item.id === id
        );

        if (existingItem) {

            existingItem.quantity += 1;

        } else {

            cart.push({
                id: id,
                name: name,
                price: Number(price),
                quantity: 1
            });
        }

        localStorage.setItem(
            'carsell_cart',
            JSON.stringify(cart)
        );

        updateCartUI();

        button.innerText = 'Added';

        setTimeout(() => {

            button.innerText = 'Add To Cart';

        }, 1000);
    }

    function viewCart() {

        const modal =
            document.getElementById('cartModal');

        const itemsContainer =
            document.getElementById('cartItems');

        const totalElement =
            document.getElementById('cartTotal');

        itemsContainer.innerHTML = '';

        let total = 0;

        if (cart.length === 0) {

            itemsContainer.innerHTML = `
                <p style="
                    color: var(--text-muted);
                    font-style: italic;
                ">
                    Your cart is empty.
                </p>
            `;

        } else {

            cart.forEach((item, index) => {

                const itemTotal =
                    Number(item.price) * Number(item.quantity);

                total += itemTotal;

                const row = document.createElement('div');

                row.style.display = 'flex';
                row.style.justifyContent = 'space-between';
                row.style.alignItems = 'center';
                row.style.padding = '14px 0';
                row.style.borderBottom =
                    '1px solid var(--border)';

                row.innerHTML = `

                    <div>

                	<div class="cart-product-name">
                    \${item.name}
                	</div>

                        <div style="
                            color: var(--text-secondary);
                            font-size: 0.82rem;
                        ">
                            Qty: \${item.quantity}
                        </div>

                    </div>

                    <div style="
                        text-align: right;
                        color: var(--text-primary);
                    ">

                        <div>
                            ₹ \${itemTotal.toFixed(2)}
                        </div>

                        <i
                            class="bi bi-trash"
                            onclick="removeFromCart(${index})"
                            style="
                                color: #ff5c5c;
                                cursor: pointer;
                                margin-top: 6px;
                                display: inline-block;
                            ">
                        </i>

                    </div>
                `;

                itemsContainer.appendChild(row);
            });
        }

        totalElement.innerText =
            '₹ ' + total.toFixed(2);

        modal.style.display = 'block';
    }

    function removeFromCart(index) {

        cart.splice(index, 1);

        updateCartUI();

        viewCart();
    }

    function closeCart() {

        document.getElementById('cartModal')
            .style.display = 'none';
    }

    window.onclick = function(event) {

        const modal =
            document.getElementById('cartModal');

        if (event.target === modal) {

            closeCart();
        }
    };

    updateCartUI();

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>