<html>
<head>
    <title>add page </title>

</head>
<style>
    .submit-btn {
        float: right;
    }

    .form-container {
        width: 500px;
        margin: auto;
        padding: 20px;
        border: 1px solid #eee;
    }

    .form-field {
        margin-bottom: 10px;
        display: flex;
    }

    .form-field input {
        width: 100%;
        padding: 10px;
        border: 1px solid #eee;

    }

    .form-field input[type="submit"] {
        background-color: #2c74a8;
        border: 0;
        cursor: pointer;
        color: white;
        display: block;
        width: 80px;
    }

    .form-field input[type="submit"]:hover {
        background: #ccc;
        color: black;
    }


</style>
<body>
<h2> ${msg}</h2>
<div class="form-container">
    <form action="${pageContext.request.contextPath}/customer"
          method="post"
    >
        <div class="form-field">
            <input type="text" name="first_name" id="first_name" placeholder="first name" required>
            <input type="text" name="last_name" id="last_name" placeholder="last name" required>
        </div>
        <div class="form-field">
            <input type="text" name="street" placeholder="street">
            <input type="text" name="address" placeholder="address">
        </div>
        <div class="form-field">
            <input type="text" name="city" placeholder="city">
            <input type="text" name="state" placeholder="state">
        </div>
        <div class="form-field">
            <input type="text" name="email" placeholder="Email">
            <input type="text" name="phone" placeholder="phone">
        </div>
        <div class="form-field submit-btn">
            <input type="submit" value="submit">
        </div>
    </form>

    <div class="show-customer ">
        <a href="${pageContext.request.contextPath}/customer-list">show customer</a>
    </div>

</div>
</body>

</html>