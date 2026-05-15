<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Secure Checkout | CarSell</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;600&family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
	h1, h2, h3, h4, h5, h6, .product-name, .section-title {
    color: var(--text-primary);
}

p, label, .product-brand, .cart-text {
    color: var(--text-secondary);
}

/* Links & Nav Items */
.nav-link {
    color: var(--text-secondary) !important;
    transition: color 0.3s ease;
}

.nav-link:hover, .nav-link.active {
    color: var(--accent) !important;
}

/* Dropdown refinement */
.dropdown-item {
    color: var(--text-primary);
    transition: background 0.2s ease;
}

.dropdown-item:hover {
    background: var(--accent-glow);
    color: var(--accent);
}

/* Form Inputs (Luxury Style) */
.luxury-input {
    background: transparent;
    border: none;
    border-bottom: 1px solid var(--border);
    color: var(--text-primary);
    padding: 10px 0;
    width: 100%;
    transition: border-color 0.3s ease;
}

.luxury-input:focus {
    outline: none;
    border-color: var(--accent);
}
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

        .checkout-container { max-width: 1200px; margin: auto; padding: 40px 20px; }
        
        .section-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.5rem;
            letter-spacing: -1px;
            margin-bottom: 30px;
        }

        .checkout-card {
            background: var(--surface);
            border: 1px solid var(--border);
            padding: 30px;
            margin-bottom: 25px;
        }

        .step-label {
            font-size: 0.65rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: var(--accent);
            display: block;
            margin-bottom: 10px;
        }

        .address-preview {
            border-left: 2px solid var(--accent);
            padding-left: 20px;
            margin-top: 15px;
        }

        /* Summary Sidebar */
        .summary-sidebar {
            background: var(--surface);
            border: 1px solid var(--border);
            padding: 30px;
            position: sticky;
            top: 100px;
        }

        .item-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-size: 0.9rem;
        }

        .total-row {
            border-top: 1px solid var(--border);
            padding-top: 20px;
            margin-top: 20px;
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.5rem;
            color: var(--accent);
        }

        /* Form Inputs */
        .form-control-luxury {
            background: transparent;
            border: none;
            border-bottom: 1px solid var(--border);
            color: var(--text-primary);
            border-radius: 0;
            padding: 12px 0;
            margin-bottom: 20px;
        }

        .form-control-luxury:focus {
            background: transparent;
            box-shadow: none;
            border-color: var(--accent);
            color: var(--text-primary);
        }

        .btn-pay {
            background: var(--accent);
            color: #000;
            border: none;
            width: 100%;
            padding: 18px;
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: 2px;
            font-size: 0.85rem;
            transition: 0.3s;
            margin-top: 20px;
        }

        .btn-pay:hover {
            background: #fff;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">CarSell</a>
            
            <!-- Mobile Toggle Button -->
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-content="#navContent" style="color: var(--accent);">
                <i class="bi bi-list"></i>
            </button>

            <!-- Original Nav Links & Categories (Restored) -->
            <div class="collapse navbar-collapse" id="navContent">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link active" href="/">Home</a></li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                            Categories
                        </a>
                        <ul class="dropdown-menu border-0 shadow" style="background: var(--surface); border: 1px solid var(--border) !important;">
                            <c:forEach items="${categories}" var="category">
                                <li>
                                    <a class="dropdown-item" href="/category/${category.id}" style="color: var(--text-secondary); font-size: 0.8rem; text-transform: uppercase;">
                                        ${category.name}
                                    </a>
                                </li>
                            </c:forEach>
                            <li><hr class="dropdown-divider bg-secondary"></li>
                            <li><a class="dropdown-item" href="/" style="color: var(--accent); font-size: 0.8rem;">VIEW ALL</a></li>
                        </ul>
                    </li>

                    <!-- Admin Link (Restored) -->
                    <c:if test="${not empty user && user.role == 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="/add_product">Add Product</a></li>
                    </c:if>
                </ul>
            </div>

            <!-- Luxury Navbar Right (Updated Styles) -->
            <div class="navbar-right d-flex align-items-center gap-2">
                <input type="text" id="productSearch" class="form-control search-input d-none d-md-block" placeholder="Filter inventory...">

                <button id="themeToggle" class="btn btn-link text-decoration-none" style="color: var(--accent);">
                    <i class="bi bi-brightness-high"></i>
                </button>

                <!-- Cart (Restored functional cartManager call) -->
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
            display:none;
        ">
        0
    </span>

</div>

                <c:choose>
                    <c:when test="${not empty user}">
                        <!-- Luxury Profile Dropdown (Updated Style) -->
                        <div class="dropdown">
                            <button class="btn-action dropdown-toggle" data-bs-toggle="dropdown" style="text-transform: uppercase; letter-spacing: 1px;">
                                <i class="bi bi-person-circle"></i> ${user.name}
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

<div class="checkout-container">
    <div class="row g-5">
        <div class="col-lg-7">
            <h1 class="section-title">Checkout</h1>

            <div class="checkout-card">
                <span class="step-label">01 Customer Information</span>
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="mb-0 text-primary">${user.name}</p>
                        <p class="text-secondary small">${user.email}</p>
                    </div>
                    <i class="bi bi-check-circle-fill text-success"></i>
                </div>
            </div>

            <div class="checkout-card">
                <span class="step-label">02 Delivery Destination</span>
                <c:choose>
                    <c:when test="${not empty address}">
                        <div class="address-preview">
                            <p class="mb-1">${address.street}</p>
                            <p class="mb-0 text-secondary small">${address.city}, ${address.state} ${address.pincode}</p>
                        </div>
                        <div class="mt-3">
                            <a href="/profile" class="text-accent small text-decoration-none">Change Address</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p class="text-danger small">No primary address found on record.</p>
                        <a href="/profile" class="btn-pay py-2 text-center text-decoration-none d-inline-block" style="width: auto; padding: 10px 20px;">Add Address</a>
                    </c:otherwise>
                </c:choose>
            </div>

  <div class="checkout-card">
    <span class="step-label">03 Formal Authorization</span>
    
    <form id="checkoutForm" action="/orders/place" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="py-3">
            <p class="text-primary mb-2" style="letter-spacing: 1px;">Confirm Acquisition</p>
            <p class="text-secondary small italic mb-4">
                This is a simulated transaction. By proceeding, you are authorizing the system to 
                finalize your order manifest and allocate the inventory to your profile.
            </p>
            
            <div class="form-check custom-check mb-3">
                <input class="form-check-input" type="checkbox" id="terms" required 
                       style="border-color: var(--accent); ">
                <label class="form-check-label text-secondary small" for="terms">
                    I confirm that the delivery details provided are correct.
                </label>
            </div>
            
            <div class="form-check custom-check">
                <input class="form-check-input" type="checkbox" id="auth" required 
                       style="border-color: var(--accent); ">
                <label class="form-check-label text-secondary small" for="auth">
                    I agree to the simulated acquisition terms.
                </label>
            </div>
        </div>
    </form>
</div>

        <div class="col-lg-5">
            <div class="summary-sidebar">
                <span class="step-label">Order Manifest</span>
                
                <div class="order-items-mini mb-4">
                    <c:forEach items="${orderItems}" var="item">
                        <div class="item-row">
                            <span class="text-secondary">${item.quantity}x ${item.product.name}</span>
                            <span class="text-primary">₹${item.priceAtPurchase}</span>
                        </div>
                    </c:forEach>
                </div>

                <div class="costs">
                    <div class="item-row">
                        <span class="text-secondary">Subtotal</span>
                        <span class="text-primary">₹${subtotal}</span>
                    </div>
                    <div class="item-row">
                        <span class="text-secondary">Shipping & Handling</span>
                        <span class="text-primary">₹${shipping}</span>
                    </div>
                    <div class="item-row">
                        <span class="text-secondary">GST (18%)</span>
                        <span class="text-primary">₹<fmt:formatNumber value="${tax}" maxFractionDigits="2"/></span>
                    </div>
                    
                    <div class="total-row d-flex justify-content-between">
                        <span>Grand Total</span>
                        <span>₹<fmt:formatNumber value="${grandTotal}" maxFractionDigits="2"/></span>
                    </div>
                </div>

                <button type="submit" form="checkoutForm" class="btn-pay">
                    Complete Acquisition <i class="bi bi-lock-fill ms-2"></i>
                </button>
                
                <p class="text-center mt-4 text-muted" style="font-size: 0.6rem; letter-spacing: 1px; text-transform: uppercase;">
                    Verified Secure Transaction &middot; CarSell Financial Services
                </p>
            </div>
        </div>
    </div>
</div>
<script>
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
themeController.init();
</script>
</body>
</html>