

<html>
<head>
    <title> My first HTML Page - JSP</title>

</head>
<style>
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        text-align: center;
    }

    .container {
        width: 100%;
        height: 100%;
        background-color: #f2f2f2;
    }

    header {
        width: 100%;
        height: 100px;
        background-color: #342934;
        color: white;
        text-align: center;
        padding-top: 30px;
    }

    .form {
        width: 100%;
        height: 100%;
        text-align: center;
        padding-top: 50px;
    }

    .form input {
        width: 200px;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #333333;
        margin-bottom: 10px;
    }

    .form button {
        width: 100px;
        height: 30px;
        border-radius: 3px;
        border: 1px solid #333333;
        margin-top: 10px;
        background-color: #0a0a23;
        color: #fff;

    }
    .field{
        display: block;
        margin: 0 auto;
    }


</style>
<body>
<div class="container">
    <header>
        <h1> Login page </h1>
    </header>

    <section class="form section">
        <h2> ${error}</h2>
        <form method="post" action="${pageContext.request.contextPath}/login">
            <label>
                <input type="text" class="input field" name="login_id" placeholder="login_id">
            </label>
            <br/>
            <label>
                <input type="password" class="input field" name="password" placeholder="Password">
            </label>
            <button type="submit" value="submit" class="btn field"> submit</button>
        </form>
    </section>
</div>
</body>
</html>