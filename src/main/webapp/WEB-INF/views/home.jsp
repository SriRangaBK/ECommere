<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Products</title>

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

        body{
            background-color: #f5f5f5;
            padding-top: 90px;
        }

        .grid{
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 30px;
            justify-content: center;
        }

        .product-link{
            text-decoration: none;
            color: inherit;
        }

        .card-custom{
            width: 270px;
            height: 210px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;

            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: stretch;

            background-color: white;

            transition: transform 0.2s;
        }

        .card-custom:hover{
            transform: scale(1.03);
        }

        .card-body-custom{
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 10px;
        }

        .btn-custom{
            background-color: #0d6efd;
            color: white;
            border: none;
            padding: 8px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-custom:hover{
            background-color: #0b5ed7;
        }

        .theme-btn{
            border: none;
            background: transparent;
            margin-right: 20px;
            font-size: 1.2rem;
        }

        .cart{
            display: flex;
            align-items: center;
            gap: 10px;
        }

    </style>

</head>

<body>

<header>

    <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">

        <div class="container-fluid">

            <a class="navbar-brand" href="/">
                Telusko
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

                        <a
                            class="nav-link active"
                            href="/">

                            Home

                        </a>

                    </li>

                    <li class="nav-item">

                        <a
                            class="nav-link"
                            href="/add_product">

                            Add Product

                        </a>

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

                            <li>

                                <a
                                    class="dropdown-item"
                                    href="#">

                                    Cars

                                </a>

                            </li>

                            <li>

                                <a
                                    class="dropdown-item"
                                    href="#">

                                    Electronics

                                </a>

                            </li>

                        </ul>

                    </li>

                </ul>

                <button class="theme-btn">

                    <i class="bi bi-sun-fill"></i>

                </button>

                <div class="cart">

                    <i class="bi bi-cart">
                        Cart
                    </i>

                    <input
                        class="form-control"
                        type="search"
                        placeholder="Search">

                </div>

            </div>

        </div>

    </nav>

</header>

<div class="grid">

    <c:forEach items="${products}" var="product">

        <a
            href="/product/${product.id}"
            class="product-link">

            <div class="card-custom">

                <div class="card-body-custom">

                    <div>

                        <h5
                            style="
                                margin: 0 0 10px 0;
                                font-size: 1.2rem;">

                            ${product.name.toUpperCase()}

                        </h5>

                        <i
                            style="
                                font-style: italic;
                                font-size: 0.8rem;">

                            by ${product.brand}

                        </i>

                    </div>

                    <hr>

                    <div>

                        <h5
                            style="
                                font-weight: 600;
                                font-size: 1.1rem;">

                            <i class="bi bi-currency-rupee"></i>

                            ${product.price}

                        </h5>

                    </div>

                    <button class="btn-custom">

                        Add To Cart

                    </button>

                </div>

            </div>

        </a>

    </c:forEach>

</div>

</body>

</html>