<html>
<head>
    <title>update page </title>

</head>
<style>
    .update-btn {
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

    .form-field input[type="update"]:hover {
        background: #ccc;
        color: black;
    }


</style>
<body>
<h1> update page </h1>

<h2> ${msg}</h2>
<div class="form-container">
    <form action="${pageContext.request.contextPath}/updateCustomer"
          method="post">
        <div class="form-field">
            <input type="text" name="first_name" placeholder="first name" value="${customer.first_name}">
            <input type="text" name="last_name" placeholder="last name" value="${customer.last_name}">
        </div>
        <div class="form-field">
            <input type="text" name="street" placeholder="street" value="${customer.street}">
            <input type="text" name="address" placeholder="address" value="${customer.address}">
        </div>
        <div class="form-field">
            <input type="text" name="city" placeholder="city" value="${customer.city}">
            <input type="text" name="state" placeholder="state" value="${customer.state}">
        </div>
        <div class="form-field">
            <input type="text" name="email" placeholder="Email" value="${customer.email}">
            <input type="text" name="phone" placeholder="phone" value="${customer.phone}">
        </div>
        <div class="form-field update-btn">
            <input type="submit" value="update">
        </div>
    </form>

    <div class="show-customer ">
        <a href="${pageContext.request.contextPath}/customer-list">show customer</a>
    </div>

</div>
</body>

</html>