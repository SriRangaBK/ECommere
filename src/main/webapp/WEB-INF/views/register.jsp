<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            background: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .register-box {
            max-width: 500px;
            margin: 60px auto;
            background: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .title {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
            font-weight: bold;
        }

        .btn-custom {
            width: 100%;
        }

    </style>

</head>

<body>

<div class="register-box">

    <div class="title">
        Register User
    </div>

    <form action="/api/users" method="post">

        <div class="mb-3">
            <label class="form-label">Name</label>

            <input
                    type="text"
                    name="name"
                    class="form-control"
                    required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>

            <input
                    type="email"
                    name="email"
                    class="form-control"
                    required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>

            <input
                    type="password"
                    name="passwordHash"
                    class="form-control"
                    required>
        </div>

        <div class="mb-3">
            <label class="form-label">Role</label>

            <select
                    name="role"
                    class="form-select">

                <option value="customer">
                    Customer
                </option>

                <option value="admin">
                    Admin
                </option>

            </select>
        </div>

        <button
                type="submit"
                class="btn btn-dark btn-custom">

            Register
        </button>

    </form>

</div>

</body>
</html>