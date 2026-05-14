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
            --accent: #d4af37;
            --text-primary: #f8f6f2;
            --text-secondary: #a1a1aa;
        }

        body {
            background: var(--bg);
            color: var(--text-primary);
            font-family: 'DM Sans', sans-serif;
            margin: 0;
            overflow-x: hidden;
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
            top: 0;
            height: 100vh;
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
            padding: 80px 10%;
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

/* Reusing the gold button style but making it smaller for 'Edit' */
.btn-action {
    background: transparent;
    border: 1px solid var(--accent);
    color: var(--accent);
    font-size: 0.65rem;
    text-transform: uppercase;
    padding: 5px 15px;
    letter-spacing: 1px;
    transition: 0.3s;
}

.btn-action:hover {
    background: var(--accent);
    color: #000;
}

        /* --- Luxury Form Elements --- */
        .form-label {
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--accent);
            margin-bottom: 10px;
        }

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
            .profile-sidebar { width: 100%; height: auto; padding: 40px 20px; }
        }
    </style>
</head>

<body>

<div class="profile-container">
    <!-- Sidebar -->
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
                    <button class="nav-link-custom text-danger">
                        <i class="bi bi-box-arrow-right"></i> Sign Out
                    </button>
                </form>
            </div>
        </nav>
    </aside>

    <!-- Content Area -->
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
<!-- Section: Address Form -->
<div id="address" class="content-section">
    <h1 class="section-title">Shipping Context</h1>

    <c:choose>
        <%-- Case 1: Address Exists --%>
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

        <%-- Case 2: No Address Found --%>
        <c:otherwise>
            <div id="noAddressView" class="text-center p-5 mb-4" style="border: 1px dashed var(--border);">
                <p class="text-secondary italic">No shipping records found for this account.</p>
                <button class="btn-luxury mt-3" onclick="toggleAddressForm()">Add New Address</button>
            </div>
        </c:otherwise>
    </c:choose>

    <%-- Hidden Form: Revealed on Edit/Add --%>
    <div id="addressFormContainer" style="display: ${empty address ? 'none' : 'none'};">
        <div  class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="h4" style="font-family: 'Cormorant Garamond', serif;">Modify Records</h2>
            <button class="btn btn-link text-white p-0 text-decoration-none" onclick="toggleAddressForm()">Cancel</button>
        </div>

        <form action="api/users/address" method="post" style="max-width: 750px;">
            <!-- Hidden ID field for Updates -->
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
                        <input class="form-check-input" type="checkbox" name="default" id="isDefault" value="true" 
       <c:if test="${address['default']}">checked</c:if>>
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
            <h1 class="section-title">Order History</h1>
            <div class="p-5 text-center" style="border: 1px dashed var(--border);">
                <i class="bi bi-archive text-muted mb-3" style="font-size: 2rem;"></i>
                <p class="text-secondary italic">No vehicle orders have been processed yet.</p>
            </div>
        </div>

    </main>
</div>

<script>
function showSection(sectionId, btnElement) {
    // 1. Hide all sections with fade effect
    const sections = document.querySelectorAll('.content-section');
    sections.forEach(section => {
        section.classList.remove('active');
    });

    // 2. Remove active class from all buttons
    const buttons = document.querySelectorAll('.nav-link-custom');
    buttons.forEach(btn => {
        btn.classList.remove('active');
    });

    // 3. Show selected section and activate button
    document.getElementById(sectionId).classList.add('active');
    btnElement.classList.add('active');
}
function toggleAddressForm() {
    const displayCard = document.getElementById('addressDisplay');
    const emptyView = document.getElementById('noAddressView');
    const formContainer = document.getElementById('addressFormContainer');
    

    // Toggle logic
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
</script>

</body>
</html>