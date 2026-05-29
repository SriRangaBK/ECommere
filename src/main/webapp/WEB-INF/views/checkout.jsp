<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>Secure Checkout | CarSell</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=DM+Sans:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --bg: #0a0a0c;
            --surface: #121215;
            --card: #16161a;
            --border: rgba(255, 255, 255, 0.08);
            --accent: #d4af37; 
            --accent-glow: rgba(212, 175, 55, 0.12);
            --text-primary: #f8f6f2;
            --text-secondary: #a1a1aa;
            --text-muted: #52525b;
            --navbar-blur: rgba(10, 10, 12, 0.85);
        }

        body.light {
            --bg: #fdfcf9;
            --surface: #f4f1ea;
            --card: #ffffff;
            --border: rgba(0, 0, 0, 0.08);
            --accent: #926d27;
            --accent-glow: rgba(146, 109, 39, 0.08);
            --text-primary: #1c1917;
            --text-secondary: #57534e;
            --text-muted: #a8a29e;
            --navbar-blur: rgba(253, 252, 249, 0.9);
        }
	
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background: var(--bg);
            color: var(--text-primary);
            font-family: 'DM Sans', sans-serif;
            min-height: 100vh;
            padding-top: 100px;
            transition: background 0.4s ease, color 0.4s ease;
            overflow-x: hidden;
        }

        /* Luxury Scrollbar */
        ::-webkit-scrollbar { width: 5px; }
        ::-webkit-scrollbar-track { background: var(--bg); }
        ::-webkit-scrollbar-thumb { background: var(--border); border-radius: 10px; }
        
        h1, h2, h3, h4, h5, h6 { color: var(--text-primary); }
        p, label { color: var(--text-secondary); }

        /* Navbar Refinements */
        .navbar {
            background: var(--navbar-blur) !important;
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border);
            height: 70px;
            padding: 0 30px;
            z-index: 1050;
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
            transition: color 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--accent) !important;
        }

        .dropdown-menu {
            background: var(--surface) !important;
            border: 1px solid var(--border) !important;
            border-radius: 8px;
        }

        .dropdown-item {
            color: var(--text-secondary) !important;
            font-size: 0.8rem;
            text-transform: uppercase;
            transition: all 0.2s ease;
        }

        .dropdown-item:hover {
            background: var(--accent-glow) !important;
            color: var(--accent) !important;
        }

        .btn-action {
            background: transparent;
            border: 1px solid var(--border);
            color: var(--text-secondary);
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 0.75rem;
            font-weight: 500;
            transition: 0.3s ease;
        }

        .btn-action:hover {
            border-color: var(--accent);
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

        /* Checkout Container Layout */
        .checkout-container { max-width: 1150px; margin: auto; padding: 20px 20px 80px; }
        
        .section-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.6rem;
            margin-bottom: 35px;
            color: var(--text-primary);
        }

        .checkout-card {
            background: var(--card);
            border: 1px solid var(--border);
            padding: 35px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .step-label {
            font-size: 0.65rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: var(--accent);
            display: block;
            margin-bottom: 15px;
            font-weight: 700;
        }

        .address-preview {
            border-left: 2px solid var(--accent);
            padding-left: 20px;
            margin-top: 15px;
        }

        /* Summary Sidebar Layout */
        .summary-sidebar {
            background: var(--card);
            border: 1px solid var(--border);
            padding: 35px;
            border-radius: 12px;
            position: sticky;
            top: 100px;
            box-shadow: 0 14px 35px rgba(0,0,0,0.15);
        }

        /* Premium Manifest Row Elements */
        .manifest-row {
            display: flex;
            align-items: center;
            gap: 15px;
            padding-bottom: 15px;
            margin-bottom: 15px;
            border-bottom: 1px solid var(--border);
        }

        .manifest-thumb-frame {
            width: 55px;
            height: 55px;
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 4px;
            flex-shrink: 0;
        }

        .manifest-thumb-frame img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .item-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 0.88rem;
        }

        .total-row {
            border-top: 1px solid var(--border);
            padding-top: 20px;
            margin-top: 20px;
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.6rem;
            font-weight: 600;
            color: var(--accent);
        }

        /* Checkbox Custom Theme */
        .custom-check .form-check-input {
            background-color: transparent;
            border-color: var(--border);
            cursor: pointer;
        }
        .custom-check .form-check-input:checked {
            background-color: var(--accent);
            border-color: var(--accent);
        }

        /* Premium Actions */
        .btn-pay {
            background: var(--accent);
            color: #0c0c0e;
            border: none;
            width: 100%;
            padding: 16px;
            border-radius: 8px;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 2px;
            font-size: 0.8rem;
            transition: 0.3s cubic-bezier(0.25, 1, 0.5, 1);
            margin-top: 20px;
        }

        .btn-pay:hover:not(:disabled) {
            background: #ffffff;
            color: #000000;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">CarSell</a>
            
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navContent" style="color: var(--accent); font-size: 1.5rem;">
                <i class="bi bi-list"></i>
            </button>

            <div class="collapse navbar-collapse" id="navContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                            Categories
                        </a>
                        <ul class="dropdown-menu border-0 shadow">
                            <c:forEach items="${categories}" var="category">
                                <li>
                                    <a class="dropdown-item" href="/category/${category.id}">
                                        ${category.name}
                                    </a>
                                </li>
                            </c:forEach>
                            <li><hr class="dropdown-divider bg-secondary opacity-20"></li>
                            <li><a class="dropdown-item" href="/" style="color: var(--accent) !important;">VIEW ALL</a></li>
                        </ul>
                    </li>

                    <c:if test="${not empty user && user.role == 'admin'}">
                        <li class="nav-item"><a class="nav-link" href="/add_product">Add Product</a></li>
                    </c:if>
                </ul>
            </div>

            <div class="navbar-right d-flex align-items-center gap-3">
                <button id="themeToggle" class="btn btn-link p-0 text-decoration-none" style="color: var(--accent); font-size: 1.1rem;">
                    <i class="bi bi-brightness-high"></i>
                </button>

                <div class="cart-icon px-3 py-2" onclick="window.location.href='/cart'" id="cartContainer" style="cursor:pointer; color: var(--text-primary); border: 1px solid var(--border); display: flex; align-items: center; gap: 8px; border-radius: 8px;">
                    <i class="bi bi-bag"></i>
                    <span id="cartCount" class="badge rounded-pill bg-danger text-white" style="font-size: 0.7rem; padding: 4px 7px; display:none;">0</span>
                </div>

                <c:choose>
                    <c:when test="${not empty user}">
                        <div class="dropdown">
                            <button class="btn-action dropdown-toggle" data-bs-toggle="dropdown" style="text-transform: uppercase; letter-spacing: 1px;">
                                <i class="bi bi-person-circle"></i> ${user.name}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end mt-2">
                                <li><a class="dropdown-item" href="/profile">My Profile</a></li>
                                <li><hr class="dropdown-divider bg-secondary opacity-20"></li>
                                <li>
                                    <form action="/logout" method="post" class="m-0">
                                        <button class="dropdown-item text-danger" type="submit">Logout</button>
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
                        <p class="mb-0 text-primary" style="font-weight: 500;">${user.name}</p>
                        <p class="text-secondary small mb-0">${user.email}</p>
                    </div>
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 1.2rem;"></i>
                </div>
            </div>

            <div class="checkout-card">
                <span class="step-label">02 Delivery Destination</span>
                <div id="addressDisplayContainer">
                    <c:choose>
                        <c:when test="${not empty address}">
                            <div class="address-preview">
                                <p class="mb-1 text-primary" id="currentStreet">${address.street}</p>
                                <p class="mb-0 text-secondary small" id="currentLocationMetrics">${address.city}, ${address.state} ${address.pincode}</p>
                                <c:if test="${not empty address.country}">
                                    <p class="mb-0 text-secondary small text-uppercase mt-1" style="font-size: 0.72rem; letter-spacing: 0.5px; color: var(--accent) !important;">${address.country}</p>
                                </c:if>
                                <c:if test="${not empty address.phone}">
                                    <p class="mb-0 text-muted small mt-1"><i class="bi bi-telephone-fill me-1" style="font-size: 0.7rem;"></i> Contact: ${address.phone}</p>
                                </c:if>
                            </div>
                            <div class="mt-3">
                                <button type="button" class="btn p-0 small text-decoration-none d-flex align-items-center gap-1" style="color: var(--accent); border:none; background:transparent;" data-bs-toggle="modal" data-bs-target="#addressModal">
                                    <i class="bi bi-geo-alt-fill"></i> Change Destination Location
                                </button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p class="text-danger small mb-3" id="noAddressWarning">No primary delivery destination address found on record.</p>
                            <button type="button" class="btn btn-action" data-bs-toggle="modal" data-bs-target="#addressModal">
                                <i class="bi bi-plus-lg me-1"></i> Configure Target Address
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="checkout-card">
                <span class="step-label">03 Formal Authorization</span>
                <form id="checkoutForm" action="/orders/place" method="POST">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="py-1">
                        <p class="text-primary mb-2" style="letter-spacing: 0.5px; font-weight: 500;">Confirm Acquisition</p>
                        <p class="text-secondary small mb-4" style="line-height: 1.6; font-style: italic;">
                            This is a secure portfolio transaction. By proceeding, you authorize the processing manifest architecture to record this allocation context onto your profile metadata ledger.
                        </p>
                        
                        <div class="form-check custom-check mb-3">
                            <input class="form-check-input" type="checkbox" id="terms" required>
                            <label class="form-check-label text-secondary small" for="terms">
                                I verify that the destination parameters match my specification.
                            </label>
                        </div>
                        
                        <div class="form-check custom-check">
                            <input class="form-check-input" type="checkbox" id="auth" required>
                            <label class="form-check-label text-secondary small" for="auth">
                                I accept the simulated transaction system acquisition terms.
                            </label>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="summary-sidebar">
                <span class="step-label">Order Manifest</span>
                
                <div class="order-items-mini mb-4">
                    <c:forEach items="${orderItems}" var="item">
                        <div class="manifest-row">
                            <div class="manifest-thumb-frame">
                                <c:choose>
                                    <c:when test="${not empty productImagesMap[item.product.id]}">
                                        <img src="${productImagesMap[item.product.id]}" alt="${item.product.name}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://images.unsplash.com/photo-1531403009284-440f080d1e12?q=80&w=60" alt="Fallback">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="flex-grow-1">
                                <div style="font-weight: 500; font-size: 0.9rem; line-height: 1.3; color: var(--text-primary);">${item.product.name}</div>
                                <small class="text-muted">Quantity: ${item.quantity}</small>
                            </div>
                            <div class="text-end" style="font-weight: 500; font-size: 0.9rem; color: var(--text-primary);">
                                ₹${item.priceAtPurchase * item.quantity}
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="costs">
                    <div class="item-row">
                        <span class="text-secondary">Subtotal</span>
                        <span class="text-primary">₹${subtotal}</span>
                    </div>
                    <div class="item-row">
                        <span class="text-secondary">Shipping & Logistics</span>
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
                
                <p class="text-center mt-4 text-muted mb-0" style="font-size: 0.6rem; letter-spacing: 1px; text-transform: uppercase;">
                    Verified Secure Transaction &middot; CarSell Financial Services
                </p>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addressModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background: var(--card); border: 1px solid var(--border); border-radius: 12px; padding: 15px;">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title" style="font-family: 'Cormorant Garamond', serif; font-size: 1.8rem; color: var(--accent);">New Destination Allocation</h5>
                <button type="button" class="btn-close btn-close-white opacity-50" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="text-secondary small mb-4">Provision a new delivery routing identifier for this transaction manifest framework.</p>
                
                <form id="inlineAddressForm">
                    <div class="mb-3">
                        <label class="small text-uppercase tracking-wider mb-1" style="font-size:0.65rem; color: var(--accent);">Street Address</label>
                        <input type="text" id="modalStreet" class="luxury-input" placeholder="e.g., 742 Evergreen Terrace" required>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label class="small text-uppercase tracking-wider mb-1" style="font-size:0.65rem; color: var(--accent);">City</label>
                            <input type="text" id="modalCity" class="luxury-input" placeholder="e.g., Springfield" required>
                        </div>
                        <div class="col-6 mb-3">
                            <label class="small text-uppercase tracking-wider mb-1" style="font-size:0.65rem; color: var(--accent);">State</label>
                            <input type="text" id="modalState" class="luxury-input" placeholder="e.g., IL" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label class="small text-uppercase tracking-wider mb-1" style="font-size:0.65rem; color: var(--accent);">Country</label>
                            <input type="text" id="modalCountry" class="luxury-input" placeholder="e.g., India" required>
                        </div>
                        <div class="col-6 mb-3">
                            <label class="small text-uppercase tracking-wider mb-1" style="font-size:0.65rem; color: var(--accent);">Pincode</label>
                            <input type="text" id="modalPincode" class="luxury-input" placeholder="e.g., 560001" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="small text-uppercase tracking-wider mb-1" style="font-size:0.65rem; color: var(--accent);">Phone Number</label>
                        <input type="tel" id="modalPhone" class="luxury-input" placeholder="e.g., +91 9876543210" required>
                    </div>
                    
                    <button type="button" id="submitInlineAddress" class="btn-pay mt-3 py-3">
                        Save and Apply Address <i class="bi bi-arrow-right ms-2"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
// Global Security Handshake Evaluation Setup FIRST
const csrfMeta = document.querySelector('meta[name="_csrf"]');
const csrfToken = csrfMeta ? csrfMeta.getAttribute('content') : '';

if (!csrfToken) {
    console.warn("Security warning: CSRF handshake token missing from global meta configuration context headers.");
}

const themeController = {
    init() {
        const saved = localStorage.getItem('carsell_theme');
        const themeToggle = document.getElementById('themeToggle');
        const icon = themeToggle.querySelector('i');

        if (saved === 'light') {
            document.body.classList.add('light');
            icon.classList.replace('bi-brightness-high', 'bi-moon-stars');
        }
        
        themeToggle.addEventListener('click', () => {
            const isLight = document.body.classList.toggle('light');
            localStorage.setItem('carsell_theme', isLight ? 'light' : 'dark');
            
            if (isLight) {
                icon.classList.replace('bi-brightness-high', 'bi-moon-stars');
            } else {
                icon.classList.replace('bi-moon-stars', 'bi-brightness-high');
            }
        });
    }
};

// Initialize Theme Systems
themeController.init();

// Asynchronous Address Pipeline Execution Trigger
document.getElementById('submitInlineAddress').addEventListener('click', async () => {
    const street = document.getElementById('modalStreet').value.trim();
    const city = document.getElementById('modalCity').value.trim();
    const state = document.getElementById('modalState').value.trim();
    const country = document.getElementById('modalCountry').value.trim();
    const pincode = document.getElementById('modalPincode').value.trim();
    const phone = document.getElementById('modalPhone').value.trim();

    if (!street || !city || !state || !country || !pincode || !phone) {
        alert("Please complete all required fields for delivery destination mapping.");
        return;
    }
    
    const formData = new URLSearchParams();
    formData.append('street', street);
    formData.append('city', city);
    formData.append('state', state);
    formData.append('country', country);
    formData.append('pincode', pincode);
    formData.append('phone', phone);
    formData.append('is_default', 'false');

    try {
        const response = await fetch('/users/address', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                'X-CSRF-TOKEN': csrfToken
            },
            body: formData.toString()
        });

        if (response.ok) {
            document.getElementById('addressDisplayContainer').innerHTML = `
                <div class="address-preview">
                    <p class="mb-1 text-primary">\${street}</p>
                    <p class="mb-0 text-secondary small">\${city}, \${state} \${pincode}</p>
                    <p class="mb-0 text-secondary small text-uppercase mt-1" style="font-size: 0.72rem; letter-spacing: 0.5px; color: var(--accent) !important;">\${country}</p>
                    <p class="mb-0 text-muted small mt-1"><i class="bi bi-telephone-fill me-1" style="font-size: 0.7rem;"></i> Contact: \${phone}</p>
                </div>
                <div class="mt-3">
                    <button type="button" class="btn p-0 small text-decoration-none d-flex align-items-center gap-1" style="color: var(--accent); border:none; background:transparent;" data-bs-toggle="modal" data-bs-target="#addressModal">
                        <i class="bi bi-geo-alt-fill"></i> Change Destination Location
                    </button>
                </div>
            `;
            
            document.getElementById('inlineAddressForm').reset();
            const modalElement = document.getElementById('addressModal');
            const modalInstance = bootstrap.Modal.getInstance(modalElement);
            modalInstance.hide();
        } else {
            alert("Error logging address context details. Please check form constraints.");
        }
    } catch (error) {
        console.error("Payload tracking fault:", error);
        alert("Failed to reach processing cluster. Verify internet status.");
    }
});
</script>
</body>
</html>