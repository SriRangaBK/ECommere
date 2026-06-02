<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${user.name} | CarSell Luxury Profile</title>
    
    <!-- Design Assets -->
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --bg: #0a0a0c;
            --surface: #121215;
            --card: #16161a;
            --border: rgba(255, 255, 255, 0.08);
            --accent: #d4af37; /* Refined gold */
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
            padding-top: 100px;
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
            background: var(--card);
            border: 1px solid var(--border);
            color: var(--text-primary);
            padding: 15px 20px;
            border-radius: 2px;
            width: 100%;
            margin-bottom: 20px;
            transition: 0.3s;
        }

        .luxury-input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 15px rgba(212, 175, 55, 0.1);
            background: var(--surface);
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
            text-decoration: none;
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
            border-radius: 1px;
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

        /* --- Main Layout --- */
        .profile-container {
            display: flex;
            min-height: 100vh;
        }

        /* --- Sidebar --- */
        .profile-sidebar {
            width: 320px;
            background: var(--surface);
            border-right: 1px solid var(--border);
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            position: sticky;
            top: 100px;
            height: calc(100vh - 100px);
        }

        .user-brand {
            margin-bottom: 50px;
        }

        .user-brand h2 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2rem;
            color: var(--accent);
            margin: 0;
        }

        .user-brand p {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            color: var(--text-secondary);
        }

        .nav-link-custom {
            background: none;
            border: none;
            color: var(--text-secondary);
            text-align: left;
            padding: 15px 0;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.15em;
            transition: all 0.4s ease;
            width: 100%;
            display: flex;
            align-items: center;
            gap: 15px;
            border-bottom: 1px solid transparent;
        }

        .nav-link-custom i { font-size: 1.1rem; }

        .nav-link-custom:hover, .nav-link-custom.active {
            color: var(--accent);
            padding-left: 10px;
            border-bottom: 1px solid var(--border);
        }

        /* --- Content Area --- */
        .profile-content {
            flex-grow: 1;
            padding: 40px 10%;
            background: var(--bg);
        }

        .content-section {
            display: none;
            animation: sectionFade 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }

        .content-section.active { display: block; }

        .section-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 3rem;
            font-weight: 300;
            margin-bottom: 40px;
        }

        .address-view-card {
            background: var(--surface);
            border: 1px solid var(--border);
            padding: 30px;
            position: relative;
            margin-bottom: 2rem;
        }

        .address-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .addr-group label {
            display: block;
            font-size: 0.6rem;
            text-transform: uppercase;
            color: var(--accent);
            letter-spacing: 1px;
            margin-bottom: 5px;
        }

        .addr-group p {
            margin: 0;
            font-size: 0.95rem;
            color: var(--text-primary);
        }

        .order-ledger-card {
            background: var(--surface);
            border: 1px solid var(--border);
            padding: 2.5rem;
            margin-bottom: 2rem;
            transition: 0.3s ease-in-out;
        }

        .order-ledger-card:hover {
            border-color: var(--accent);
        }

        .status-pill-container {
            display: flex;
            gap: 10px;
        }

        .status-badge {
            font-size: 0.6rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 4px 10px;
            border: 1px solid var(--border);
            border-radius: 2px;
        }

        /* Status Specific Colors */
        .status-shipped, .status-paid { 
            color: #4ade80; 
            border-color: #4ade80; 
        }

        .status-pending { 
            color: var(--accent); 
            border-color: var(--accent); 
        }

        .status-cancelled, .status-failed { 
            color: #f87171; 
            border-color: #f87171; 
        }

        .order-footer {
            border-top: 1px solid var(--border);
            padding-top: 1.5rem;
            margin-top: 1rem;
        }

        /* --- Luxury Form Elements --- */
        .form-label {
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--accent);
            margin-bottom: 10px;
        }

        .btn-luxury {
            background: var(--accent);
            color: #000;
            border: none;
            padding: 15px 40px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            cursor: pointer;
            transition: 0.4s;
            margin-top: 20px;
        }

        .btn-luxury:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.4);
        }

        /* --- Animations --- */
        @keyframes sectionFade {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 992px) {
            .profile-container { flex-direction: column; }
            .profile-sidebar { width: 100%; height: auto; padding: 40px 20px; position: static; }
        }
    </style>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">CarSell</a>
            
            <!-- Fixed bootstrap dynamic attribute structure path binding target -->
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navContent" style="color: var(--accent);">
                <i class="bi bi-list"></i>
            </button>

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

                    <c:if test="${not empty user && user.role == 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="/add_product">Add Product</a></li>
                    </c:if>
                </ul>
            </div>

            <div class="navbar-right d-flex align-items-center gap-2">
                <input type="text" id="productSearch" class="form-control search-input d-none d-md-block text-white" placeholder="Filter inventory..." style="background: var(--card); border: 1px solid var(--border);">

                <button id="themeToggle" class="btn btn-link text-decoration-none" style="color: var(--accent);">
                    <i class="bi bi-brightness-high" id="themeIcon"></i>
                </button>

                <div class="cart-icon px-3 py-2" onclick="cart()" id="cartContainer" style="cursor:pointer; color: var(--text-primary); border: 1px solid var(--border); display: flex; align-items: center; gap: 8px; border-radius: 8px;">
                    <i class="bi bi-bag"></i>
                    <span id="cartCount" class="badge rounded-pill bg-danger text-white" style="font-size: 0.7rem; padding: 4px 7px; display:none;">0</span>
                </div>

                <c:choose>
                    <c:when test="${not empty user}">
                        <div class="dropdown">
                            <button class="btn-action dropdown-toggle" data-bs-toggle="dropdown" style="text-transform: uppercase; letter-spacing: 1px;">
                                <i class="bi bi-person-circle"></i> ${user.name}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" style="background: var(--surface); border: 1px solid var(--border);">
                                <li><a class="dropdown-item text-white" href="/profile">My Profile</a></li>
                                <li><hr class="dropdown-divider bg-secondary"></li>
                                <li>
                                    <form action="/logout" method="post" class="m-0">
                                        <button class="dropdown-item text-danger border-0 bg-transparent w-100 text-start">Logout</button>
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

<div class="profile-container">
    <aside class="profile-sidebar">
        <div class="user-brand">
            <h2>${user.name}</h2>
            <p>Member Since 2026</p>
        </div>

        <nav class="d-flex flex-column gap-2">
            <button class="nav-link-custom active" onclick="showSection('details', this)">
                <i class="bi bi-person"></i> Personal Details
            </button>
            <button class="nav-link-custom" onclick="showSection('address', this)">
                <i class="bi bi-geo-alt"></i> Manage Address
            </button>
            <button class="nav-link-custom" onclick="showSection('orders', this)">
                <i class="bi bi-box-seam"></i> My Orders
            </button>
            
            <div class="mt-5">
                <form action="/logout" method="post">
                    <button class="nav-link-custom text-danger border-0 bg-transparent">
                        <i class="bi bi-box-arrow-right"></i> Sign Out
                    </button>
                </form>
            </div>
        </nav>
    </aside>

    <main class="profile-content">
        <!-- Section: Personal Details -->
        <div id="details" class="content-section active">
            <h1 class="section-title">Account Details</h1>
            <div class="row">
                <div class="col-md-8">
                    <div class="mb-4">
                        <label class="form-label">Account Holder</label>
                        <p class="h4" style="font-family: 'Cormorant Garamond', serif;">${user.name}</p>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Registered Email</label>
                        <p class="h4" style="font-family: 'Cormorant Garamond', serif;">${user.email}</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section: Address Form -->
        <div id="address" class="content-section">
            <h1 class="section-title">Shipping Context</h1>

            <c:choose>
                <c:when test="${not empty address}">
                    <div id="addressDisplay" class="address-view-card">
                        <div class="d-flex justify-content-between align-items-start mb-4">
                            <div>
                                <span class="product-tag">Registered Location</span>
                                <c:if test="${address['default']}">
                                    <span class="ms-2" style="color: var(--accent); font-size: 0.7rem;">
                                        <i class="bi bi-patch-check-fill"></i> PRIMARY
                                    </span>
                                </c:if>
                            </div>
                            <button class="btn-action" onclick="toggleAddressForm()">Edit Record</button>
                        </div>

                        <div class="address-details">
                            <h3 class="h5 mb-1" style="font-family: 'Cormorant Garamond', serif; letter-spacing: 1px;">
                                ${user.name}
                            </h3>
                            <p class="text-secondary mb-3">${address.phone}</p>
                            
                            <div class="address-grid">
                                <div class="addr-group">
                                    <label>Street</label>
                                    <p>${address.street}</p>
                                </div>
                                <div class="addr-group">
                                    <label>Location</label>
                                    <p>${address.city}, ${address.state} - ${address.pincode}</p>
                                </div>
                                <div class="addr-group">
                                    <label>Country</label>
                                    <p>${address.country}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>

                <c:otherwise>
                    <div id="noAddressView" class="text-center p-5 mb-4" style="border: 1px dashed var(--border);">
                        <p class="text-secondary italic">No shipping records found for this account.</p>
                        <button class="btn-luxury mt-3" onclick="toggleAddressForm()">Add New Address</button>
                    </div>
                </c:otherwise>
            </c:choose>

            <div id="addressFormContainer" style="display: none;">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="h4" style="font-family: 'Cormorant Garamond', serif;">Modify Records</h2>
                    <button class="btn btn-link text-white p-0 text-decoration-none" onclick="toggleAddressForm()">Cancel</button>
                </div>

                <form action="api/users/address" method="post" style="max-width: 750px;">
                    <input type="hidden" name="id" value="${address.id}">
                    
                    <div class="row">
                        <div class="col-12">
                            <label class="form-label">Street Address</label>
                            <input type="text" name="street" class="luxury-input" value="${address.street}" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">City</label>
                            <input type="text" name="city" class="luxury-input" value="${address.city}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">State / Province</label>
                            <input type="text" name="state" class="luxury-input" value="${address.state}" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Postal Code</label>
                            <input type="number" name="pincode" class="luxury-input" value="${address.pincode}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Country</label>
                            <input type="text" name="country" class="luxury-input" value="${address.country}" required>
                        </div>

                        <div class="col-md-12">
                            <label class="form-label">Contact Number</label>
                            <input type="tel" name="phone" class="luxury-input" value="${address.phone}" required>
                        </div>

                        <div class="col-12 mt-3">
                            <div class="form-check custom-option">
                                <input class="form-check-input" type="checkbox" name="default" id="isDefault" value="true" <c:if test="${address['default']}">checked</c:if>>
                                <label class="form-check-label text-secondary small text-uppercase" for="isDefault">
                                    Set as primary shipping address
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn-luxury">Save Changes</button>
                </form>
            </div>
        </div>

        <!-- Section: Orders -->
        <div id="orders" class="content-section">
            <h1 class="section-title">Order Ledger</h1>

            <c:choose>
                <c:when test="${not empty orders}">
                    <c:forEach items="${orders}" var="o">
                        <div class="order-ledger-card mb-5">
                            <div class="order-header d-flex justify-content-between align-items-start">
                                <div class="order-meta">
                                    <span class="order-id">REF: #CAR-${o.id}</span>
                                    <div class="status-pill-container mt-2">
                                        <span class="status-badge status-${o.orderStatus.toLowerCase()}">
                                            ${o.orderStatus}
                                        </span>
                                        <span class="status-badge status-${o.paymentStatus.toLowerCase()}">
                                            PAY: ${o.paymentStatus}
                                        </span>
                                    </div>
                                </div>
                                <div class="order-date-ui text-end">
                                    <p class="text-secondary small mb-0">Total Amount</p>
                                    <p class="price-value" style="font-size: 1.8rem; color: var(--accent);">
                                        ₹${o.totalAmount}
                                    </p>
                                </div>
                            </div>

                            <div class="order-items-list py-3">
                                <label class="product-tag mb-3" style="border: none; padding-left: 0;">Vehicle Manifest</label>
                                
                                <c:forEach items="${orderMap[o.id]}" var="item">
                                    <div class="order-item-row d-flex justify-content-between align-items-center mb-3">
                                        <div class="d-flex align-items-center gap-3">
                                            <div>
                                                <h4 class="h6 mb-0 text-primary" style="letter-spacing: 1px;">
                                                    ${item.product.name}
                                                </h4>
                                                <p class="text-secondary m-0" style="font-size: 0.75rem; text-transform: uppercase;">
                                                    ${item.product.brand} &middot; Qty: ${item.quantity}
                                                </p>
                                            </div>
                                        </div>
                                        <div class="text-end">
                                            <span class="text-primary small" style="font-family: 'Cormorant Garamond', serif; font-size: 1.1rem;">
                                                ₹${item.priceAtPurchase}
                                            </span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="order-body pt-4 border-top">
                                <div class="row align-items-center">
                                    <div class="col-md-7">
                                        <label class="text-accent small text-uppercase" style="letter-spacing: 2px; font-size: 0.6rem; display: block; margin-bottom: 5px;">Delivery Destination</label>
                                        <p class="text-primary mb-1">${o.address.street}</p>
                                        <p class="text-secondary small m-0">
                                            ${o.address.city}, ${o.address.state} ${o.address.pincode}
                                        </p>
                                    </div>
                                    <div class="col-md-5 text-md-end mt-3 mt-md-0">
                                         <a href="/profile/invoice/${o.id}" class="btn-action w-100 d-inline-block text-center text-decoration-none">
                                            <i class="bi bi-file-earmark-pdf"></i> Download Manifest
                                         </a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="order-footer mt-4">
                                <p class="m-0 fst-italic small text-muted">
                                    Secured acquisition for User: ${user.name} (${o.user.email}). 
                                    Transaction linked to Address Ref: ${o.address.id}.
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <div class="p-5 text-center" style="border: 1px dashed var(--border);">
                        <i class="bi bi-archive text-muted mb-3" style="font-size: 2rem;"></i>
                        <p class="text-secondary fst-italic">No vehicle orders have been processed yet.</p>
                        <a href="/" class="btn-action mt-3 d-inline-block text-decoration-none">Browse Inventory</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
function cart() {
    window.location.href = "/cart";
}

function showSection(sectionId, btnElement) {
    const sections = document.querySelectorAll('.content-section');
    sections.forEach(section => {
        section.classList.remove('active');
    });

    const buttons = document.querySelectorAll('.nav-link-custom');
    buttons.forEach(btn => {
        btn.classList.remove('active');
    });

    document.getElementById(sectionId).classList.add('active');
    btnElement.classList.add('active');
}

function toggleAddressForm() {
    const displayCard = document.getElementById('addressDisplay');
    const emptyView = document.getElementById('noAddressView');
    const formContainer = document.getElementById('addressFormContainer');
    
    if (formContainer.style.display === 'none') {
        if (displayCard) displayCard.style.display = 'none';
        if (emptyView) emptyView.style.display = 'none';
        formContainer.style.display = 'block';
    } else {
        if (displayCard) displayCard.style.display = 'block';
        if (emptyView) emptyView.style.display = 'block';
        formContainer.style.display = 'none';
    }
}

const themeController = {
    init() {
        const saved = localStorage.getItem('carsell_theme');
        const icon = document.getElementById('themeIcon');
        
        if (saved === 'light') {
            document.body.classList.add('light');
            if (icon) icon.classList.replace('bi-brightness-high', 'bi-moon');
        }
        
        document.getElementById('themeToggle').addEventListener('click', () => {
            const isLight = document.body.classList.toggle('light');
            localStorage.setItem('carsell_theme', isLight ? 'light' : 'dark');
            
            if (icon) {
                if (isLight) {
                    icon.classList.replace('bi-brightness-high', 'bi-moon');
                } else {
                    icon.classList.replace('bi-moon', 'bi-brightness-high');
                }
            }
        });
    }
};
themeController.init();
</script>
</body>
</html>

