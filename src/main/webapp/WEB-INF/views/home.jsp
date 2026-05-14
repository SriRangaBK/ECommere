<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Showroom | CarSell Luxury</title>

    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --bg: #0a0a0c;
            --surface: #121215;
            --card: #16161a;
            --border: rgba(255, 255, 255, 0.08);
            --accent: #d4af37; /* More refined gold */
            --accent-glow: rgba(212, 175, 55, 0.2);
            --text-primary: #f8f6f2;
            --text-secondary: #a1a1aa;
            --navbar-blur: rgba(10, 10, 12, 0.8);
        }

        body.light {
            --bg: #fdfcf9;
            --surface: #f4f1ea;
            --card: #ffffff;
            --border: rgba(0, 0, 0, 0.06);
            --accent: #926d27;
            --text-primary: #1c1917;
            --text-secondary: #57534e;
            --navbar-blur: rgba(253, 252, 249, 0.9);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background: var(--bg);
            color: var(--text-primary);
            font-family: 'DM Sans', sans-serif;
            transition: background 0.5s ease, color 0.5s ease;
            overflow-x: hidden;
        }

        /* --- Luxury Scrollbar --- */
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: var(--bg); }
        ::-webkit-scrollbar-thumb { background: var(--border); border-radius: 10px; }

        /* --- Navbar --- */
        .navbar {
            background: var(--navbar-blur) !important;
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border-bottom: 1px solid var(--border);
            padding: 0.75rem 2rem;
        }

        .navbar-brand {
            font-family: 'Cormorant Garamond', serif;
            font-weight: 600;
            color: var(--accent) !important;
            letter-spacing: 0.15em;
            text-shadow: 0 0 10px var(--accent-glow);
        }
        .navbar-right{
        	display: flex;
        }
        

        /* --- Content Layout --- */
        .page-container { padding: 100px 5% 60px; }

        .section-header {
            display: flex;
            align-items: baseline;
            gap: 20px;
            margin-bottom: 2rem;
        }

        .section-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: clamp(2rem, 5vw, 3.5rem);
            font-weight: 300;
        }

        /* --- Responsive Grid --- */
        .showroom-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 30px;
        }

        /* --- Product Card --- */
        .card-custom {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 1px; /* Sharper, more architectural look */
            padding: 30px;
            position: relative;
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .card-custom:hover {
            transform: translateY(-10px);
            border-color: var(--accent);
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        .product-tag {
            font-size: 0.65rem;
            text-transform: uppercase;
            color: var(--accent);
            border: 1px solid var(--accent);
            padding: 2px 8px;
            width: fit-content;
            margin-bottom: 1.5rem;
        }

        .product-name {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.75rem;
            line-height: 1.1;
            margin-bottom: 0.5rem;
        }

        .product-brand {
            color: var(--text-secondary);
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .price-container {
            margin-top: auto;
            padding-top: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .price-value {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .btn-action {
            background: none;
            border: 1px solid var(--border);
            color: var(--text-primary);
            padding: 10px 20px;
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            transition: 0.3s;
        }

        .btn-action:hover {
            background: var(--accent);
            color: #000;
            border-color: var(--accent);
        }

        /* --- Modal Refactoring --- */
        .modal-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.9);
            backdrop-filter: blur(10px);
            display: none;
            z-index: 3000;
            place-items: center;
        }

        .modal-content-luxury {
            background: var(--surface);
            border: 1px solid var(--border);
            width: 90%;
            max-width: 500px;
            padding: 40px;
            animation: modalScale 0.4s ease forwards;
        }

        @keyframes modalScale {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        @media (max-width: 768px) {
            .page-container { padding: 80px 1rem 40px; }
            .navbar-right { gap: 8px; }
            .search-input { width: 150px; }
        }
    </style>
</head>

<body>

<header>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">CarSell</a>
            
            <div class="navbar-right">
                <input type="text" id="productSearch" class="form-control search-input d-none d-md-block" placeholder="Filter inventory...">

                <button id="themeToggle" class="btn btn-link text-decoration-none" style="color: var(--accent);">
                    <i class="bi bi-brightness-high"></i>
                </button>

                <div class="cart-icon px-3 py-2" onclick="cartManager.toggleModal()" style="cursor:pointer; color: var(--text-primary); border: 1px solid var(--border);">
                    <i class="bi bi-bag"></i>
                    <span id="cartCount" class="badge bg-transparent text-white" style="font-size: 0.7rem;">0</span>
                </div>

                <c:choose>
                    <c:when test="${not empty user}">
                        <div class="dropdown">
                            <button class="btn-action dropdown-toggle" data-bs-toggle="dropdown">
                                ${user.name}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" style="background: var(--surface); border: 1px solid var(--border);">
                                <li><a class="dropdown-item text-white" href="/profile">My Profile</a></li>
                                <li><hr class="dropdown-divider bg-secondary"></li>
                                <li>
                                    <form action="/logout" method="post" class="m-0">
                                        <button class="dropdown-item text-danger">Logout</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="/login" class="btn-action text-decoration-none">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>

<main class="page-container">
    <div class="section-header">
        <h1 class="section-title">Current Inventory</h1>
        <span class="section-count text-muted" id="countDisplay">${products.size()} models available</span>
    </div>

    <div class="showroom-grid" id="productGrid">
        <c:forEach items="${products}" var="product">
            <div class="product-item" data-name="${product.name.toLowerCase()}" data-brand="${product.brand.toLowerCase()}">
                <div class="card-custom">
                    <span class="product-tag">Exclusive</span>
                    <a href="/product/${product.id}" class="text-decoration-none text-reset">
                        <h2 class="product-name">${product.name}</h2>
                        <p class="product-brand">${product.brand}</p>
                    </a>
                    
                    <div class="price-container">
                        <div class="price-value">₹ ${product.price}</div>
                        <button class="btn-action" onclick="cartManager.addItem('${product.id}', '${product.name}', ${product.price}, this)">
                            Select
                        </button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<!-- Cart Modal -->
<div id="cartModal" class="modal-overlay">
    <div class="modal-content-luxury">
        <h2 class="section-title mb-4" style="font-size: 2rem;">Selection</h2>
        <div id="cartItems" class="mb-4" style="max-height: 40vh; overflow-y: auto;">
            <!-- Dynamic items -->
        </div>
        <div class="d-flex justify-content-between border-top border-secondary pt-3 mb-4">
            <span class="text-muted">Subtotal</span>
            <span id="cartTotal" class="h5">₹ 0</span>
        </div>
        <div class="d-flex gap-2">
            <button class="btn-action w-100" style="background: var(--accent); color: #000;" onclick="alert('Redirecting to secure payment...')">Finalize</button>
            <button class="btn-action w-100" onclick="cartManager.toggleModal()">Close</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    /**
     * Theme Controller
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
     * Search Controller
     */
    const searchController = {
        init() {
            const input = document.getElementById('productSearch');
            const items = document.querySelectorAll('.product-item');
            const counter = document.getElementById('countDisplay');

            input.addEventListener('input', (e) => {
                const query = e.target.value.toLowerCase();
                let visible = 0;

                items.forEach(item => {
                    const match = item.dataset.name.includes(query) || item.dataset.brand.includes(query);
                    item.style.display = match ? 'block' : 'none';
                    if (match) visible++;
                });

                counter.innerText = `\${visible} models found`;
            });
        }
    };

    /**
     * Cart Manager (Modular)
     */
    const cartManager = {
        data: JSON.parse(localStorage.getItem('carsell_cart')) || [],

        addItem(id, name, price, btn) {
            const existing = this.data.find(i => i.id === id);
            if (existing) existing.qty++;
            else this.data.push({ id, name, price, qty: 1 });

            this.sync();
            btn.innerText = "Added";
            setTimeout(() => btn.innerText = "Select", 1000);
        },

        removeItem(index) {
            this.data.splice(index, 1);
            this.sync();
            this.render();
        },

        sync() {
            localStorage.setItem('carsell_cart', JSON.stringify(this.data));
            document.getElementById('cartCount').innerText = this.data.length;
        },

        toggleModal() {
            const modal = document.getElementById('cartModal');
            const isOpen = modal.style.display === 'grid';
            modal.style.display = isOpen ? 'none' : 'grid';
            if (!isOpen) this.render();
        },

        render() {
            const container = document.getElementById('cartItems');
            const totalEl = document.getElementById('cartTotal');
            let total = 0;

            container.innerHTML = this.data.length ? '' : '<p class="text-muted italic">No selections made.</p>';

            this.data.forEach((item, idx) => {
                total += item.price * item.qty;
                const div = document.createElement('div');
                div.className = "d-flex justify-content-between align-items-center mb-3";
                div.innerHTML = `
                    <div>
                        <div class="small text-uppercase text-muted" style="font-size:0.6rem;">\${item.qty}x</div>
                        <div>\${item.name}</div>
                    </div>
                    <div class="text-end">
                        <div>₹ \${(item.price * item.qty).toLocaleString()}</div>
                        <i class="bi bi-x-circle text-danger" style="cursor:pointer" onclick="cartManager.removeItem(\${idx})"></i>
                    </div>
                `;
                container.appendChild(div);
            });

            totalEl.innerText = `₹ \${total.toLocaleString()}`;
        }
    };

    // Initialize all
    themeController.init();
    searchController.init();
    cartManager.sync();
</script>

</body>
</html>