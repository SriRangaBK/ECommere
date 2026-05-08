<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Product Details</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <style>

        body{
            background-color: #f5f5f5;
            padding: 40px;
        }

        .containers{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .right-column{
            width: 600px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .product-description span{
            color: #358ED7;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .product-description h1{
            font-size: 32px;
            margin-top: 10px;
        }

        .product-description h5{
            color: gray;
        }

        .product-description p{
            margin-top: 20px;
            line-height: 1.6;
        }

        .product-price{
            margin-top: 25px;
        }

        .product-price span{
            font-size: 28px;
            font-weight: bold;
        }

        .cart-btn{
            margin-left: 20px;
            padding: 10px 20px;
            border: none;
            background-color: #0d6efd;
            color: white;
            border-radius: 5px;
        }

        .disabled-btn{
            background-color: gray;
        }

        .update-button{
            margin-top: 30px;
            display: flex;
            gap: 15px;
        }

        .release-date{
            margin-top: 20px;
        }

    </style>

</head>

<body>

<div class="containers">

    <div class="right-column">

        <div class="product-description">

            <span>
                ${product.category}
            </span>

            <h1>
                ${product.name}
            </h1>

            <h5>
                ${product.brand}
            </h5>

            <p>
                ${product.description}
            </p>

        </div>

        <div class="product-price">

            <span>
                ₹ ${product.price}
            </span>

            <button
                class="cart-btn ${!product.productAvailable ? 'disabled-btn' : ''}"
                ${!product.productAvailable ? 'disabled' : ''}>

                ${product.productAvailable ? 'Add to Cart' : 'Out of Stock'}

            </button>

            <h6 style="margin-top:20px;">

                Stock Available :

                <i style="color:green; font-weight:bold;">

                    ${product.stockQuantity}

                </i>

            </h6>

            <div class="release-date">

                <h6>
                    Product listed on:
                </h6>

                <i>
                    ${product.releaseDate}
                </i>

            </div>

        </div>

        <div class="update-button">

            <button
                class="btn btn-primary">

                Update

            </button>

            <button
                class="btn btn-danger">

                Delete

            </button>

        </div>

    </div>

</div>

</body>

</html>