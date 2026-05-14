<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            padding: 30px;
        }

        .cart-container{
            width: 70%;
            margin: auto;
        }

        .cart-item{
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
        }

        .product-name{
            font-size: 20px;
            font-weight: bold;
        }

        .price{
            color: green;
            margin-top: 8px;
        }

        .quantity{
            margin-top: 8px;
        }
    </style>
</head>

<body>

<div class="cart-container">

    <h1>Your Cart</h1>

    <c:choose>

        <c:when test="${empty items}">
            <h3>Cart is Empty</h3>
        </c:when>

        <c:otherwise>

            <c:forEach items="${items}" var="item">

                <div class="cart-item">

                    <div class="product-name">
                        ${item.product.name}
                    </div>

                    <div class="price">
                        Price: ₹ ${item.product.price}
                    </div>

                    <div class="quantity">
                        Quantity: ${item.quantity}
                    </div>

                    <button 
                        onclick="removeFromCart(${item.product.id})"
                        style="
                            margin-top:10px;
                            padding:8px 12px;
                            background:red;
                            color:white;
                            border:none;
                            border-radius:5px;
                            cursor:pointer;
                        ">
                        Remove
                    </button>

                </div>

            </c:forEach>

        </c:otherwise>

    </c:choose>

</div>
<script>
function removeFromCart(productId) {

    fetch("/cart/delete/" + productId, {
        method: "DELETE"
    })
    .then(response => response.text())
    .then(data => {
        console.log(data);

        location.reload();
    })
    .catch(error => {
        console.error(error);
    });
}
</script>
</body>
</html>