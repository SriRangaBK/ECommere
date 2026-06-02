<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Showroom | ClickNBuy Luxury</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;600&family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --bg: #0a0a0c;
            --surface: #121215;
            --card: #16161a;
            --border: rgba(255, 255, 255, 0.08);
            --accent: #d4af37; 
            --accent-glow: rgba(212, 175, 55, 0.2);
            --text-primary: rgb(255, 255, 255);
            --text-secondary: rgba(255, 255, 255, 0.7);
            --navbar-blur: rgba(10, 10, 12, 0.8);
        }

        body.light {
            --bg: #fdfcf9;
            --surface: #f4f1ea;
            --card: #ffffff;
            --border: rgba(0, 0, 0, 0.06);
            --accent: #926d27;
            --text-primary: #1c1917;
            --text-secondary: rgba(28, 25, 23, 0.7);
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

        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: var(--bg); }
        ::-webkit-scrollbar-thumb { background: var(--border); border-radius: 10px; }
        
        h1, h2, h3, h4, h5, h6, .product-name, .section-title {
            color: var(--text-primary);
        }

        p, label, .product-brand, .cart-text {
            color: var(--text-secondary);
        }

        .nav-link {
            color: var(--text-secondary) !important;
            transition: color 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--accent) !important;
        }

        .dropdown-item {
            color: var(--text-primary);
            transition: background 0.2s ease;
        }

        .dropdown-item:hover {
            background: var(--accent-glow);
            color: var(--accent);
        }

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

        .section-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 3rem;
            margin-bottom: 2rem;
        }

        .cart-card {
            background: var(--surface);
            border: 1px solid var(--border);
            padding: 25px;
            margin-bottom: 1.5rem;
            transition: 0.3s;
        }

        .cart-card:hover {
            border-color: var(--accent);
        }

        .price-value {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.4rem;
            color: var(--accent);
        }

        .cart-summary {
            background: var(--surface);
            border-top: 2px solid var(--accent);
            padding: 30px;
            margin-bottom: 3rem;
        }

        .btn-luxury {
            background: var(--accent);
            color: #000 !important;
            border: none;
            padding: 15px 40px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 0.8rem;
            font-weight: 700;
            transition: 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-luxury:hover {
            background: var(--text-primary);
            color: var(--bg) !important;
            transform: translateY(-3px);
        }

        .btn-outline-luxury {
            border: 1px solid var(--border);
            color: var(--text-secondary);
            padding: 12px 30px;
            text-transform: uppercase;
            font-size: 0.7rem;
            text-decoration: none;
            transition: 0.3s;
            display: inline-block;
        }

        .btn-outline-luxury:hover {
            color: var(--accent);
            border-color: var(--accent);
        }

        .btn-action {
            background: transparent;
            border: 1px solid var(--border);
            color: var(--text-primary);
            padding: 8px 16px;
            font-size: 0.8rem;
            transition: 0.3s;
        }
        
        .btn-action:hover {
            border-color: var(--accent);
            color: var(--accent);
        }

        .remove-link {
            color: #ff4d4d;
            font-size: 0.7rem;
            text-transform: uppercase;
            cursor: pointer;
            text-decoration: none;
            letter-spacing: 1px;
            display: inline-block;
            margin-top: 10px;
        }

        .vehicle-thumb-wrapper {
            width: 110px;
            height: 80px;
            background: var(--bg);
            border: 1px solid var(--border);
            border-radius: 4px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 4px;
            flex-shrink: 0;
            transition: border-color 0.25s ease;
        }

        .cart-card:hover .vehicle-thumb-wrapper {
            border-color: var(--accent);
        }

        .vehicle-thumb-img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            transition: transform 0.3s ease;
        }

        .cart-card:hover .vehicle-thumb-img {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">CarSell</a>
            
            <!-- Fixed bootstrap data-bs-target binding here -->
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navContent" aria-controls="navContent" aria-expanded="false" aria-label="Toggle navigation" style="color: var(--accent); font-size: 1.5rem;">
                <i class="bi bi-list"></i>
            </button>

            <div class="collapse navbar-collapse" id="navContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0ms-lg-3">
                    <li class="nav-item"><a class="nav-link active" href="/">Home</a></li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Categories
                        </a>
                        <ul class="dropdown-menu border-0 shadow" aria-labelledby="navbarDropdown" style="background: var(--surface); border: 1px solid var(--border) !important;">
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
                <button id="themeToggle" class="btn btn-link text-decoration-none px-2" style="color: var(--accent);">
                    <i class="bi bi-brightness-high" id="themeIcon"></i>
                </button>

                <div class="cart-icon px-3 py-2" onclick="location.href='/cart'" id="cartContainer" style="cursor:pointer; color: var(--text-primary); border: 1px solid var(--border); display: flex; align-items: center; gap: 8px; border-radius: 8px;">
                    <i class="bi bi-bag"></i>
                    <span id="cartCount" class="badge rounded-pill bg-danger text-white" style="font-size: 0.7rem; padding: 4px 7px; ${empty items ? 'display:none;' : ''}">
                        <c:out value="${items.size()}"/>
                    </span>
                </div>

                <c:choose>
                    <c:when test="${not empty user}">
                        <div class="dropdown">
                            <button class="btn btn-action dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="text-transform: uppercase; letter-spacing: 1px;">
                                <i class="bi bi-person-circle me-1"></i> ${user.name}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" style="background: var(--surface); border: 1px solid var(--border);">
                                <li><a class="dropdown-item" href="/profile" style="color: var(--text-primary);">My Profile</a></li>
                                <li><hr class="dropdown-divider bg-secondary"></li>
                                <li>
                                    <form action="/logout" method="post" class="m-0">
                                        <button type="submit" class="dropdown-item text-danger">Logout</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="/login" class="btn btn-action text-decoration-none">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>

<div class="container py-5">
    <div class="row">
        <div class="col-lg-8">
            <h1 class="section-title">Your Bag</h1>

            <c:choose>
                <c:when test="${empty items}">
                    <div class="text-center py-5" style="border: 1px dashed var(--border);">
                        <i class="bi bi-bag-x text-muted" style="font-size: 3rem;"></i>
                        <p class="mt-3 text-secondary fst-italic">Your showroom selection is empty.</p>
                        <a href="/" class="btn-luxury mt-4">Browse Showroom</a>
                    </div>
                </c:when>

                <c:otherwise>
                    <c:forEach items="${items}" var="item">
                        <div class="cart-card d-flex flex-column flex-sm-row align-items-start align-items-sm-center gap-4">
                            <div class="vehicle-thumb-wrapper">
                                <c:set var="currentProdId" value="${item.product.id}" />
                                <c:choose>
                                    <c:when test="${not empty productImagesMap[currentProdId]}">
                                        <img src="${productImagesMap[currentProdId]}" alt="${item.product.name}" class="vehicle-thumb-img">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://images.unsplash.com/photo-1531403009284-440f080d1e12?q=80&w=150" alt="Showroom Asset Pending" class="vehicle-thumb-img">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                            <div class="flex-grow-1">
                                <span class="small text-uppercase text-warning" style="letter-spacing: 2px; font-size: 0.75rem;">${item.product.brand}</span>
                                <h3 class="h5 mb-1" style="font-weight: 500;">${item.product.name}</h3>
                                <p class="mb-1 small">Quantity: ${item.quantity}</p>
                                <span class="remove-link" onclick="removeFromCart(${item.product.id})">
                                    <i class="bi bi-trash3 me-1"></i> Remove Selection
                                </span>
                            </div>

                            <div class="text-sm-end w-100 w-sm-auto mt-2 mt-sm-0">
                                <div class="price-value">₹${item.product.price}</div>
                                <p class="text-muted small mb-0">Excluding tax</p>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <div class="mt-4">
                        <a href="/" class="btn-outline-luxury">
                            <i class="bi bi-arrow-left me-2"></i> Continue Selection
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <c:if test="${not empty items}">
            <div class="col-lg-4 mt-5 mt-lg-0">
                <div class="cart-summary sticky-top" style="top: 120px; z-index: 10;">
                    <h2 class="h4 mb-4" style="font-family: 'Cormorant Garamond', serif; font-weight: 600;">Order Summary</h2>
                    
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-secondary">Subtotal</span>
                        <span class="text-primary" style="font-weight: 500;">
                            ₹<c:out value="${totalPrice != null ? totalPrice : 'Calculated at Checkout'}"/>
                        </span>
                    </div>
                    <div class="d-flex justify-content-between mb-4">
                        <span class="text-secondary">Logistics</span>
                        <span class="text-success small text-uppercase" style="letter-spacing: 1px; font-weight: 600;">Complimentary</span>
                    </div>

                    <hr style="border-color: var(--border); margin-bottom: 1.5rem;">
                    
                    <a href="/checkout" class="btn-luxury w-100 text-center">
                        Secure Checkout <i class="bi bi-chevron-right ms-2"></i>
                    </a>
                    
                    <p class="text-center mt-3 text-muted mb-0" style="font-size: 0.65rem; text-transform: uppercase; letter-spacing: 1px;">
                        <i class="bi bi-shield-lock-fill me-1"></i> Encrypted Transaction
                    </p>
                </div>
            </div>
        </c:if>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
function removeFromCart(productId) {
    if(!confirm("Are you sure you want to remove this vehicle from your selection?")) return;

    fetch("/cart/delete/" + productId, {
        method: "DELETE"
    })
    .then(response => {
        if(response.ok) {
            location.reload();
        } else {
            alert("Error updating bag.");
        }
    })
    .catch(error => console.error("Error operational context:", error));
}

const themeController = {
    init() {
        const saved = localStorage.getItem('carsell_theme');
        const icon = document.getElementById('themeIcon');
        
        if (saved === 'light') {
            document.body.classList.add('light');
            if(icon) {
                icon.classList.replace('bi-brightness-high', 'bi-moon');
            }
        }
        
        document.getElementById('themeToggle').addEventListener('click', () => {
            const isLight = document.body.classList.toggle('light');
            localStorage.setItem('carsell_theme', isLight ? 'light' : 'dark');
            
            if(icon) {
                if(isLight) {
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